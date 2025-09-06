# MyCalculator

This is my first ever flutter project built for getting famalier of
Flutter framework. It is created using only what I know of flutter till
now, so it may not follow Flutter conventions and best practices. Happy
coding ; )

## Features

- I has a AppBar which title changes depending on which page you are on.
- Has a BottomNavigationBar for navigation.
- Contains four pages: Home, Calculator, About, Settings which are empty
  pages except the Calculator page.
- The calculator page features a simple calculator allowing users to
  perform basic math like: Addigion, Subtraction, Multiplication, Division
  (May add more operations later).

> ---
> ***Note:** I thought of writing my own operation parser, but then realized
> that it would be complex and time consuming. Since my current primary goal
> is to learn Flutter, so I decided to use `math_expressions` library instead.
> **It's better to focus on your real goal you know!*** **; >**
>
> ***Important Note:** Since I am using normal `double` datatype for storing
> and performing operations on decimal values, so it won't handle them very well.
> It can handle properly upto one decimal point precision at best, so look out
> for that. And feel free to implement it yourself in a proper way(using proper
> library for decimal point) if you want.*
>
> ---

## To get started with this project:

1. Clone the repo: 
    ```bash
    # clone the repo and go to the project folder
    git clone https://github.com/dipankarswargiary/calculator-app.git
    cd calculator-app
    ```
2. Require the necessary dependencies:
    ```bash
    # it will install math_expressions library
    flutter pub get
    ```
3. Setup an amulator or connect to a physical device (I would assume you already have done it).
4. Then run the flutter app:
    ```bash
    flutter run
    ```
    **Congrats! you have a running app...**

## Some useful stuffs for you: *(thank me later)*

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter online documentation](https://docs.flutter.dev/)
