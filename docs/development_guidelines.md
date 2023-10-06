We will try and stick to the following rules for maximum productivity

### 1. Use VS Code for development

1. VS Code is the recommended editor by Flutter
2. Flutter provides officially supported, regularly updated plugins for VS Code
3. VS Code being the most popular editor, will smooth out the process of on-boarding new team members
4. In our experience, android studio misses many warnings, which are usually minor optimisation problems, but can possibly be bugs that can cause trouble in the future

**Extensions** : Make sure you have the official *Dart* and *Flutter* plugins installed.

### 2. Keep zero errors and zero warnings

This essentially sums of all of the following points

#### 2.1 Use `dartdev.log()` instead of `print()`

`print('something')` will also print in release builds of the application which may expose sensitive information of the user during production use. Instead, we will use  `dartdev.log('something')`. Now this will usually not work normally. You will need to import a library using the following command :

```dart
import 'dart:developer' as dartdev show log;
```

Note:

1. We do not import this library directly and instead alias is as `dartdev`, to avoid cluttering the name space.
2. Why specifically aliased as `dartdev`? Just a convention for uniformity in our project.
3. `...show log;` This part exposes specifically the `log()` command. If you need access to more functions from this library, append them using commas, or remove this part altogether, which will import all functions as `dartdev.*` 

Note : `print()` may be used temporarily for testing locally but should not be pushed to git remote.

#### 2.2 `const` and `final` keywords

Use them wherever possible. `const` is needed for optimisation and `final` avoids unintentional overwriting of variables . Usually VS Code will suggest you to add these keywords where relevant.

### 3. Project folder structure

```
lib
├── constants
│   │── colors.dart
│   └── ...
├── firebase_options.dart
├── main.dart
├── screens
│   ├── authorisation
│   │   ├── reset_password.dart
│   │   ├── sign_in.dart
│   │   └── sign_up.dart
│   ├── home
│   │   └── homee.dart
│   ├── main_container.dart
│   │── main_tasks.dart
│   └── ...
├── styles.dart
└── widgets
    ├── app_bar.dart
    ├── reusable_widgets.dart
    ├── tasks.dart
    └── ...
```

- All constant definitions that are relevant outside one specific file must be declared in files inside the `/lib/constants` directory or inside it's sub-directoriers
- All UI Screens / Views go into the `/lib/screens` directory, or it's sub-directories
- All reusable widgets go inside the `/lib/widgets` directory, or it's sub-directories.

