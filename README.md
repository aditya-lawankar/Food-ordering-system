# Food Ordering System

A restaurant ordering web app built with Spring Boot and JSP. Customers browse a menu of
Asian dishes that lists calories, course and dietary information for each item, add dishes to
a cart and pay through PayPal. Restaurant staff manage the menu from an admin panel.

## Features

**Customers**
- Register, log in and edit their profile
- Browse the menu with calories, course (starter, main or dessert) and diet (veg or non-veg) shown per dish
- Add dishes to a cart, remove them and see the running total
- Check out with PayPal (sandbox)

**Admin**
- Add, edit and delete menu categories and dishes
- View registered customers

## Tech stack

- Java 11, Spring Boot 2.6 (Spring MVC)
- JSP, JSTL and Bootstrap 4
- MySQL, accessed over JDBC with prepared statements
- PayPal Checkout SDK
- Passwords hashed with BCrypt

## Running locally

You need JDK 11 or newer and a MySQL 8 server.

1. Create a database called `springproject` and import the schema and sample menu:

   ```bash
   mysql -u root -e "CREATE DATABASE springproject"
   mysql -u root springproject < springproject.sql
   ```

   The app connects to `jdbc:mysql://localhost:3306/springproject` as `root` with an empty
   password. Change the connection strings in the controllers and views if your setup differs.

2. Create a sandbox app in the [PayPal developer dashboard](https://developer.paypal.com/) and
   export its credentials:

   ```bash
   export PAYPAL_CLIENT_ID=...
   export PAYPAL_CLIENT_SECRET=...
   ```

3. Start the app and open <http://localhost:8080>:

   ```bash
   ./mvnw spring-boot:run
   ```

Log in with the sample account `demo` / `demo1234`, or register a new one. The admin panel is at
`/admin`.

## Project structure

```
src/main/java/.../controller/   request handling, cart, orders and PayPal integration
src/main/webapp/views/          JSP pages
src/main/webapp/img/dishes/     menu images
springproject.sql               schema and sample data
```

## Team

Built with [@advaith017](https://github.com/advaith017), who implemented the PayPal payment flow.
