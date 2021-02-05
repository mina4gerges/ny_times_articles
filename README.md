# Popular articles

Mobile application written in flutter to get the most popular articles.

1. [Prerequisites](#prerequisites)
2. [Installation](#installation)
3. [How to run the app](#runApp)
4. [How to test the app](#testApp)
5. [How to build an apk](#buildApk)
6. [How to generate coverage reports](#coverageReports)
7. [Architecture](#architecture)
8. [Development environment](#developementEnvirement)
9. [SonarQube report](#sonarQubeReport)
10. [Extra. Building web app](#extraBuildingWebApp)
11. [ScreenShots](#screenShots)

- <h2 name="prerequisites">Prerequisites</h2>

    - **flutter SDK** installed (https://flutter.dev). To check if **flutter** is installed, run this command: **flutter
      --version**

    - At least one editor installed ex: **Android Studio** (https://developer.android.com/studio), **IntelliJ**
      (https://www.jetbrains.com/idea/) or **VS code** (https://code.visualstudio.com)

    - At least one device connected, **emulator**, **simulator** or a **physical device**

    - Check if the environment is ready to run the app by using this command: **flutter doctor**. This command tells you
      if they are any issue

    - Congrats 😎 you are ready to install the app

- <h2 name="installation">Installation</h2>

    - Open a command line/terminal (root folder)

    - git clone https://github.com/mina4gerges/popular_articles.git

    - Go to the directory **popular_articles** and hit **flutter pub get** to install all dependencies

    - Go to https://developer.nytimes.com/get-started

    - Sign in/up and create a new application (click on user name-drop down to create a new app) to get an API key, and
      enable **Most Popular API** in APIs section

    - Set the API key in **lib/global/api.dart**

    - Hit **flutter run** to run the app

    - Congrats 🎉 The app is running now

- <h2 name="runApp">How to run the app</h2>

    - In the root of the folder, open a command line/terminal and hit **flutter run**

- <h2 name="testApp">How to test the app</h2>

    - In the root of the folder, open a command line/terminal and hit **flutter test**

- <h2 name="buildApk">How to build an apk</h2>

    - In the root of the folder, open a command line/terminal and hit **flutter build apk --split-per-abi**

    - This command results in three APK files in **popular_articles/build/app/outputs/apk/release/**

    - More info: https://flutter.dev/docs/deployment/android

- <h2 name="coverageReports">How to generate coverage reports</h2>

    - In the root of the folder, open a command line/terminal and hit **flutter test --coverage**

    - A folder called **coverage**, created by **flutter**, contains the coverage report.

    - To generate reports please refer to [SonarQube report](#sonarQubeReport)

- <h2 name="architecture">Architecture</h2>

    - In this app we are using **MVC** architecture (Model, View, Controller)

    - The controllers contain: list of articles, and a function to load these articles

    - The models contain: article modal and error message modal. Plan old dart object (PODO)

    - The views contain: articles list view, article details view and article item view

    - The services contain: function to load articles for the API + handling the request error

- <h2 name="developementEnvirement">Development environment</h2>

    - Flutter: 1.22.3

    - Dart: 2.10.3

    - OS: macOS Big Sur (version 11.1)

    - Devices: Iphone 11 (Simulator ios 14.2) and Pixel 4 XL API 30 (Emulator)

    - Editors: IntelliJ v2020.3.2 and Android Studio v4.1.2

- <h2 name="sonarQubeReport">SonarQube report</h2>

    - Prerequisites:

        - Java JDK version 8 (https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html) OR
          11 (https://www.oracle.com/java/technologies/javase-jdk11-downloads.html) **installed**

        - SonarQube installed **from the zip file**. For me I used **7.9.5** version
          (https://docs.sonarqube.org/latest/setup/get-started-2-minutes/)

        - SonarScanner installed (https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/)

        - Download the plugin for analyzing dart language and flutter because sonarqube doesn't own
          it (https://github.com/insideapp-oss/sonar-flutter/releases/download/0.2.1/sonar-flutter-plugin-0.2.1.jar)

        - After installing this plugin, added it to where you installed **SonarQube** in a specific folder:
          **YOUR_PATH/sonarqube/extensions/plugins/**

        - Run **SonarQube** by running this command: **YOUR_PATH/sonarqube/bin/[OS]/sonar.sh console**. 'OS' refers to
          your operating system

        - Please note, a configuration file is already added in the root project called **sonar-project.properties**
          with default **login and password**: **admin** (No action required. Only if you want to change **login and
          password** values based on **SonarQube** credentials)

        - Now, **SonarQube** is configured and running to run analysis and generate reports

    - How to run reports ?

        - Open a command line/terminal (root folder)

        - Run tests **flutter test --machine > tests.output**

        - Compute coverage **flutter pub get**

        - Download all dependencies **flutter test --coverage**

        - Run the analysis and publish to the **SonarQube** server **sonar-scanner** (Be sure you added **SonarScanner**
          to your path)

        - Open the web browser: **localhost:9000**

        - Login using you credentials (**admin** is the default value for the login and password)

        - Congrats 🎉, now you can see the reports

- <h2 name="extraBuildingWebApp">Extra. Building web app</h2>

    - Set UP

        - Open a command line/terminal (root folder)

        - **flutter channel beta**

        - **flutter upgrade**

        - **flutter config --enable-web**

        - Restart your IDE

    - Run

        - Open a command line/terminal (root folder)
          
        - **flutter run -d chrome**
    
    - Build

        - Open a command line/terminal (root folder)
          
        - Add web support: **flutter create .**
    
        - Build command: **flutter build web**
    
    - An online version has been deployed, you can check: https://popular-articles-98391.web.app

    - N.B: Please note that when changing to **beta** version, we are **replacing** our current version of flutter.
      Returning to the stable channel (or any other) requires calling flutter channel <channel> explicitly.

    - For more info: https://flutter.dev/docs/get-started/web

- <h2 name="screenShots">ScreenShots</h2>

  IOS articles | IOS article detail
  :-----------:|:-----------------: 
  ![Introduction Screen](screenshots/ios-articles.png?raw=true) | ![Introduction Screen](screenshots/ios-article-detail.png?raw=true)

  Android articles | Android article detail
  :---------------:|:----------------------: 
  ![Introduction Screen](screenshots/android-articles.png?raw=true) | ![Introduction Screen](screenshots/android-article-detail.png?raw=true)

  Web articles | Web article detail
  :---------------:|:----------------------: 
  ![Introduction Screen](screenshots/web-articles.png?raw=true) | ![Introduction Screen](screenshots/web-article-detail.png?raw=true)

