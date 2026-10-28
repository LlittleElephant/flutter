import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


import 'services/auth_service.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'todo_list.dart'; // Your existing todo list screen


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        title: 'Todo App with Auth',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: AuthWrapper(),
      ),
    );
  }
}


class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    
    return StreamBuilder<User?>(
      // TODO 1: Use authService.authStateChanges stream
      stream: null, // STUDENTS: Replace with authService.authStateChanges
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }


        // TODO 2: Check if user is logged in
        final user = snapshot.data;
        if (user != null) {
          // User is logged in, show TodoList
          return TodoList();
        } else {
          // User is not logged in, show AuthScreen
          return AuthScreen();
        }
      },
    );
  }
}


class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}


class _AuthScreenState extends State<AuthScreen> {
  bool showLoginScreen = true;


  void toggleScreen() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }


  @override
  Widget build(BuildContext context) {
    return showLoginScreen
        ? LoginScreen(showRegisterScreen: toggleScreen)
        : RegisterScreen(showLoginScreen: toggleScreen);
  }
}
