

```markdown
# Proxy Me Please

A simple Flutter application that demonstrates how to send HTTP and HTTPS requests and handle server responses.

---

## About The App

Proxy Me Please is a Flutter app with 3 screens.

The app allows users to:
- Send an HTTP request
- Send an HTTPS request
- Receive and display the server response
- See the status code and request time (Egypt local time)

This project is built for learning networking basics in Flutter.

---

## Features

Send HTTP request  
Send HTTPS request  
Display success or failure  
Show status code (200, 404, etc.)  
Show request time (local device time)  
Loading indicator for each button  
Clean UI (Material 3)  
Responsive design  

---

## Technologies Used

- Flutter
- Dart
- http package

---

## Project Structure

```

lib/
│
├── main.dart
│
├── core/
│   └── theme.dart
│
├── services/
│   └── api_service.dart
│
├── screens/
│   ├── home_screen.dart
│   ├── result_screen.dart
│   └── about_screen.dart
│
└── widgets/
└── custom_button.dart

```

---

## API Used

For testing requests:

- http://httpbin.org/get  
- https://httpbin.org/get  

---

## Installation

1. Clone the repository:

```

git clone [https://github.com/your-username/your-repo-name.git](https://github.com/your-username/your-repo-name.git)

```

2. Go to the project folder:

```

cd your-repo-name

```

3. Get dependencies:

```

flutter pub get

```

4. Run the app:

```

flutter run

```

---

## Build APK

To generate release APK:

```

flutter build apk --release

```

APK path:

```

build/app/outputs/flutter-apk/app-release.apk

```

---

## Purpose of This Project

This project was built to practice:

- HTTP networking in Flutter
- Async & Await
- Handling server responses
- Navigation between screens
- Clean architecture structure

---

## Author

Salah Hassan  

---

## License

This project is for educational purposes.
```

---

