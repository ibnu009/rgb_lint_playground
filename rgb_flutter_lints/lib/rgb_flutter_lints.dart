library rgb_flutter_lints;

import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:rgb_flutter_lints/rules/correct_base_response_import_.dart';
import 'package:rgb_flutter_lints/rules/correct_enum_class_name.dart';
import 'package:rgb_flutter_lints/rules/correct_model_annotation.dart';
import 'package:rgb_flutter_lints/rules/correct_model_class_name.dart';
import 'package:rgb_flutter_lints/rules/correct_one_variable_for_lang.dart';
import 'package:rgb_flutter_lints/rules/correct_request_class_name.dart';
import 'package:rgb_flutter_lints/rules/correct_request_file_name.dart';
import 'package:rgb_flutter_lints/rules/correct_response_class_name.dart';
import 'package:rgb_flutter_lints/rules/correct_response_file_name.dart';
import 'package:rgb_flutter_lints/rules/prefer_single_class_per_file.dart';
import 'package:rgb_flutter_lints/rules/prefer_static_const_lang_variable.dart';
import 'package:rgb_flutter_lints/rules/prefer_upper_camel_case.dart';

import 'rules/correct_enum_file_name.dart';
import 'rules/correct_model_file_name.dart';
import 'rules/correct_service_annotation.dart';
import 'rules/correct_service_class_name.dart';
import 'rules/correct_service_file_name.dart';
import 'rules/prefer_final_providers.dart';

PluginBase createPlugin() => _RgbCustomLint();

class _RgbCustomLint extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
    PreferFinalProviders(),
    PreferSingleClassPerFile(),
    CorrectModelFileName(),
    CorrectModelAnnotation(),
    CorrectModelClassName(),

    CorrectServiceFileName(),
    CorrectServiceAnnotation(),
    CorrectServiceClassName(),

    CorrectEnumFileName(),
    CorrectEnumClassName(),

    CorrectBaseResponseImport(),
    CorrectOneVariableForLang(),
    CorrectRequestClassName(),
    CorrectRequestFileName(),
    CorrectResponseClassName(),
    CorrectResponseFileName(),
    PreferStaticConstLangVariable(),
    PreferUpperCamelCase(),
  ];
}