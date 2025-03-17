
# Task Manager App

Task Manager is a simple and intuitive app designed to help users keep track of their tasks, organize them by priority, and set due dates. The app includes features like task creation, task completion, priority setting, and due date tracking. This app uses SwiftUI and Core Data for local persistence and follows the MVVM (Model-View-ViewModel) architecture pattern for better code organization and testability.

## Table of Contents
- [Setup Instructions](#setup-instructions)
- [Features](#features)
- [Design Rationale](#design-rationale)

## Setup Instructions

### Prerequisites
- Xcode 16 or higher
- Swift 6 or higher
- iOS 18.0 or higher (target)

### Installation
1. **Clone the repository** to your local machine:
    ```bash
    git clone https://github.com/hakim57/TaskManagerSample.git
    ```
   
2. **Open the project in Xcode**:
    - Navigate to the project directory and open the `.xcodeproj` file or `.xcworkspace` file in Xcode:
    ```bash
    cd task-manager-app
    open TaskManagerApp.xcodeproj
    ```

3. **Build and Run** the project:
    - Select a simulator or a connected iOS device in the Xcode toolbar, then click the "Run" button (`Cmd + R`).


## Features
- Task Creation: Add new tasks with titles, descriptions, due dates, and priorities.
- Task Completion: Mark tasks as completed or pending.
- Priority Settings: Organize tasks by priority (High, Medium, Low).
- Due Date Tracking: Track due dates and receive a visual representation of how close the task is to its due date.
- Swipe Actions: Swipe to delete or mark tasks as complete.
- Undo Actions: Undo Task Deletion or Task Completion.
- Accessibility: Full support for VoiceOver and custom accessibility labels for enhanced user experience.

## Design Rationale

### 1. **MVVM Architecture**
The app is designed using the **Model-View-ViewModel (MVVM)** architecture. This design allows for better separation of concerns:
- **Model**: Represents the data (tasks, priorities) and business logic.
- **View**: SwiftUI views that display the UI to the user.
- **ViewModel**: Handles the logic between the View and Model, and provides data to the View in a way that is easy to bind.

This separation makes the app more testable and maintainable, especially with complex business logic.

### 2. **SwiftUI for UI Development**
SwiftUI is used to create declarative and responsive user interfaces. It simplifies the app’s codebase while providing a modern, flexible UI experience:
- **Declarative syntax** makes it easier to read and understand the UI logic.
- **Animations and Transitions**: SwiftUI enables smooth animations for user interactions like completing tasks, swiping actions, and transitions between views.

### 3. **Accessibility**
Accessibility is an important part of the app design:
- **Custom Accessibility Labels and Hints**: Key UI elements such as task titles, buttons, and pickers are accessible to screen readers with well-defined labels and hints.
- **VoiceOver Support**: The app ensures that VoiceOver users can navigate through the app seamlessly, using accessibility identifiers and meaningful actions.

### 4. **UI/UX Design**
The user interface is designed to be clean, intuitive, and accessible:
- **Card-based Layout**: Each task is displayed in a card-style layout to create clear separation between tasks and improve visual appeal.
- **Floating Action Button (FAB)**: A "+" button is positioned in the bottom toolbar for easy task creation. This ensures easy access and follows best practices for floating action buttons in mobile apps.
- **Swipe Actions**: Swipe gestures are integrated to allow users to complete or delete tasks quickly, improving task management efficiency.
- **Circular Progress Indicator**: For tasks with a due date, a circular progress indicator shows users how close they are to their deadline visually, adding a sense of urgency.

### 5. **Core Data for Local Persistence**
Core Data is used to store tasks locally on the device. This allows the app to function offline and provides seamless persistence of task data between app sessions. Core Data's integration with SwiftUI via the `@FetchRequest` property wrapper helps simplify data management and binding between the model and the UI.

---

### Conclusion:
This README provides the essential setup instructions, design rationale. The app is built using modern architecture and design practices, with a strong focus on accessibility and user experience.
