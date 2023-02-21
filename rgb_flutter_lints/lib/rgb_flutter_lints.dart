library rgb_flutter_lints;

import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'package:rgb_flutter_lints/rules/enum_class_name_convention.dart';
import 'package:rgb_flutter_lints/rules/enum_file_name_convention.dart';
import 'package:rgb_flutter_lints/rules/network_base_response_import_convention.dart';
import 'package:rgb_flutter_lints/rules/network_model_annotation_convention.dart';
import 'package:rgb_flutter_lints/rules/network_model_class_name_convention.dart';
import 'package:rgb_flutter_lints/rules/network_model_file_name_convention.dart';
import 'package:rgb_flutter_lints/rules/network_model_json_implementation_convention.dart';
import 'package:rgb_flutter_lints/rules/network_nullable_model_convention.dart';
import 'package:rgb_flutter_lints/rules/network_request_class_name_convention.dart';
import 'package:rgb_flutter_lints/rules/network_request_file_name_convention.dart';
import 'package:rgb_flutter_lints/rules/network_response_class_name_convention.dart';
import 'package:rgb_flutter_lints/rules/network_response_file_name_convention.dart';
import 'package:rgb_flutter_lints/rules/network_service_annotation_convention.dart';
import 'package:rgb_flutter_lints/rules/network_service_class_name_convention.dart';
import 'package:rgb_flutter_lints/rules/network_service_file_name_convention.dart';
import 'package:rgb_flutter_lints/rules/prefer_camel_case_convention.dart';
import 'package:rgb_flutter_lints/rules/prefer_one_variable_for_lang_convention.dart';
import 'package:rgb_flutter_lints/rules/prefer_pascal_case_convention.dart';
import 'package:rgb_flutter_lints/rules/prefer_single_class_per_file_convention.dart';
import 'package:rgb_flutter_lints/rules/prefer_single_enum_per_file_convention.dart';
import 'package:rgb_flutter_lints/rules/prefer_static_const_lang_variable_convention.dart';

PluginBase createPlugin() => _RgbCustomLint();

class _RgbCustomLint extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
    NetworkModelFileNameConvention(),
    NetworkModelAnnotationConvention(),
    NetworkModelClassNameConvention(),
    NetworkModelJsonImplementationConvention(),
    NetworkNullableModelConvention(),

    NetworkServiceAnnotationConvention(),
    NetworkServiceClassNameConvention(),
    NetworkServiceFileNameConvention(),

    NetworkResponseClassNameConvention(),
    NetworkResponseFileNameConvention(),

    NetworkRequestClassNameConvention(),
    NetworkRequestFileNameConvention(),

    EnumFileNameConvention(),
    EnumClassNameConvention(),

    NetworkBaseResponseImportConvention(),
    PreferOneVariableForLangConvention(),

    PreferPascalCaseConvention(),
    PreferCamelCaseConvention(),
    PreferStaticConstLangVariable(),
    PreferSingleClassPerFile(),
    PreferSingleEnumPerFile(),
  ];
}