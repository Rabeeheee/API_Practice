# Flutter Notifications App

A Flutter application built to demonstrate fetching, parsing, and displaying JSON data from an API with a user interface designed according to provided Figma mockups. The app includes two primary screens: a Home Screen and a Notifications Screen. It also features routing, optional performance optimization using isolates, and optional testing.

## Features

- Home screen based on Figma design
- Notifications screen displaying JSON data from a remote API
- API integration using the `http` package
- Optional performance enhancement using Dart isolates for background JSON parsing
- State management using Provider or an equivalent solution
- Navigation between screens using named routes
- Graceful error handling for network and parsing issues
- Optional unit and widget tests

## Screens

1. **Home Screen**  
   Provides navigation to the Notifications screen.

2. **Notifications Screen**  
   Fetches data from the API and displays a list of notifications.

## Dependencies

The following dependencies are used in this project:

yaml
dependencies:
  flutter:
    sdk: flutter

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.8
  equatable: ^2.0.7
  internet_connection_checker: ^3.0.1
  http: ^1.4.0
  dartz: ^0.10.1
  get_it: ^8.0.3
  bloc: ^9.0.0
  flutter_bloc: ^9.1.1
  intl: ^0.20.2
  timeago: ^3.7.1
  iconify_flutter: ^0.0.7
  google_fonts: ^6.2.1

dev_dependencies:
  flutter_test:
    sdk: flutter

Project Structure
lib/
├── core/
│   ├── constants/
│   │   ├── api_constants.dart
│   │   └── app_constants.dart
│   ├── errors/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network/
│   │   ├── network_info.dart
│   │   └── api_client.dart
│   ├── routes/
│   │   └── app_router.dart
│   ├── themes/
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   └── app_theme.dart
│   └── utils/
│       ├── isolate_parser.dart
│       └── json_parser.dart
├── data/
│   ├── datasources/
│   │   ├── notification_local_data_source.dart
│   │   └── notification_remote_data_source.dart
│   ├── models/
│   │   └── notification_model.dart
│   └── repositories/
│       └── notification_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── notification_entity.dart
│   ├── repositories/
│   │   └── notification_repository.dart
│   └── usecases/
│       └── get_notifications.dart
├── presentation/
│   ├── bloc/
│   │   ├── home/
│   │   │   ├── home_bloc.dart
│   │   │   ├── home_event.dart
│   │   │   └── home_state.dart
│   │   └── notifications/
│   │       ├── notifications_bloc.dart
│   │       ├── notifications_event.dart
│   │       └── notifications_state.dart
│   ├── screens/
│   │   ├── home/
│   │   │   ├── home_screen.dart
│   │   │   └── widgets/
│   │   │       ├── home_app_bar.dart
│   │   │       └── notification_button.dart
│   │   └── notifications/
│   │       ├── notifications_screen.dart
│   │       └── widgets/
│   │           ├── notification_item.dart
│   │           └── notification_list.dart
│   └── widgets/
│       ├── error_widget.dart
│       └── loading_widget.dart
├── di/
│   └── injection_container.dart
└── main.dart


git clone https://github.com/Rabeeheee/API_Practice.git
cd API_Practice
