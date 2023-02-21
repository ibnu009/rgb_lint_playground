// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import '../../helper/string_extention.dart';
import '../helper/documentation_constants.dart';

class PreferCamelCaseConvention extends DartLintRule {
  PreferCamelCaseConvention() : super(code: _code);

  static const _code = LintCode(
    name: 'prefer_camel_case_convention',
    problemMessage: "⚠️The type name '{0}' isn't an CamelCase identifier.",
    correctionMessage:
        'Try changing the name to follow the CamelCase style. example: userPassword. \n\n See documentation:\n ${DocumentationConstants.namingConvention}',
    errorSeverity: ErrorSeverity.WARNING,
  );

  @override
  void run(CustomLintResolver resolver, ErrorReporter reporter,
      CustomLintContext context) {
    void check(Token name) {
      var lexeme = name.lexeme;
      if (!lexeme.isLowerCamelCase()) {
        reporter.reportErrorForToken(
          _code,
          name,
          [lexeme],
        );
      }
    }
    context.registry.addPatternVariableDeclaration((node) {
      check(node.equals);
    });
    context.registry.addVariableDeclaration((node) {
      check(node.name);
    });
  }
}
