# MobileAnwendung (Sport App)
Sport Cross-Platform Mobile App für Mobile Anwendungen

## Before you start
1. Install [H2](https://www.h2database.com/html/download.html)
2. Install [TomCat 9](https://tomcat.apache.org/download-90.cgi)
3. Install [Flutter](https://flutter.dev/docs/get-started/install/windows) and add flutter to environment variables
4. Install [Node](https://nodejs.org/de/download/) (required to install node packages/modules)
5. Install [Cordova](https://cordova.apache.org/) using ```npm install -g cordova``` (Make sure you've installed Node first!)
6. Install [Gradle](https://gradle.org/install/) and add gradle to environment variables
7. Install [Eclipse Enterprise Edition](https://www.eclipse.org/downloads/packages/release/kepler/sr2/eclipse-ide-java-ee-developers) (Normal Edition doesn't support servers!)
8. Install [Android Studio](https://developer.android.com/studio) or Text Editor of your choice

## Launching APP - Prerequisites
Database - H2
1. Create local H2 Database
2. Create Table using the existing Script (SQL-init.txt)

Server
1. Create Tomcat Server in Eclipse
2. Import WAR File (Weblexikon_Server.war)
3. Change the references of the EintragDAO File to local H2 Database
4. (Optional) Setup Tomcat Ports to avoid getting used ports error
5. Launch the imported WAR as Tomcat Server in Eclipse

## Cordova
1. import/open cordova Project
2. install dependencies using ```npm install```
3. add platform using ``` cordova platform add android``` or ``` cordova platform add browser```
4. run cordova app using ```cordova run android``` or ```cordova run browser```

## Flutter
1. import/open flutter Project
2. install dependencies using ```flutter pub add get```
3. Select desired platform (recommended: API 29)
4. Press run in Android Studio

## Known issues
- Ensure that H2 is closed when running TomCat and executing requests
- Ensure that Android SDK Version matches Gradle Version
- Ensure that you're running TomCat version 9
- Eclipse Enterprise Edition doesn't support Java Version 8
- Gradle won't build using Java 16 - Make sure you're running Java 8 or 11! (can be defined using the environment variables)
- Ensure you're logged in the google calendar in the emulator to ensure you can add events to your local calendar!
