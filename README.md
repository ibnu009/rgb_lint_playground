<img align="left" width="60" height="60" src="https://avatars1.githubusercontent.com/u/30823810?s=100&v=4"> </img>

**RollingGlory** is Company or Creative Digital Media studio based in Bandung, Indonesia.

&nbsp;
&nbsp;
## GloryConventionLint-Flutter
GloryConventionLint is judgment code for Convention lint in IDE Android Studio support Flutter.
&nbsp;



## Setup

#### Installing 
Don't forget to add this line ***glory_convention_lint: ^x.x.x*** to your pubspec.yaml file, and run ***flutter pub get*** from terminal.
~~~
dev_dependencies:
  glory_convention_lint: ^0.0.1
~~~

## Convention

#### Model Convention
* [Model class name convention](#model-class-name-convention)
* [Model file name convention](#model-file-name-convention)
* [Model annotation convention](#model-annotation-convention)
* [Prefer nullable for models convention](#prefer-nullable-for-models-convention)

#### Service Convention
* [Service class name convention](#1-service-class-name-convention)
* [Service file name convention](#2-service-file-name-convention)
* [Service annotation convention](#3-service-annotation-convention)

#### Enum Convention
* [Enum class name convention](#1-enum-class-name-convention)
* [Enum file name convention](#2-enum-file-name-convention)

#### Request Convention
* [Request class name convention](#1-request-class-name-convention)
* [Request file name convention](#2-request-file-name-convention)

#### Response Convention
* [Response class name convention](#1-response-class-name-convention)
* [Response file name convention](#2-response-file-name-convention)

#### Other Convention
* [Naming Convention](#1-naming-convention)
* [Prefer single class per file convention](#2-prefer-single-class-per-file-convention)    
* [Prefer static const lang variable convention](#3-prefer-static-const-lang-variable-convention)    
* [Base response import convention](#4-correct-base-response-import-convention) 
* [One variable for lang convention](#5-prefer-one-variable-for-language-convention) 

&nbsp;
---

#### Model Convention
#### Model class name convention
Ensure to add Model word at the end of class name in models file
~~~dart
//DO
class ProductModel {}
//DON'T
class ProductModel {}
~~~
#### Model file name convention
The file name for models must end with _model.dart
~~~dart
//DO
product_model.dart
//DON'T
product.dart
productmodel.dart
```
~~~
#### Model annotation convention
Add @JsonSerializable() from Retrofit to above your class model name
~~~dart
//DO
@JsonSerializable()
class ProductModel {
  int? id;
}
//DON'T
class ProductModel {
  int? id;
}
@JsonSerializable()
~~~
#### refer nullable for models convention
Fields of Model class is preferable to have nullable field. example : String? instead of String
~~~dart
//DO
  class Product {
  String? name;
  Product({this.name});
}
//DON'T
  class Product {
  String name;
  Product({this.name});
}
~~~

#### Service Convention
#### Service class name convention
Ensure to add Services word at the end of class name in models file
~~~dart
//DO
  class GiftServices{}
  class ProductServices{}
//DON'T
  class Gift{}
  class ProductService{} // singular instead of plural
~~~
#### Service file name convention
The file name for services must end with service.dart
~~~dart
//DO
  gift_services.dart
  product_services.dart
//DON'T
  product_service.dart //singular instead of plural
  ProductRequest.dart
~~~
#### Service annotation convention
Add @RestApi() from Retrofit to above your class service name
~~~dart
//DO
@RestApi() //RestApi Annotation is added
abstract class ProductServices {}
//DON'T
//Forget to add RestApi Annotation
abstract class ProductServices {}
~~~

#### Enum Convention
#### Enum class name convention
Ensure to add Enum word at the end of enum class name in the file.
~~~dart
//DO
enum AvatarEnum {}
//DON'T
enum EnumAvatar {}
~~~

#### Enum file name convention
Ensure to add _enum.dart prefix at the end of file name.
~~~dart
//DO
  gift_enum.dart
  product_enum.dart
//DON'T
  ProductEnum.dart
~~~

#### Request Convention
#### Request class name convention
Request class always end with "Request", and must use *PascalCase*.
~~~dart
//DO
class GiftRequest{}
class ProductRequest{}

//DON'T
class Gift{}
class product_request{}
~~~

#### Request file name convention
Request file must always end with "_request"  and should always use *snake_case* for file naming.
~~~
//DO
product_request.dart

//DON'T
ProductRequest.dart
~~~
Request file must always be put inside of request directory.
~~~
|- data
  |- network
    |- request
~~~
&nbsp;
#### Response Convention
#### Response class name convention
Response class always end with "Response", and must use *PascalCase*.
~~~dart
//DO
class GiftResponse{}
class ProductResponse{}

//DON'T
class Gift{}
class product_response{}
~~~

#### Response file name convention
Response file must always end with "_response"  and should always use *snake_case* for file naming.
~~~
//DO
product_response.dart

//DON'T
ProductResponse.dart
~~~
Response file must always be put inside of response directory.
~~~
|- data
  |- network
    |- response
~~~

&nbsp; 
#### Other Convention
#### Naming Convention 
<table>
    <tbody>
        <tr>
           <td rowspan=2>&nbsp;</td>
        </tr>
         <tr>
           <td>PascalCase</td>
           <td>CamelCase</td>
            <td>Plural</td>
           <td>Underscores</td>
           <td>Examples</td>
        </tr>
        <tr>
           <td>Class</td>
            <td>✅</td>
            <td></td>
            <td></td>
            <td></td>
            <td>class ModelResponse{}</td>
        </tr>
        <tr>
           <td>Service Class</td>
            <td>✅</td>
            <td></td>
            <td>✅</td>
            <td></td>
            <td>class ModelServices{}</td>
        </tr>
        <tr>
           <td>Constant Class</td>
            <td>✅</td>
            <td></td>
            <td>✅</td>
            <td></td>
            <td>class NetworkConstants{}</td>
        </tr>
        <tr>
           <td>Extension</td>
            <td>✅</td>
            <td></td>
            <td>✅</td>
            <td></td>
            <td>extension StringExtensions on String</td>
        </tr>
        <tr>
           <td>Field</td>
            <td></td>
            <td>✅</td>
            <td></td>
            <td></td>
            <td>int id;</td>
        </tr>
        <tr>
           <td>Variable</td>
            <td></td>
            <td>✅</td>
            <td></td>
            <td></td>
            <td>int variable;</td>
        </tr>
        <tr>
           <td>Local variable</td>
            <td></td>
            <td>✅</td>
            <td></td>
            <td>✅</td>
            <td>int _variable;</td>
        </tr>
        <tr>
           <td>Parameter</td>
            <td></td>
            <td>✅</td>
            <td></td>
            <td></td>
            <td>String param</td>
        </tr>
        <tr>
           <td>Method</td>
            <td></td>
            <td>✅</td>
            <td></td>
            <td></td>
            <td>void methodName(){}</td>
        </tr>
        <tr>
           <td>Local Method</td>
            <td></td>
            <td>✅</td>
            <td></td>
            <td>✅</td>
            <td>void _methodName(){}</td>
        </tr>
        <tr>
           <td>Enum Type</td>
            <td>✅</td>
            <td></td>
            <td></td>
            <td></td>
            <td>enum Status{}</td>
        </tr>  
    </tbody>
</table>

#### Prefer single class per file convention
Avoid Declaring multiple classes in one file. It is best practice to declare one class in one file instead of multiple of class in one files, to reduce
confusion. 
~~~dart
//DO
-- test.dart --
class One = {};

//DON'T
-- test.dart --
class One = {};
class Two = {};
~~~

#### Prefer static const lang variable convention
Declare variable as static const.
~~~dart
//DO
class One {
  static const variableOne = "Value"
}

//DON'T
class One {
  String variableOne = "Value";
}
~~~

#### Base response import convention
Both BaseResponse and BaseListResponse must be implemented and imported from rollingglory_codebase
When an application communicates to the backend via API calls, we usually receive two type of responses. single object and multi objects.
both types need to be implemented in service file, the service file is actually an abstract class that contains 
a set of methods which is needed in order to get data from API.
~~~dart
//DO
class One {
  Future<BaseListResponse<Episode>> getEpisodes();
  Future<BaseResponse<Episode>> getEpisodeDetail();
}

//DON'T
class One {
  Future<Episode> myMethod();
}
~~~

#### Prefer one variable for language convention
Ensure to separate the variable that represents a language, one class is supposed to have one variable.

~~~dart
//DO
-- languages/id_lang.dart --
Map<String,String> id = {};

-- languages/en_lang.dart --
Map<String,String> en = {};


//DON'T
-- languages.dart --
Map<String,String> id = {};
Map<String,String> en = {};
~~~

## Example

## Frequently Asked Questions
#### Can this work for java and kotlin languages?
*GloryConventionLint will automatically create rules for both languages.*
#### Can this be used for projects in my company?
Please this can be used for your company's project, with MIT License.
#### Does this work for an intellij java IDE?
*This might work for the Java Intelij IDE, but it's more recommended to use Intelij Android Studio*
#### Does this work for all versions of IDE Android Studio?
*This works for android studio 3.x.x, if you still use android studio 2.x.x please open ***Next to do***
&nbsp;
&nbsp;
### Other Information
You can follow us at <https://rollingglory.com/>
