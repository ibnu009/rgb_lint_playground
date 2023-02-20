import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import '../helper/documentation_constants.dart';

class PreferSingleClassPerFile extends DartLintRule {
  PreferSingleClassPerFile() : super(code: _code);

  static const _code = LintCode(
    name: 'prefer_single_class_per_file_convention',
    problemMessage: '⚠️Theres only should be one class per file',
    correctionMessage:
        'Movie class to another file. \n\n See documentation:\n${DocumentationConstants.preferSingleClassPerFileConvention}',
    errorSeverity: ErrorSeverity.WARNING,
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
        var classess = declaredElement.classes;

        if (classess.length > 1) {
          for (var classInstance in classess) {
            var offset = classInstance.nameOffset;
            var length = classInstance.nameLength;

            reporter.reportErrorForOffset(code, offset, length);
          }
        }
      }
    });
  }
}
