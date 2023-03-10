// Copyright (c) 2023, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import '../../helper/string_extention.dart';
import '../helper/documentation_constants.dart';

class NetworkBaseResponseImportConvention extends DartLintRule {
  NetworkBaseResponseImportConvention() : super(code: _incorrectImport);

  static const _incorrectImport = LintCode(
      name: 'network_base_response_import_convention',
      problemMessage:
          '⚠️The BaseResponse and BaseListResponse must be imported from rollingglory_codebase',
      errorSeverity: ErrorSeverity.WARNING,
      correctionMessage:
          "See documentation:\n${DocumentationConstants.baseResponseImportConvention}");

  static const _baseNotImplementedError = LintCode(
    name: 'network_base_response_import_convention',
    problemMessage:
        "⚠️This method should implement BaseResponse or BaseListResponse",
    errorSeverity: ErrorSeverity.WARNING,
    correctionMessage:
        "Add BaseResponse or BaseListResponse to your method. \n\n See documentation:\n${DocumentationConstants.baseResponseImportConvention}",
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addCompilationUnit(
      (node) {
        var declaredElement = node.declaredElement;
        if (declaredElement != null) {
          var path = declaredElement.source.uri.path;
          if (path.isPathServices()) {
            var classes = declaredElement.classes;

            for (var element in classes) {
              for (var field in element.methods) {
                if (!field.toString().isCorrectUsingBaseResponse()) {
                  reporter.reportErrorForOffset(
                    _baseNotImplementedError,
                    field.nameOffset,
                    field.nameLength,
                  );
                }
              }
            }



            var imports = node.directives;
            for (var import in imports) {
              if (import.toString().isCorrectFileBaseResponse()) {
                if (!path.isPathRGBCodeBase()) {
                  reporter.reportErrorForOffset(
                    code,
                    import.offset,
                    import.length,
                  );
                }
              }
            }
          }
        }
      },
    );
  }
}
