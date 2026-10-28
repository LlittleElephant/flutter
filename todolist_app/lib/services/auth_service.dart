import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  // Get current user
  User? get currentUser => _auth.currentUser;


  // Stream of user authentication state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();


  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      // STUDENTS: Implement Firebase sign-in
      // Use _auth.signInWithEmailAndPassword()
      throw Exception('Implement signInWithEmailAndPassword!');
    } catch (e) {
      throw Exception('Sign in failed: $e');
    }
  }


  // Create a new account with email and password
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      // STUDENTS: Implement Firebase user creation
      // Use _auth.createUserWithEmailAndPassword()
      throw Exception('Implement createUserWithEmailAndPassword!');
    } catch (e) {
      throw Exception('Account creation failed: $e');
    }
  }


  // Sign out
  Future<void> signOut() async {
    // STUDENTS: Implement sign out
    // Use _auth.signOut()
    throw Exception('Implement signOut!');
  }
}
