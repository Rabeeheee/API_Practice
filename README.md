# Flutter Notifications App

## Overview

A two-screen Flutter application built to demonstrate skills in API integration, UI implementation from Figma designs, JSON parsing, state management, and performance optimization. The application displays a home screen and a notifications screen that fetches and renders JSON data from an external API.

## Features

* **Home Screen**: Designed based on provided Figma mockups
* **Notifications Screen**: Fetches and displays data from a public API
* **API Integration**: Connects to external JSON endpoint using `http`
* **JSON Parsing**: Efficiently parses remote data, optionally using Dart isolates
* **State Management**: Uses `Provider` or `Bloc` for managing app state
* **Error Handling**: Gracefully handles API and network failures
* **Routing**: Navigates between screens using named routes
* **Optional Unit Testing**: Includes unit tests for API services and JSON parsing logic

## Screenshots

[Add screenshots here]

## Technologies Used

* Flutter (latest version)
* HTTP Package for API calls
* Provider / Bloc for state management
* Dart Isolates (optional, for performance)
* Flutter Test for unit testing (optional)

## Project Structure

# Flutter Notifications App

## Overview

A two-screen Flutter application built to demonstrate skills in API integration, UI implementation from Figma designs, JSON parsing, state management, and performance optimization. The application displays a home screen and a notifications screen that fetches and renders JSON data from an external API.

## Features

* **Home Screen**: Designed based on provided Figma mockups
* **Notifications Screen**: Fetches and displays data from a public API
* **API Integration**: Connects to external JSON endpoint using `http`
* **JSON Parsing**: Efficiently parses remote data, optionally using Dart isolates
* **State Management**: Uses `Provider` or `Bloc` for managing app state
* **Error Handling**: Gracefully handles API and network failures
* **Routing**: Navigates between screens using named routes
* **Optional Unit Testing**: Includes unit tests for API services and JSON parsing logic

## Screenshots

[Add screenshots here]

## Technologies Used

* Flutter (latest version)
* HTTP Package for API calls
* Provider / Bloc for state management
* Dart Isolates (optional, for performance)
* Flutter Test for unit testing (optional)

## Project Structure

```
lib/
├── models/ # Data models
│ └── notification_model.dart
├── screens/ # UI screens
│ ├── home_screen.dart
│ └── notifications_screen.dart
├── services/ # API service layer
│ └── api_service.dart
├── state/ # State management files
│ └── notification_provider.dart
├── utils/ # Utility classes
│ └── json_parser.dart
└── main.dart # Entry point and routing
test/
└── (unit and widget test files)
```

## Getting Started

### Prerequisites

* Flutter SDK (3.x recommended)
* Dart SDK
* Code editor (VS Code, Android Studio, etc.)

### Installation

1. Clone the repository:

```
https://github.com/Rabeeheee/API_Practice.git
```
2. Navigate into the project directory:

```
cd Rabeeheee/API_Practice
```

3. Install dependencies:

```
flutter pub get
```
4. Run the app:

```
flutter run
```
## Features Implementation Details

### Home Screen

* Basic layout built with reference to the Figma design
* Navigation button to the notifications screen

### Notifications Screen

* Fetches JSON data from the API endpoint:

```
https://raw.githubusercontent.com/sayanp23/test-api/main/test-notifications.json
```
* Parses the data using custom model classes
* Uses Dart isolates for background parsing (optional)
* Displays the notification list in a scrollable layout

## State Management

This application uses `Provider` or `Bloc` to manage state and keep UI logic separate from business logic. This ensures better scalability and maintainability of the app.

## JSON Parsing & Isolates

* JSON is parsed into model classes using a clean and modular structure
* Optionally uses Dart `compute()` or isolates to perform parsing off the main thread for improved performance on large datasets

## Testing

The app includes optional unit and widget tests to verify API integration and data parsing. Tests are written using the `flutter_test` package.

To run tests:
```
flutter test
```

## UI/UX Design

The UI is based on the Figma mockups provided at:

[Figma Design Link](https://www.figma.com/file/sgB0RGsV3oaZzOYVHQaZs7/Flutter-Assignment)

All assets and styles are implemented according to the design specifications.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b `)
3. Commit your changes (`git commit -m `)
4. Push to the branch (`git push origin `)
5. Open a Pull Request

## Acknowledgments

* Flutter team for providing the development framework
* API hosted on GitHub by [sayanp23](https://github.com/sayanp23)
* Figma design resource for the UI prototype

```

git clone https://github.com/Rabeeheee/API_Practice.git
cd API_Practice
```
