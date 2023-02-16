import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:rgb_flutter_lints/helper/string_extention.dart';

class CorrectModelClassName extends DartLintRule {
  CorrectModelClassName() : super(code: _code);

  static const _code = LintCode(
    name: 'incorrect_model_class_name',
    problemMessage:
        "The class name isn't a correct name for model class. "
            "Model class should only contains their name without prefixes. Example: Gift, User",
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

        for (var classInstance in classes) {
          var offset = classInstance.nameOffset;
          var length = classInstance.nameLength;
          var name = classInstance.name;

          if (fileName.isPathModel()) {
            if (!name.isCorrectModelClassName()) {
              reporter.reportErrorForOffset(code, offset, length);
            }
          }
        }
      }
    });
  }
}
