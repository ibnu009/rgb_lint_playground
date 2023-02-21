// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import '../../helper/string_extention.dart';
import '../helper/documentation_constants.dart';

class PreferPascalCaseConvention extends DartLintRule {
  PreferPascalCaseConvention() : super(code: _code);

  static const _code = LintCode(
    name: 'prefer_pascal_case_convention',
    problemMessage: "⚠️The type name '{0}' isn't an PascalCase identifier.",
    correctionMessage:
        'Try changing the name to follow the PascalCase style. example: GiftService. \n\n See documentation:\n ${DocumentationConstants.namingConvention}',
    errorSeverity: ErrorSeverity.WARNING,
  );

  @override
  void run(CustomLintResolver resolver, ErrorReporter reporter,
      CustomLintContext context) {
    void check(Token name) {
      var lexeme = name.lexeme;
      if (!lexeme.isUpperCamelCase()) {
        reporter.reportErrorForToken(
          _code,
          name,
          [lexeme],
        );
      }
    }

    context.registry.addClassDeclaration((node) {
      check(node.name);
    });
    context.registry.addClassTypeAlias((node) {
      check(node.name);
    });
    context.registry.addEnumDeclaration((node) {
      check(node.name);
    });
    context.registry.addFunctionTypeAlias((node) {
      check(node.name);
    });
    context.registry.addGenericTypeAlias((node) {
      check(node.name);
    });
    context.registry.addPatternVariableDeclaration((node) {
      //check(node.equals);
    });
    context.registry.addExtensionDeclaration(
      (node) {
        var name = node.name;
        if (name != null) {
          check(name);
        }
      },
    );
  }
}
