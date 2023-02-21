// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import '../../helper/string_extention.dart';
import '../helper/documentation_constants.dart';

class NetworkRequestFileNameConvention extends DartLintRule {
  NetworkRequestFileNameConvention() : super(code: _code);

  static const _code = LintCode(
    name: 'network_request_file_name_convention',
    problemMessage:
        "⚠️The file name '{0}' isn't a correct name for request file.",
    correctionMessage:
        'Try changing the name that ends with "_request". \n\n See documentation:\n${DocumentationConstants.requestFileNameConvention}',
    errorSeverity: ErrorSeverity.WARNING,
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
          var fileName = declaredElement.source.shortName;
          var path = declaredElement.source.uri.path;
          var classess = declaredElement.classes;

          for (var classInstance in classess) {
            var offset = classInstance.nameOffset;
            var length = classInstance.nameLength;

            if (path.isPathRequest()) {
              if (!path.isCorrectFileRequestName()) {
                reporter.reportErrorForOffset(code, offset, length, [fileName]);
              }
            }
          }
        }
      },
    );
  }
}
