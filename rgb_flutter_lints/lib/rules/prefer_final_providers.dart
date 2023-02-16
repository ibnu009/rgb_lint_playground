
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

const _providerBaseChecker = TypeChecker.fromName(
  'ProviderBase',
  packageName: 'riverpod',
);

class PreferFinalProviders extends DartLintRule {
  PreferFinalProviders() : super(code: _code);

  /// Metadata about the lint define. This is the code which will show-up in the IDE,
  /// and its description..
  static const _code = LintCode(
    name: 'riverpod_final_provider',
    problemMessage: 'Providers should be declared using the `final` keyword.',
  );

  /// The core logic for our custom lint rule.
  /// In our case, it will search over all variables defined in a Dart file and
  /// search for the ones that implement a specific type (see [__providerBaseChecker]).
  @override
  void run(
      // This object contains metadata about the analyzed file
      CustomLintResolver resolver,
      // ErrorReporter is for submitting lints. It contains utilities to specify
      // where the lint should show-up.
      ErrorReporter reporter,
      // This contains various utilities, including tools for inspecting the content
      // of Dart files in an efficient manner.
      CustomLintContext context,
      ) {
    // Using this function, we search for [VariableDeclaration] reference the
    // analyzed Dart file.
    context.registry.addVariableDeclaration((node) {
      final element = node.declaredElement;
      if (element == null ||
          element.isFinal ||
          // We check that the variable is a Riverpod provider
          !_providerBaseChecker.isAssignableFromType(element.type)) {
        return;
      }

      // This emits our lint warning at the location of the variable.
      reporter.reportErrorForElement(code, element);
    });
  }

  /// [LintRule]s can optionally specify a list of quick-fixes.
  ///
  /// Fixes will show-up in the IDE when the cursor is above the warning. And it
  /// should contain a message explaining how the warning will be fixed.
  @override
  List<Fix> getFixes() => [_MakeProviderFinalFix()];
}

class _MakeProviderFinalFix extends DartFix {

  @override
  void run(
      CustomLintResolver resolver,
      ChangeReporter reporter,
      CustomLintContext context,
      AnalysisError analysisError,
      List<AnalysisError> others,
      ) {
    context.registry.addVariableDeclarationList((node) {
      if (!analysisError.sourceRange.intersects(node.sourceRange)) return;
      final changeBuilder = reporter.createChangeBuilder(
        message: 'Make provider final',
        priority: 1,
      );
      changeBuilder.addDartFileEdit((builder) {
        final nodeKeyword = node.keyword;
        final nodeType = node.type;
        if (nodeKeyword != null) {
          // Replace "var x = ..." into "final x = ...""

          // Using "builder", we can emit changes to a file.
          // In this case, addSimpleReplacement is used to overrite a selection
          // with a new content.
          builder.addSimpleReplacement(
            SourceRange(nodeKeyword.offset, nodeKeyword.length),
            'final',
          );
        } else if (nodeType != null) {
          // Replace "Type x = ..." into "final Type x = ..."

          // Once again we emit an edit to our file.
          // But this time, we add new content without replacing existing content.
          builder.addSimpleInsertion(nodeType.offset, 'final ');
        }
      });
    });
  }
}