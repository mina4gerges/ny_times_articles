# Popular articles

Mobile application written in flutter to get the most popular articles.

1. [Prerequisites](#prerequisites)
2. [Installation](#installation)
3. [How to run the app](#runApp)
4. [How to test the app](#testApp)
5. [How to generate coverage reports](#coverageReports)
6. [Architecture](#architecture)
7. [Development environment](#developementEnvirement)
8. [ScreenShots](#screenShots)

- <h2 name="prerequisites">Prerequisites</h2>

    - **flutter SDK** installed (https://flutter.dev). To check if **flutter** is installed, run this command: **flutter --version**

    - At least one editor installed ex: **Android Studio** (https://developer.android.com/studio), **
      Intellij** (https://www.jetbrains.com/idea/) or **VS code** (https://code.visualstudio.com)

    - At least one device connected, **emulator**, **simulator** or a **physical device**

    - Check if the environment is ready to run the app by using this command: **flutter doctor**. This command tells you
      if they are any issue

    - Congrats 😎 you are ready to install the app

- <h2 name="installation">Installation</h2>

    - Open a command line/terminal

    - git clone https://github.com/mina4gerges/popular_articles.git

    - Go to the directory **popular_articles** and hit **flutter pub get** to install all dependencies

    - Go to https://developer.nytimes.com/get-started

    - Sign in/up and create a new application (click on user name-drop down to create a new app) to get an API key, and
      enable **Most Popular API** in APIs section

    - Set the API key in **lib/global/api.dart**

    - Hit **flutter run** to run the app

    - Congrats 🎉 The app is running now

- <h2 name="runApp">How to run the app</h2>

    - In the root of the app, open a command line/terminal and hit **flutter run**

- <h2 name="testApp">How to test the app</h2>

    - In the root of the app, open a command line/terminal and hit **flutter test**

- <h2 name="coverageReports">How to generate coverage reports</h2>

    - In the root of the app, open a command line/terminal and hit **flutter test --coverage**

    - A folder hase been created by **flutter**, container the coverage reports.

- <h2 name="architecture">Architecture</h2>

    - In this app we are using MVC architecture (Model, View, Controller)

    - The controllers contain: list of articles, and a function to load these articles

    - The models contain: article modal and error message modal. Plan old dart object (PODO)

    - The views contain: articles list view, article details view and article item view

    - The services contain: function to load articles for the API + handling the request error
  
- <h2 name="developementEnvirement">Development environment</h2>

    - Flutter: 1.22.3

    - Dart: 2.10.3

- <h2 name="screenShots">ScreenShots</h2>

  IOS articles | IOS article detail
    :-----------:|:-----------------: 
  ![Introduction Screen](screenshots/ios-home.png?raw=true) | ![Introduction Screen](screenshots/ios-detail.png?raw=true)

  Android articles | Android article detail
    :---------------:|:----------------------: 
  ![Introduction Screen](screenshots/android-home.png?raw=true) | ![Introduction Screen](screenshots/android-detail.png?raw=true)

