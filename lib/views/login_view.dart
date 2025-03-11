import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_shopping_app/methods/show_my_dialog.dart';
import 'package:simple_shopping_app/widgets/custom_button.dart';
import 'package:simple_shopping_app/widgets/custom_text.dart';
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
        title: Text(
          tr('LogIn'),
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            CustomText(text: tr('LogIn')),
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
                  hiddenPassword ? Icons.visibility : Icons.visibility_off,
                ),
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
              text: tr('LogIn'),
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passController.text,
                  );
                  showMyDialog(
                    context,
                    tr('LogIn'),
                    tr('log_in_success'),
                  );
                } on FirebaseAuthException catch (e) {
                  SnackBar snackBar = const SnackBar(
                    content: Text("Incorrect email or password"),
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } catch (e) {
                  print(e);
                  print('here');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
