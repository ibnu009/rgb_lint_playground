import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:rgb_flutter_lints/helper/documentation_constants.dart';
import 'package:rgb_flutter_lints/helper/string_extention.dart';

class NetworkNullableModelConvention extends DartLintRule {
  NetworkNullableModelConvention() : super(code: _code);

  static const _code = LintCode(
      name: 'network_nullable_model_convention',
      problemMessage: '⚠️Implement nullable attributes for models',
      correctionMessage:
          'add nullable <ex:String?> to models\'s attributes. \n\n See documentation: ${DocumentationConstants.preferNullableForModelsConvention}',
      errorSeverity: ErrorSeverity.WARNING);

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addCompilationUnit((node) {
      var declaredElement = node.declaredElement;
      if (declaredElement != null) {
        var path = declaredElement.source.uri.path;
        if (path.isCorrectFileModelName() && path.isPathModel()) {
          for (var element in declaredElement.classes) {
            for (var field in element.fields) {
              if (!field.toString().isCorrectVariableNullable()) {
                reporter.reportErrorForOffset(
                    code, field.nameOffset, field.nameLength);
              }
            }
          }
        }
      }
    });
  }
}