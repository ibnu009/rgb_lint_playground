library rgb_flutter_lints;

import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:rgb_flutter_lints/rules/enum_class_name_convention.dart';
import 'package:rgb_flutter_lints/rules/enum_file_name_convention.dart';
import 'package:rgb_flutter_lints/rules/network_model_annotation_convention.dart';
import 'package:rgb_flutter_lints/rules/network_model_class_name_convention.dart';
import 'package:rgb_flutter_lints/rules/network_model_file_name_convention.dart';
import 'package:rgb_flutter_lints/rules/network_model_json_implementation_convention.dart';
import 'package:rgb_flutter_lints/rules/network_service_annotation_convention.dart';
import 'package:rgb_flutter_lints/rules/network_service_class_name_convention.dart';
import 'package:rgb_flutter_lints/rules/network_service_file_name_convention.dart';
import 'package:rgb_flutter_lints/rules/prefer_nullable_model.dart';
import 'package:rgb_flutter_lints/rules/prefer_single_class_per_file.dart';

PluginBase createPlugin() => _RgbCustomLint();

class _RgbCustomLint extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
    PreferSingleClassPerFile(),

    NetworkModelFileNameConvention(),
    NetworkModelAnnotationConvention(),
    NetworkModelClassNameConvention(),
    NetworkModelJsonImplementationConvention(),
    PreferNullableModel(),

    NetworkServiceAnnotationConvention(),
    NetworkServiceClassNameConvention(),
    NetworkServiceFileNameConvention(),

    EnumFileNameConvention(),
    EnumClassNameConvention(),
  ];
}