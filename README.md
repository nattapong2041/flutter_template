# flutter_template

A Template for flutter project.

## Table of Contents  
[Contact me](#contact)

[Localizationn](#localizations) 

[Model generate](#modelgen) 
<a name="contact"></a>
## Confuse somthing in project 
contact me: nattapong@dosetech.co

<a name="localizations"></a>
## Localization 
ref:https://docs.flutter.dev/development/accessibility-and-localization/internationalization

<p>you can edit write the language in lib/localization</p>

<p>you just need to run the project once for generate localization file in .dart_tool</p>


### usage 
example:
```
Text(AppLocalizations.of(context)!.helloWorld);
```
Changing locale anywhere in file
```
context.read<LocaleViewModel>().set(const Locale('en', ''));
```

<a name="modelgen"></a>
## Model generate 
ref:https://pub.dev/packages/freezed#how-to-use

<p>by using this method just write a simple line of code and then the generator will generate file for work with JSON with include</p> 

- define a constructor + the properties

- override toString, operator ==, hashCode

- implement a copyWith method to clone the object

- handling de/serialization

create model by following "lib/base/base_model.dart" file

use freezed for immutable and unfreezed for mutable class
```
@freezed
@unfreezed
```
after finished write model run the generator 
```
flutter pub run build_runner build
```