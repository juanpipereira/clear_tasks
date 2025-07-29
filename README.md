# Clear Tasks

Clear Tasks is a simple to-do list application. It helps you organize your tasks, stay productive, and keep track of your progress.

## Features

- **Create, Read, Update, and Delete (CRUD) Todos:** Easily add, view, edit, and delete your tasks.
- **Mark Todo as Complete:** Mark todos as complete to track your progress.
- **Statistics:** View statistics about your tasks, such as the number of completed and pending todos.
- **AI-Powered Suggestions:** Get suggestions for your new todo description, powered by the Gemini API.

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