# OpPlanGuard

The OpPlanGuard development environment requires both a backend and a frontend component. The backend component is built using Java and the Spring Boot framework, and it uses a PostgreSQL database. The frontend component is built using the Flutter framework.
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

Create a PostgreSQL database named "gujarat_police" with a username of "gujarat_police" and a password of "1234". This can be done by running the following commands:

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

Clone the OpPlanGuard Git repository by running the following command:

```
https://github.com/Parthis1833/OpPlanGuard.git

```

***Step 3 :***
Navigate to the "gujarat_police_backend" directory within the cloned repository:
```
cd OpPlanGuard/gujarat_police_backend

```

***Step 4 :***
Build the backend component by running the following command:

```
mvn  install package 

```

***Step 5 :***Run the backend component by running the following command:


```
mvnw spring-boot:run
```

after that you run flutter destop application

***Step1:***
Navigate to the "admin/e_bandobas" directory within the cloned repository:
```
cd .. &&  cd   admin/e_bandobas 
```


**Step 3:**
Install the dependencies of the Flutter project:
```
flutter pub get
```
**Step 4:**
Run the frontend component on desktop:
```
flutter run -d desktop
```
