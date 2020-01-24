# SFID Mobile

A new Flutter project.

## Getting Started

### This project implementing [Flutter Clean Architecture](https://pub.dev/packages/flutter_clean_architecture)

#### Configure .env file

Create your .env or copy and rename .env.example into .env with information below:

```
BASE_URL=https://private-5aea5-sfdbsi.apiary-mock.com/api/v1
```

#### Requirements

  - Flutter version: *1.9.1+hotfix.4*
  - Don't forget to run `flutter pub get`

### Convetions and MUST DOs

  #### Languange and Localization
  - Every text or string like informations, messages, etc. should be registered inside `lib/app/ui/res/string` and register them with key naming format `snake_case`.
  - After all registered then run `flutter pub run gen_lang:generate --source-dir=lib/app/ui/res/string --output-dir=lib/app/ui/res/generated --template-locale=id`
  - After done you can use the registered string like example: `S.of(context).login_error_message`
  - Convetions for naming key: `{pages}_{intention/functionality}`

