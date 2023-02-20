// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import '../../helper/string_extention.dart';

class CorrectResponseFileName extends DartLintRule {
  CorrectResponseFileName() : super(code: _code);

  static const _code = LintCode(
    name: 'correct_response_file_name',
    problemMessage:
        "The file name '{0}' isn't a correct name for response file.",
    correctionMessage: 'Try changing the name that ends with "_response".',
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
          var classess = declaredElement.classes;

          for (var classInstance in classess) {
            var offset = classInstance.nameOffset;
            var length = classInstance.nameLength;

            if (path.isPathResponse()) {
              if (!path.isCorrectFileResponseName()) {
                reporter.reportErrorForOffset(_code, offset, length);
              }
            }
          }
        }
      },
    );
  }
}
