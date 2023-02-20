//Always make sure to end with #
const baseDocumentationUrl =
    "https://github.com/ibnu009/rgb_lint_playground/blob/master/README.md#";

class DocumentationConstants {

  // network
  static const modelClassNameConvention =
      "${baseDocumentationUrl}network-model-class-name-convention";
  static const modelFileNameConvention =
      "${baseDocumentationUrl}network-model-file-name-convention";
  static const modelAnnotationConvention =
      "${baseDocumentationUrl}network-model-annotation-convention";
  static const preferNullableForModelsConvention =
      "${baseDocumentationUrl}network-nullable-models-convention";
  static const serviceClassNameConvention =
      "${baseDocumentationUrl}network-service-class-name-convention";
  static const serviceFileNameConvention =
      "${baseDocumentationUrl}network-service-file-name-convention";
  static const serviceAnnotationConvention =
      "${baseDocumentationUrl}network-service-annotation-convention";
  static const requestClassNameConvention =
      "${baseDocumentationUrl}network-request-class-name-convention";
  static const requestFileNameConvention =
      "${baseDocumentationUrl}network-request-file-name-convention";
  static const responseClassNameConvention =
      "${baseDocumentationUrl}network-response-class-name-convention";
  static const responseFileNameConvention =
      "${baseDocumentationUrl}network-response-file-name-convention";
  static const preferModelJsonImplementationConvention =
      "${baseDocumentationUrl}network_model_json_implementation_convention";
  static const baseResponseImportConvention =
      "${baseDocumentationUrl}network-base-response-import-convention";

  //enum
  static const enumClassNameConvention =
      "${baseDocumentationUrl}enum-class-name-convention";
  static const enumFileNameConvention =
      "${baseDocumentationUrl}enum-file-name-convention";
  static const preferSingleEnumConvention =
      "${baseDocumentationUrl}prefer_single_enum_per_file_convention";

  // others
  static const namingConvention = "${baseDocumentationUrl}naming-convention"; // rule?
  static const preferSingleClassPerFileConvention =
      "${baseDocumentationUrl}prefer-single-class-per-file-convention";
  static const preferStaticConstLangVariableConvention =
      "${baseDocumentationUrl}prefer-static-const-lang-variable-convention";
  static const preferOneVariableForLanguageConvention =
      "${baseDocumentationUrl}prefer-one-variable-for-language-convention";
}
