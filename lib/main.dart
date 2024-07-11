// 1. Register
// 2. Login
// 3. Exit
// Select an option: 1
// Enter a username: john_doe
// Enter a password: 1234
// User registered successfully!

// 1. Register
// 2. Login
// 3. Exit
// Select an option: 2
// Enter your username: john_doe
// Enter your password: 1234
// Login successful! Welcome, john_doe.

// 1. Logout
// 2. Exit
// Select an option: 1
// Logged out successfully.

// 1. Register
// 2. Login
// 3. Exit
// Select an option: 2
// Enter your username: jane_doe
// Enter your password: wrong_password
// Invalid username or password,try again

// 1. Register
// 2. Login
// 3. Exit
// Select an option: 4

// Invalid option. Please try again.

// 1. Register
// 2. Login
// 3. Exit
// Select an option: 3

// Thank you


import 'dart:io';

String registeredUserName = "";
String registeredPass = "";
void main() {
  for (;;) {
    print("""
1. Register
2. Login
3. Exit
""");

    stdout.write("enter your choice : ");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      register();
    } else if (choice == 2) {
      bool isLoggedIn = login();

      if (isLoggedIn) {
        print("""
1. logout
2. Exit
""");
        stdout.write("enter your choice : ");
        int loginChoice = int.parse(stdin.readLineSync()!);
        if (loginChoice == 1) {
          print("Logged out successfully.");
        } else if (choice == 2) {
          print("Thank you");
          break;
        }
      }
    } else if (choice == 3) {
      print("Thank you");
      break;
    } else {
      print("invalid choice, try again");
    }
  }
}

// Enter a username: john_doe
// Enter a password: 1234
// User registered successfully!
register() {
  stdout.write("Enter a username: ");
  String username = stdin.readLineSync()!;
  stdout.write("Enter a password: ");
  String pass = stdin.readLineSync()!;
  if (username.isNotEmpty && pass.isNotEmpty) {
    registeredUserName = username;
    registeredPass = pass;
    print("User registered successfully!");
  } else {
    print("failed to register, try again");
  }
}

bool login() {
  stdout.write("Enter a username: ");
  String username = stdin.readLineSync()!;
  stdout.write("Enter a password: ");
  String pass = stdin.readLineSync()!;

  if (username == registeredUserName && pass == registeredPass) {
    print("Login successful! Welcome, $registeredUserName");
    return true;
  } else {
    print("Invalid username or password,try again");
    return false;
  }
}