// Copyright (c) 2023, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import '../../helper/string_extention.dart';
import '../helper/documentation_constants.dart';

class PreferOneVariableForLangConvention extends DartLintRule {
  PreferOneVariableForLangConvention() : super(code: _code);

  static const _code = LintCode(
    name: 'prefer_one_variable_for_lang_convention',
    problemMessage: '⚠️Only one variable is allowed for lang file',
    correctionMessage:
        'Try to remove unnecessary variables. \n\n See documentation:\n${DocumentationConstants.preferOneVariableForLanguageConvention}',
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
          var path = declaredElement.source.uri.path;
          if (path.isCorrectFileLang() && path.isPathLang()) {
            var variables = declaredElement.topLevelVariables;
            if (variables.length > 1) {
              for (int i = 1; i < variables.length; i++) {
                reporter.reportErrorForOffset(
                  _code,
                  variables[i].nameOffset,
                  variables[i].nameLength,
                );
              }
            }
          }
        }
      },
    );
  }
}
