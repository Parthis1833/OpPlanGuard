# OpPlanGuard


# Development Environment (Local)

## System Requirements

:bulb: Before you begin, make sure you have the following installed:

#### front-end :-
- [Flutter](https://docs.flutter.dev/get-started/install)

#### back-end :-
- [Java](https://www.oracle.com/java/technologies/downloads/#java11)
- [Maven](https://maven.apache.org/download.cgi)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git/)
- [Postgres](https://www.postgresql.org/download/)
- [intellij idea community edition](https://www.jetbrains.com/idea/download///#section=linux)

## Getting Started With Local Development

#### first we need inst back-end  after front-end  


back end  :-

**Step 1 :**

create a database named gujarat_police in postgres with username gujarat_police and password 1234

```
psql -U postgres
```
```
CREATE USER gujarat_police WITH PASSWORD '1234';
```
```
CREATE DATABASE gujarat_police;
GRANT ALL PRIVILEGES ON DATABASE gujarat_police TO gujarat_police;
```
```
\q
```
**Step 2 :**

Download or clone this repo by using the link below:

```
https://github.com/Parthis1833/OpPlanGuard.git
```

***Step 3 :***
```
cd OpPlanGuard/gujarat_police_backend
```

***Step 4 :***

```
mvn  clean package 
```

***Step 5 :***

```
mvnw spring-boot:run
```

after that you run flutter destop application

***Step1:***

```
cd .. &&  cd   admin/e_bandobas 
```
**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub clean
```

**Step 3:**

```
flutter pub get
```
**Step 4:**

```
flutter run -d desktop
```
