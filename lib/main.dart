import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_introduction/todo.dart';
import 'package:flutter/material.dart';

Future<void> main(List<String> args)async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const Todo());
}

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( 
      home: ToDoApp(),
    );
  }
}
























// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp();
//   runApp(const FirebaseIntroductionApp());
// }

// class FirebaseIntroductionApp extends StatelessWidget {
//   const FirebaseIntroductionApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: LoginScreen(),
//     );
//   }
// }




// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: emailController,
//               keyboardType: TextInputType.emailAddress,
//               decoration: const InputDecoration(labelText: 'Email'),
//             ),
//             const SizedBox(height: 60),
//             TextField(
//               controller: passwordController,
//               keyboardType: TextInputType.visiblePassword,
//               decoration: const InputDecoration(labelText: 'Password'),
//             ),
//             const SizedBox(height: 30),
//             MaterialButton(
//               minWidth: double.maxFinite,
//               color: Colors.green,
//               onPressed: () async {
//                final response =  await FirebaseAuth.instance.createUserWithEmailAndPassword(
//                   email: emailController.text,
//                   password: passwordController.text,
//                 );

//                 print(response);
//               },
//               child: const Text('Login'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }