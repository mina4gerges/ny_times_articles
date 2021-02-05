# Popular articles

Mobile application to get the most popular articles.

1. [Installation](#installation)
2. [How to run the app](#runApp)
3. [How to test the app](#testApp)
4. [How to generate coverage reports](#coverageReports)
5. [Development environment](#developementEnvirement)

- <h2 name="installation">Installation</h2>

    - open a command line/terminal

    - git clone https://github.com/mina4gerges/popular_articles.git

    - Go to the directory **popular_articles** and hit **flutter pub get** to install all dependencies

    - Go to https://developer.nytimes.com/get-started

    - Sign in/up and create a new application (click on user name-drop down to create a new app) to get an API key, and
      enable **Most Popular API** in APIs section

    - Set the API key in **lib/global/api.dart**

    - Hit **flutter run** to run the application

    - Congrats 🎉 The app is running now

- <h2 name="runApp">How to run the app</h2>

    - In the root of the app, open a command line/terminal and hit **flutter run**

- <h2 name="testApp">How to test the app</h2>

    - In the root of the app, open a command line/terminal and hit **flutter test**
      
- <h2 name="coverageReports">How to generate coverage reports</h2>

  - In the root of the app, open a command line/terminal and hit **flutter test --coverage**
    
  - A folder hase been created by **flutter**, container the coverage reports.

- <h2 name="developementEnvirement">Development environment</h2>

    - Flutter: 1.22.3

    - Dart: 2.10.3
