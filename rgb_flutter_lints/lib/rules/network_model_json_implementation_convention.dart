import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:rgb_flutter_lints/helper/string_extention.dart';

import '../helper/documentation_constants.dart';

class NetworkModelJsonImplementationConvention extends DartLintRule {
  NetworkModelJsonImplementationConvention() : super(code: _code);

  static const _code = LintCode(
    name: 'network_model_json_implementation_convention',
    problemMessage: '⚠️Method toJson or fromJson is not implemented',
    correctionMessage:
        'See documentation:\n${DocumentationConstants.preferModelJsonImplementationConvention}',
    errorSeverity: ErrorSeverity.WARNING,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    bool isFromJsonImplemented(CompilationUnitMember compilationUnitMember) {
      if (compilationUnitMember.toString().contains('FromJson')) {
        return true;
      }
      return false;
    }

    bool isToJsonImplemented(CompilationUnitMember compilationUnitMember) {
      if (compilationUnitMember.toString().contains('ToJson')) {
        return true;
      }
      return false;
    }

    context.registry.addCompilationUnit(
      (node) {
        var declaredElement = node.declaredElement;
        var declarations = node.declarations;
        if (declaredElement != null && declarations.isNotEmpty) {
          var path = declaredElement.source.uri.path;

          if (path.isPathModel()) {
            for (var declaration in declarations) {
              if (!isFromJsonImplemented(declaration)) {
                reporter.reportErrorForOffset(
                    code, declaration.offset, declaration.length);
              }
              if (!isToJsonImplemented(declaration)) {
                reporter.reportErrorForOffset(
                    code, declaration.offset, declaration.length);
              }
            }
          }
        }
      },
    );
  }
}
