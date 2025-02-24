# FLoC App

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![C++](https://img.shields.io/badge/C++-00599C?style=for-the-badge&logo=cplusplus&logoColor=white)
![CMake](https://img.shields.io/badge/CMake-064F8C?style=for-the-badge&logo=cmake&logoColor=white)

## 🚀 A Flutter BLoC App

Welcome to FLoC App, an innovative image display application created to demonstrate the BLoC pattern in Flutter.

[![Watch the Video](https://img.shields.io/badge/Watch%20Demo-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://youtube.com/shorts/j20fmwIrIRQ?feature=share)

## 📸 Screenshots

<img src="screenshots/list.png" width="200"/> <img src="screenshots/search.png" width="200"/> <img src="screenshots/view.png" width="200"/>

## 📝 Description

FLoC App is an image application that displays images from local assets. It is built to explain the BLoC (Business Logic Component) pattern in Flutter, making it simpler to manage state in your Flutter applications.

## 🛠️ Getting Started

### Prerequisites

Ensure you have the following installed:
- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/zaid-kamil/floc_app.git
    ```
2. Navigate to the project directory:
    ```sh
    cd floc_app
    ```
3. Get the dependencies:
    ```sh
    flutter pub get
    ```

### Running the App

To run the app on an emulator or physical device, use:
```sh
flutter run
```

## 📂 Project Structure

- `lib/main.dart`: Entry point of the application.
- `lib/features/presentations/pages/image_list_page.dart`: Main page displaying the list of images.
- `lib/features/presentations/widgets/category_chips.dart`: Widget for displaying category chips.
- `lib/features/presentations/widgets/image_grid.dart`: Widget for displaying images in a grid.
- `lib/features/presentations/widgets/search_bar.dart`: Widget for the search bar.
- `lib/features/presentations/blocs/image_bloc.dart`: BLoC for managing image-related state.
- `lib/data/floc_repo_impl.dart`: Implementation of the repository for fetching images.
- `lib/data/models/image_model.dart`: Model for the image data.
- `lib/data/repositories/floc_repo.dart`: Abstract repository for fetching images.
- `lib/domain/floc_repository.dart`: Interface for the repository.

## 👨‍💻 Author

Built with ❤️ by [Zaid Kamil](https://www.socialmistry.com)
