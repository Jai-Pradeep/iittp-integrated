import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '/../components/my_textfield.dart';
import '/../components/my_button.dart';
import '/../components/square_tile.dart';
import 'package:iittp_integrated/main.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Sign user in method
  void signUserIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ) ;

      Navigator.pop(context);  // Close the loading dialog
      Navigator.pushNamed(context, '/homepage'); // Navigate to Preview Page
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);  // Close the loading dialog
      print("\nError Code: ${e.code}\n");
      _handleFirebaseError(e);
    } catch (e) {
      Navigator.pop(context);  // Close the loading dialog
      print("\nUnexpected Error: $e\n");
      _showErrorDialog("Error", "An unexpected error occurred. Please try again.");
    }
  }
  void signAnonIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
         child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInAnonymously() ;
      Navigator.pop(context);  // Close the loading dialog
      Navigator.pushNamed(context, '/homepage'); // Navigate to Preview Page
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);  // Close the loading dialog
      print("\nError Code: ${e.code}\n");
      _handleFirebaseError(e);
    } catch (e) {
      Navigator.pop(context);  // Close the loading dialog
      print("\nUnexpected Error: $e\n");
      _showErrorDialog("Error", "An unexpected error occurred. Please try again.");
    }
  }
  void _handleFirebaseError(FirebaseAuthException e) {
    String title;
    String message;

    switch (e.code) {
      case "invalid-email":
        title = "Incorrect Email";
        message = "Please check your email and try again.";
        break;
      case 'wrong-password':
        title = "Incorrect Password";
        message = "Please check your password and try again.";
        break;
      case 'user-not-found':
        title = "User Not Found";
        message = "No user found with this email.";
        break;
      default:
        title = "Error";
        message = "An unexpected error occurred. Please try again.";
        break;
    }
    _showErrorDialog(title, message);
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Container(child: Lottie.asset(
                  "assets/animations/login.json",
                  repeat: true,
                  width: 200.0, // Match the width
                  height: 200.0, // Match the height
                ),),
                const SizedBox(height: 50),
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                MyButton(
                  onTap: signUserIn,
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),

                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
            GestureDetector(
              onTap: () async {signAnonIn();},
              child: Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "Guest Mode",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
