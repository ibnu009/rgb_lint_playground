import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:rgb_flutter_lints/helper/lint_type_constant.dart';
import 'package:rgb_flutter_lints/helper/string_extention.dart';

class EnumClassNameConvention extends DartLintRule {
  EnumClassNameConvention() : super(code: _code);

  static const _code = LintCode(
    name: 'enum_class_name_convention',
    problemMessage: "⚠️The class name isn't a correct name for enum class. "
        "Enum class should only contains their name without prefixes. Example: GiftEnum",
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
        var enums = declaredElement.enums;

        for (var enumInstance in enums) {
          var offset = enumInstance.nameOffset;
          var length = enumInstance.nameLength;
          var name = enumInstance.name;

          if (fileName.isPathEnum()) {
            if (!name.isCorrectClassEnumName()) {
              reporter.reportErrorForOffset(code, offset, length);
            }
          }
        }
      }
    });
  }

  @override
  List<Fix> getFixes() => [_RenameEnumsClass()];
}

class _RenameEnumsClass extends DartFix {
  @override
  void run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    AnalysisError analysisError,
    List<AnalysisError> others,
  ) {
    context.registry.addCompilationUnit((node) {
      var declaredElement = node.declaredElement;
      var enums = declaredElement?.enums;

      if (enums == null || enums.isEmpty) return;
      var className = enums.first.name;
      String correctName = className.renameClass(type: LintTypeConstant.enumLint);

      var offset = enums.first.nameOffset;
      var length = enums.first.nameLength;

      final changeBuilder = reporter.createChangeBuilder(
        message: 'Change to $correctName',
        priority: 1,
      );
      changeBuilder.addDartFileEdit((builder) {
        builder.addSimpleReplacement(
          SourceRange(offset, length),
          correctName,
        );
      });
    });
  }
}
