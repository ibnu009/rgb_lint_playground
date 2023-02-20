import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:rgb_flutter_lints/helper/string_extention.dart';

class EnumFileNameConvention extends DartLintRule {
  EnumFileNameConvention() : super(code: _code);

  static const _code = LintCode(
    name: 'enum_file_name_convention',
    problemMessage:
        "⚠️The file name isn't a correct name for enum file. file name should end with '_enum'",
    correctionMessage: 'Try changing the file name that ends with "_enum". Example: user_enum.dart',
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
          if (fileName.isPathEnum()) {
            if (!fileName.isCorrectFileEnumName()) {
              reporter.reportErrorForOffset(code, 0, 0);
            }
          }
          return;
        }

        var offset = classes.first.nameOffset;
        var length = classes.first.nameLength;
        if (fileName.isPathEnum()) {
          if (!fileName.isCorrectFileEnumName()) {
            reporter.reportErrorForOffset(code, offset, length);
          }
        }
      }
    });
  }
}
