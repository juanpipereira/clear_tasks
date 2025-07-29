# Clear Tasks

Clear Tasks is a simple to-do list application. It helps you organize your tasks, stay productive, and keep track of your progress.

## Demo

| Android | iOS |
| :---: | :---: |
| *Android video coming soon* | *iOS video coming soon* |

## Features

- **Create, Read, Update, and Delete (CRUD) Todos:** Easily add, view, edit, and delete your tasks.
- **Mark Todo as Complete:** Mark todos as complete to track your progress.
- **Statistics:** View statistics about your tasks, such as the number of completed and pending todos.
- **AI-Powered Suggestions:** Get suggestions for your new todo description, powered by the Gemini API.
- **Adaptive UI:** The user interface adapts to the current operating system, providing a native look and feel on both Android and iOS. For example, the appbar and the action button were customized to look more natural for both platforms.
- **Adaptive Theme:** The app's theme automatically adjusts to the device's system theme (light/dark mode) to adapt to the user preferences.

## Architecture

The application follows a clean architecture pattern, separating the code into three main layers:

- **Data:** Handles data sources, such as the local database (Hive) and the Gemini API.
- **Domain:** Contains the core of the app, including models and use cases.
- **Presentation:** Responsible for the UI and user interaction, using the Riverpod package for state management.

## Technologies Used

- **[Flutter](https://flutter.dev/)**
- **[Riverpod](https://riverpod.dev/):** A state management library for Flutter that helps to manage the state of the application.
- **[Hive](https://pub.dev/packages/hive):** A lightweight and fast key-value database for Flutter apps.
- **[Google Gemini API](https://ai.google.dev/):** Used to provide AI suggestions in text format.

## How to Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/juanpipereira/clear_tasks.git
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run the app with your Gemini API Key:**
   This project uses the Google Gemini API for AI-powered requests. You can get your API key from [Google AI Studio](https://aistudio.google.com/app/apikey).

   Run the app using the `--define` property to provide the API key.
   ```bash
   flutter run --define=GEMINI_API_KEY="YOUR_API_KEY"
   ```
   Replace `"YOUR_API_KEY"` with your actual Gemini API key.
