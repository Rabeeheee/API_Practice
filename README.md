Flutter Assignment
A Flutter application implementing a Home Screen and Notifications Screen based on Figma designs, with JSON data fetching, parsing (optionally using isolates), navigation, and unit tests. The app fetches notification data from a provided API endpoint and displays it on the Notifications Screen, with robust error handling and state management.
Table of Contents

Project Overview
Features
Requirements
Setup Instructions
Project Structure
Dependencies
Implementation Details
Testing
Running the App
Assumptions and Choices
Error Handling
Future Improvements

Project Overview
This Flutter application fulfills the requirements of the Flutter Candidate Task. It consists of two screens:

Home Screen: Displays a user interface based on Figma designs, with a button to navigate to the Notifications Screen.
Notifications Screen: Fetches and displays notification data from a JSON API endpoint, parsed efficiently (optionally using isolates).

The app uses Provider for state management, Dio for HTTP requests, and includes unit tests for critical components. The project follows Flutter best practices, with a clean architecture and modular code structure.
Features

UI implementation of Home and Notifications Screens per Figma designs.
Fetches JSON data from the API endpoint: test-notifications.json.
Parses JSON data into a Dart model, with optional isolate-based parsing for performance.
Navigation between screens using named routes.
State management with Provider for efficient data handling.
Unit tests for JSON parsing, API service, and widget rendering.
Error handling for network issues, invalid JSON, and UI states.
Assets (images, fonts) exported from Figma and integrated.

Requirements

Flutter: Version 3.22.0 or higher.
Dart: Version 3.4.0 or higher.
IDE: VS Code, Android Studio, or IntelliJ IDEA.
Dependencies: Listed in pubspec.yaml (see Dependencies).
Figma Access: For design reference (link: Figma Design).
Internet: Required for fetching JSON data during development.

Setup Instructions

Clone the Repository:git clone <repository-url>
cd flutter_assignment


Install Dependencies:Run the following command to install required packages:flutter pub get


Export Figma Assets:
Access the Figma design: Figma Link.
Export images, icons, and fonts as needed.
Place assets in the assets/ directory (already included in this project).


Configure Assets:
```
Ensure pubspec.yaml includes asset paths:flutter:
  assets:
    - assets/images/
    - assets/fonts/

```


Run the App:
Connect a device or emulator/simulator.
Run:flutter run





Project Structure
The project follows a clean, modular structure for maintainability:
```
flutter_assignment/
├── assets/                    # Images, fonts from Figma
│   ├── images/
│   └── fonts/
├── lib/
│   ├── models/                # Data models (e.g., NotificationModel)
│   ├── screens/               # UI screens (HomeScreen, NotificationsScreen)
│   ├── services/              # API and parsing services (ApiService, JsonParser)
│   ├── providers/             # State management (NotificationProvider)
│   ├── utils/                 # Utilities (e.g., constants, helpers)
│   ├── routes/                # Navigation setup
│   └── main.dart              # App entry point
├── test/                      # Unit tests
│   ├── models/
│   ├── services/
│   └── widget_tests/
├── pubspec.yaml               # Dependencies and assets
└── README.md                  # Project documentation
```

Dependencies
Key dependencies in pubspec.yaml:

```
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.7.0                  # HTTP requests
  provider: ^6.1.2             # State management
  flutter_spinkit: ^5.2.1      # Loading indicators
  json_annotation: ^4.9.0      # JSON serialization
dev_dependencies:
  flutter_test:
    sdk: flutter
  mockito: ^5.4.4              # Mocking for tests
  build_runner: ^2.4.13        # Code generation
  json_serializable: ^6.8.0     # JSON serialization

```

Implementation Details
1. Design Implementation

Home Screen: Built with Scaffold, AppBar, and custom widgets to match Figma’s layout. Includes a button to navigate to the Notifications Screen.
Notifications Screen: Displays a list of notifications using ListView.builder, with each item styled per Figma (e.g., title, message, timestamp).
Assets (images, fonts) are integrated from Figma exports.

2. JSON Data Fetching

ApiService: Uses Dio to fetch JSON from the API endpoint.
Error handling for network failures (e.g., DioException) and HTTP errors (e.g., 404).

```
Example:class ApiService {
  final Dio _dio = Dio();
  Future<String> fetchNotifications() async {
    try {
      final response = await _dio.get('https://raw.githubusercontent.com/sayanp23/test-api/main/test-notifications.json');
      return response.data.toString();
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}

```

3. JSON Parsing

NotificationModel: A Dart class with json_serializable for JSON parsing.
JsonParser: Parses JSON into a list of NotificationModel objects.
Isolate Usage: Optionally uses Isolate.spawn to parse JSON in a background thread, preventing UI jank for large datasets.
```
Example:class JsonParser {
  static Future<List<NotificationModel>> parseJson(String jsonString) async {
    return await Isolate.run(() {
      final jsonData = jsonDecode(jsonString) as List;
      return jsonData.map((item) => NotificationModel.fromJson(item)).toList();
    });
  }
}
```


4. State Management

Provider: Manages notification data and loading/error states.
NotificationProvider: Fetches and parses data, notifies listeners on updates.
```
Example:class NotificationProvider with ChangeNotifier {
  List<NotificationModel> _notifications = [];
  bool _isLoading = false;
  String? _error;

  Future<void> fetchNotifications() async {
    _isLoading = true;
    notifyListeners();
    try {
      final jsonString = await ApiService().fetchNotifications();
      _notifications = await JsonParser.parseJson(jsonString);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}
```



5. Routing

Uses named routes for navigation.
```
Defined in routes.dart:final routes = {
  '/': (context) => const HomeScreen(),
  '/notifications': (context) => const NotificationsScreen(),
};
```

Navigation triggered via Navigator.pushNamed(context, '/notifications').

6. Isolate Justification

Isolates offload JSON parsing to a separate thread, reducing UI thread workload.
Beneficial for large JSON responses or low-end devices, ensuring smooth animations and responsiveness.

Testing
Unit tests are included in the test/ directory, covering:

Model Parsing: Tests NotificationModel.fromJson for correct deserialization.
ApiService: Mocks HTTP responses with Mockito to verify fetching.
Widget Tests: Verifies Home and Notifications Screen rendering.
Run tests:flutter test

```
Example test:test('Parse JSON to NotificationModel', () {
  final json = {'title': 'Test', 'message': 'Hello', 'timestamp': '2025-06-03'};
  final model = NotificationModel.fromJson(json);
  expect(model.title, 'Test');
});
```


Running the App

Ensure dependencies are installed (flutter pub get).
Connect a device or start an emulator/simulator.
Run:flutter run


Navigate from the Home Screen to the Notifications Screen to view fetched data.

Assumptions and Choices

State Management: Chose Provider for simplicity and scalability, suitable for this small app.
HTTP Client: Used Dio for its robust error handling and configurability over http.
Isolates: Included as an optimization, though the provided JSON is small, to demonstrate performance awareness.
Testing: Focused on critical components (parsing, API, widgets) to balance coverage and development time.
Assets: Assumed Figma exports are placed in assets/; included placeholders if unavailable.

Error Handling

Network Errors: Displays error messages (e.g., “No Internet”) using Provider state.
JSON Parsing Errors: Catches FormatException and shows fallback UI.
UI Feedback: Loading spinners (flutter_spinkit) and error alerts for user clarity.

Future Improvements

Add caching with Hive or SQLite for offline access.
Implement refresh functionality for the Notifications Screen.
Expand tests to include integration tests with a mock server.
Support dynamic theming based on Figma’s design system.

