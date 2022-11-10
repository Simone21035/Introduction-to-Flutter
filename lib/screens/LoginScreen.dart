import 'package:flutter/material.dart';
import 'package:flutter_proj1/screens/Dashboard.dart';
import 'package:flutter_proj1/screens/SignUp.dart';
import 'package:flutter_proj1/widget/CustomTextField.dart';
import 'package:flutter_proj1/widget/PasswordField.dart';
import 'package:flutter_proj1/widget/PrimaryButton.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: width * .9,
                child: Column(
                  children: [
                    CustomTextField(
                        labelText: "Email Address",
                        hintText: "Enter your email address",
                        controller: emailController,
                        textInputType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PasswordField(
                        obscureText: obscurePassword,
                        onTap: handleObscurePassword,
                        labelText: "Password",
                        hintText: "Enter your password",
                        controller: passwordController),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                      text: "Login",
                      iconData: Icons.login,
                      onPress: () {
                        Navigator.pushReplacementNamed(
                            context, Dashboard.routeName);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                      text: "Sign up",
                      iconData: Icons.app_registration,
                      onPress: () {
                        Navigator.pushReplacementNamed(
                            context, SignUp.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  handleObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }
}
