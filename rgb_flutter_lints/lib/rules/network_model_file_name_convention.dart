import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:rgb_flutter_lints/helper/string_extention.dart';

class NetworkModelFileNameConvention extends DartLintRule {
  NetworkModelFileNameConvention() : super(code: _code);

  static const _code = LintCode(
    name: 'network_model_file_name_convention',
    problemMessage:
        "⚠️The file name isn't a correct name for model file. file name should end with '_model'",
    correctionMessage: 'Try changing the file name that ends with "_model". Example: user_model.dart',
      errorSeverity: ErrorSeverity.WARNING
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addCompilationUnit((node) {
      var declaredElement = node.declaredElement;
      if (declaredElement != null) {
        var fileName = declaredElement.source.uri.path;
        var classes = declaredElement.classes;

        if (classes.isEmpty){
          if (fileName.isPathModel()) {
            if (!fileName.isCorrectFileModelName()) {
              reporter.reportErrorForOffset(code, 0, 0);
            }
          }
          return;
        }

        var offset = classes.first.nameOffset;
        var length = classes.first.nameLength;
        if (fileName.isPathModel()) {
          if (!fileName.isCorrectFileModelName()) {
            reporter.reportErrorForOffset(code, offset, length);
          }
        }
      }
    });
  }
}
