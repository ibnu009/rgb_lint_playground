library rgb_flutter_lints;

import 'package:analyzer/source/source_range.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:rgb_flutter_lints/rules/correct_model_annotation.dart';
import 'package:rgb_flutter_lints/rules/correct_model_class_name.dart';
import 'package:rgb_flutter_lints/rules/prefer_single_class_per_file.dart';

import 'rules/correct_model_file_name.dart';
import 'rules/prefer_final_providers.dart';

const _providerBaseChecker = TypeChecker.fromName(
  'ProviderBase',
  packageName: 'riverpod',
);

PluginBase createPlugin() => _RiverpodLint();

class _RiverpodLint extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
    PreferFinalProviders(),
    PreferSingleClassPerFile(),
    CorrectModelClassName(),
    CorrectModelFileName(),
    CorrectModelAnnotation()
  ];

  @override
  List<Assist> getAssists() => [_ConvertToStreamProvider()];
}

class _ConvertToStreamProvider extends DartAssist {
  @override
  void run(
      CustomLintResolver resolver,
      ChangeReporter reporter,
      CustomLintContext context,
      SourceRange target,
      ) {
    context.registry.addVariableDeclaration((node) {
      // Check that the visited node is under the cursor
      if (!target.intersects(node.sourceRange)) return;

      // verify that the visited node is a provider, to only show the assist on providers
      final element = node.declaredElement;
      if (element == null ||
          element.isFinal ||
          !_providerBaseChecker.isAssignableFromType(element.type)) {
        return;
      }

      final changeBuilder = reporter.createChangeBuilder(
        priority: 1,
        message: 'Convert to StreamProvider',
      );
      changeBuilder.addDartFileEdit((builder) {
        // TODO implement change to refactor the provider
      });
    });
  }
}