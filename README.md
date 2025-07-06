# Flutter Blueprint

A new Flutter bootstrapping project.

## Table of Contents

- [About The Project](#about-the-project)
- [Project Architecture](#project-architecture)
- [Project Structure Diagram](#project-structure-diagram)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## About The Project

This project serves as a robust starting point for new Flutter applications. It comes pre-configured with a clean architecture, essential libraries for common tasks, and a feature-based project structure to promote scalability and maintainability.

The primary goal of this blueprint is to accelerate the initial setup phase of a Flutter project, allowing developers to focus on building features rather than boilerplate code.

## Project Architecture

This project follows the principles of **Clean Architecture**. The core idea is to separate concerns by dividing the software into layers. This results in a system that is:

- **Independent of Frameworks:** The core business logic is not dependent on Flutter or any specific framework.
- **Testable:** Each layer can be tested independently.
- **Independent of UI:** The UI can change without affecting the rest of the system.
- **Independent of Database:** The choice of database or data source can be changed without affecting the business logic.
- **Independent of External Agencies:** Business logic knows nothing about the outside world.

The typical layers in each feature module are:

-   **Domain Layer:** Contains the core business logic, entities, and use cases. It is the most independent layer.
-   **Data Layer:** Responsible for data retrieval and storage. It implements the repository interfaces defined in the domain layer and handles communication with data sources (network, local database, etc.).
-   **Presentation Layer:** Contains the UI and state management logic (e.g., BLoCs/Cubits, Widgets). It depends on the domain layer to execute use cases and display data.

Dependency injection is managed using `get_it` to provide dependencies across these layers.

## Project Structure Diagram

```
flutter_blueprint/
├── .fvmrc                     # Flutter Version Management config
├── .gitignore                 # Git ignore file
├── README.md                  # This file
├── analysis_options.yaml      # Dart static analysis options
├── android/                   # Android specific project files
├── ios/                       # iOS specific project files
├── lib/                       # Main Dart application code
│   ├── main.dart              # Application entry point
│   └── src/                   # Source code
│       ├── core/              # Core utilities, configs, network, DI, etc.
│       │   ├── config/        # App configurations
│       │   ├── constants/     # Application constants
│       │   ├── di/            # Dependency injection setup
│       │   ├── network/       # Network call handling (e.g., Dio setup)
│       │   ├── themes/        # Application theming
│       │   └── utils/         # Core utility functions
│       ├── features/          # Feature-based modules
│       │   ├── authentication/  # Authentication feature
│       │   │   ├── data/        # Data layer (repositories, data sources)
│       │   │   ├── domain/      # Domain layer (entities, use cases, repository interfaces)
│       │   │   └── presentation/# Presentation layer (blocs, screens, widgets)
│       │   └── home/          # Home feature (similar structure)
│       │       ├── data/
│       │       ├── domain/
│       │       └── presentation/
│       └── shared/            # Shared widgets and utilities across features
│           ├── utils/
│           └── widgets/
├── plugins/                   # Local custom plugins
│   └── simple_storage/        # Custom plugin for simple key-value storage
├── pubspec.lock               # Generated file listing exact dependency versions
├── pubspec.yaml               # Project metadata and dependencies
├── test/                      # Automated tests
│   └── widget_test.dart       # Example widget test
└── web/                       # Web specific project files (if enabled)
```

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

-   Flutter SDK: Make sure you have Flutter installed. You can find installation instructions [here](https://flutter.dev/docs/get-started/install). This project uses FVM (Flutter Version Management), so ensure you have FVM installed.
    ```sh
    dart pub global activate fvm
    ```
-   IDE: Android Studio, IntelliJ IDEA, or VS Code with Flutter plugins.

### Installation

1.  **Clone the repo**
    ```sh
    git clone https://github.com/your_username/flutter_blueprint.git
    cd flutter_blueprint
    ```
2.  **Set up FVM**
    If this is the first time using FVM in this project, or if you need to ensure you're using the correct Flutter version defined in `.fvmrc`:
    ```sh
    fvm install
    fvm use
    ```
    You will now use `fvm flutter <command>` instead of `flutter <command>`. For example, `fvm flutter pub get`.
3.  **Install dependencies**
    ```sh
    fvm flutter pub get
    ```
4.  **Run the app**
    ```sh
    fvm flutter run
    ```

## Features

This blueprint includes the following features out-of-the-box:

-   **Authentication:** Basic structure for user sign-up, sign-in, and session management.
-   **Home Screen:** A placeholder home screen after successful authentication.
-   **Clean Architecture:** Organized code structure for better maintainability and scalability.
-   **Dependency Injection:** Using `get_it` for managing dependencies.
-   **State Management:** Using `flutter_bloc` for predictable state management.
-   **Navigation:** Using `go_router` for declarative routing.
-   **Network Calls:** Using `dio` for HTTP requests, with `pretty_dio_logger` for logging.
-   **Secure Storage:** Using `flutter_secure_storage` for sensitive data.
-   **Custom Local Plugin:** Example of a local plugin (`simple_storage`).

## Technologies Used

-   [Flutter](https://flutter.dev/) - UI toolkit for building natively compiled applications.
-   [Dart](https://dart.dev/) - Programming language used by Flutter.
-   [GetIt](https://pub.dev/packages/get_it) - Service Locator for Dart and Flutter.
-   [Flutter BLoC](https://pub.dev/packages/flutter_bloc) - State management library.
-   [Dio](https://pub.dev/packages/dio) - HTTP client for Dart.
-   [GoRouter](https://pub.dev/packages/go_router) - Declarative routing package.
-   [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage) - Secure data storage.
-   [Equatable](https://pub.dev/packages/equatable) - Simplify equality comparisons.
-   [Flutter SVG](https://pub.dev/packages/flutter_svg) - SVG rendering.
-   [Flutter Gen](https://pub.dev/packages/flutter_gen) - Assets code generator.
-   [Pretty Dio Logger](https://pub.dev/packages/pretty_dio_logger) - Dio logger.
-   [Cached Network Image](https://pub.dev/packages/cached_network_image) - Cache network images.
-   [Internet Connection Checker](https://pub.dev/packages/internet_connection_checker) - Check internet connectivity.
-   [FVM (Flutter Version Management)](https://fvm.app/) - Manage multiple Flutter SDK versions.

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

Please ensure your code adheres to the project's coding standards and all tests pass.

## License

Distributed under the MIT License. See `LICENSE` file for more information. (Note: You might need to create a LICENSE file if one doesn't exist or specify the license directly).

## Contact

**Syed Refat**
- LinkedIn: [https://www.linkedin.com/in/syedrefat](https://www.linkedin.com/in/syedrefat)
- GitHub: [https://github.com/bluetoothfx](https://github.com/bluetoothfx)

**Sakhawat Hossain**
- LinkedIn: [https://www.linkedin.com/in/sakhawat-hossain-762688127](https://www.linkedin.com/in/sakhawat-hossain-762688127)
- GitHub: [https://github.com/shakiz](https://github.com/shakiz)
