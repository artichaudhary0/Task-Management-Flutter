# 📝 Task Manager: Your Ultimate To-Do List  

Welcome to **Task Manager**! A simple and efficient **task management** application built with **Flutter** and **GetX**.  
Stay organized, set reminders, and get push notifications for important tasks – all with a clean and minimal UI.  

---

## 📌 Features  
### 1️⃣ Task Management  
-  ✅ Task Management – Create, edit, and delete tasks easily.
-  ✅ Task Details – Each task includes a title, description, priority level, and due date.
-  ✅ Prioritization – Users can set high, medium, or low priority levels for tasks.
-  ✅ Reminders & Notifications – Get push notifications when tasks are due.
-  ✅ Sorting & Filtering – Sort tasks by priority, due date, or creation date.
-  ✅ Search Functionality – Quickly find tasks using keywords or titles.
-  ✅ Persistent Storage – Tasks are saved using local storage (SharedPreferences) even after the app restarts.
-  ✅ User-Friendly UI – Follows Material Design Guidelines for smooth user experience. 

### 2️⃣ Task Reminders & Notifications  
- **Set Reminders**: Never miss important tasks with timely notifications.  
- **Push Notifications**: Get alerts when a task is due soon.  

### 3️⃣ Persistent Storage  
- **SharedPreferences**: Save tasks locally for offline access.  
- **Automatic Data Retention**: Your tasks stay even after restarting the app.  

### 4️⃣ Custom UI & Theme  
- **Gradient-Themed Cards**: Visually appealing task cards with light gradients.  
- **Smooth Animations**: A seamless and responsive user experience.  

---

## 🛠 Technologies Used  
- **Flutter & Dart**: Cross-platform mobile app development.  
- **GetX**: Lightweight and efficient state management.  
- **SharedPreferences**: Local storage for persisting tasks.  
- **Flutter Local Notifications**: For task reminders and alerts.

---


## 📂 Folder Structure  
📦 todo_app  
 ┣ 📂 lib  
 ┃ ┣ 📂 controllers  
 ┃ ┃ ┣ 📜 task_controller.dart  
 ┃ ┣ 📂 models  
 ┃ ┃ ┣ 📜 task_model.dart 

 ┃ ┣ 📂 screens  
 ┃ ┃ ┣ 📜 todo_screen.dart   
 ┃ ┣ 📂 utils  
 ┃ ┃ ┣ 📜 date_formatter.dart  
 ┃ ┃ ┣ 📜 theme.dart  
 ┃ ┣ 📂 widgets  
 ┃ ┃ ┣ 📜 custom_appbar.dart  
 ┃ ┃ ┣ 📜 custom_text_field.dart  
 ┃ ┃ ┣ 📜 custom_date_picker.dart  
 ┃ ┃ ┣ 📜 custom_dialogue.dart   
 ┃ ┃ ┣ 📜 custom_button.dart    
 ┃ ┣ 📜 main.dart   
 ┣ 📂 test  
 ┃ ┣ 📜 task_controller_test.dart 
 ┃ ┣ 📜 widget_test.dart  
 ┣ 📂 integration_test  
 ┃ ┣ 📜 app_test.dart  

 ---
 
 ## 📸 Screenshots  

<img src="https://github.com/user-attachments/assets/b98f4602-754f-463c-a952-dc4f33f403a6" width="200"/> 
<img src="https://github.com/user-attachments/assets/4e7d93bc-d3c9-4a39-af95-f1a3d3006b5a" width="200"/> 
<img src="https://github.com/user-attachments/assets/fd43228b-36c7-41ac-9bc7-ec0a83ccee93" width="200"/> 
<img src="https://github.com/user-attachments/assets/edd53dde-9c0c-48ed-9713-057c43fb758d" width="200"/> 
<img src="https://github.com/user-attachments/assets/e16491c1-2251-41e5-91e0-fc28afb797b4" width="200"/> 
<img src="https://github.com/user-attachments/assets/87a005c2-4299-45cb-b89b-31c9e740cb19" width="200"/> 
<img src="https://github.com/user-attachments/assets/6c3bc23f-23c5-4d7e-a2b2-d3676f511148" width="200"/> 
<img src="https://github.com/user-attachments/assets/cbdea84e-c1a4-4d62-9b2d-fbf701781517" width="200"/> 

---

 ## 📸 Live Demo  
https://drive.google.com/drive/folders/1FNwga6iddJ8eBw5uCaFz4hiijeyHDx1p?usp=sharing

---

## 🎨 Design Guidelines
- Follows Material Design principles for a seamless experience.
- Clean MVVM / MVC architecture for better maintainability.
- Uses GetX for efficient state management.
- Implements smooth animations and transitions for a polished UI.

---

## 🚀 Installation & Setup
- 1️⃣ Clone the repository
    - git clone https://github.com/artichaudhary0/todo_app.git
    - cd todo_app
- 2️⃣ Install dependencies
    - flutter pub get
- 3️⃣ Run the application
    - flutter run

---
  
## ✅ Upcoming Features
- 🔹 Cloud Sync with Firebase – Store tasks in Firestore for cross-device accessibility.
- 🔹 Dark Mode – Toggle between light and dark themes.
- 🔹 Voice Input – Add tasks via voice commands.

---

## 🧪 Testing
- The app includes unit tests, widget tests, and integration tests for critical functionalities:
- TaskController Test – Ensures task operations (CRUD) work correctly.
- Widget Test – Tests UI elements such as buttons, inputs, and lists.
- Integration Test – Simulates user interactions across the entire app.

---

## Run tests using:
  - flutter test

---

## 📜 License
This project is open-source and available under the MIT License.
