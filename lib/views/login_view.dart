import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_shopping_app/methods/show_my_dialog.dart';
import 'package:simple_shopping_app/widgets/custom_button.dart';
import 'package:simple_shopping_app/widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool hiddenPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ), // don't forget to translate it
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const Text('Login'),
          const SizedBox(height: 30),
          CustomTextFormField(
            hintText: 'E-mail',
            controller: emailController,
            validator: (value) {
              if (value != null) {
                if (!value.contains('@')) {
                  return 'The email maust have \'@\'';
                }
              }
              return null;
            },
          ),
          const SizedBox(height: 30),
          CustomTextFormField(
            hintText: 'Password',
            controller: passController,
            obscureText: hiddenPassword,
            icon: IconButton(
              onPressed: () {
                hiddenPassword = !hiddenPassword;
                setState(() {});
              },
              icon: Icon(
                  hiddenPassword ? Icons.visibility : Icons.visibility_off),
            ),
            validator: (value) {
              if (value != null) {
                if (value.length < 6) {
                  return 'The Password must have at least 6 characters';
                }
              }
              return null;
            },
          ),
          const SizedBox(height: 30),
          CustomButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passController.text,
                );
                showMyDialog(context);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                }
              } catch (e) {
                print(e);
              }
            },
          )
        ],
      ),
    );
  }
}
