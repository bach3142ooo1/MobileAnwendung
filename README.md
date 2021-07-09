# MobileAwendung
Sport Cross-Platform Mobile App für Mobile Anwendungen

## Launching APP - Requirements - In Construction
Database - H2
1. Install [H2](https://www.h2database.com/html/download.html)
2. Create local H2 Database
3. Create Table using the existing Script (SQL-init.txt)

Server
1. Install [TomCat 9](https://tomcat.apache.org/download-90.cgi)
2. Create Tomcat Server in Eclipse
3. Import WAR File
4. Change the references of the EintragDAO File to local H2 Database
5. (Optional) Setup Tomcat Ports to avoid getting used ports error
6. Launch the imported WAR as Tomcat Server in Eclipse

## Cordova
1. install cordova using ```npm install -g cordova```
2. import/open cordova Project
3. install dependencies using ```npm install```
4. add platform using ``` cordova platform add android``` or ``` cordova platform add browser```
5. run cordova app using ```cordova run android``` or ```cordova run browser```

## Flutter
1. install [flutter](https://flutter.dev/docs/get-started/install/windows) and add flutter to environment variables
2. import/open flutter Project
3. install dependencies using ```flutter pub add get```
4. Select desired platform (recommended: API 29)
5. Press run in Android Studio

## Known issues
- Ensure that H2 is closed when running TomCat and executing requests
- Ensure that Android SDK Version matches Gradle Version
- Ensure that you're running TomCat version 9
- Eclipse Enterprise Edition doesn't support Java Version 8
