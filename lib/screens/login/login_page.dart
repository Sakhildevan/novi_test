import 'package:flutter/material.dart';
import 'package:novi_test/provider/login/login_state_provider.dart';
import 'package:novi_test/utils/constants/stringconst.dart';
import 'package:novi_test/utils/styles/text_styles.dart';
import 'package:novi_test/utils/theme/app_colors.dart';
import 'package:novi_test/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../../utils/config/config.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _bodyContent(context),
    );
  }

  Container _bodyContent(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          //
          _content(context),
          _termsConditon(),
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Consumer<LoginState>(
      builder: (BuildContext context, state, _) {
        return Expanded(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Image.asset(
                  'assets/image/loginback.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    KStyles().bold(
                      text: StringConst.logintitle,
                      size: 25,
                    ),
                    kDim.kGap25,
                    CustomTextField(
                      controller: _usernameController,
                      hintText: "Email Your Email",
                      labelText: "Email",
                    ),
                    kDim.kGap15,
                    CustomTextField(
                      controller: _passwordController,
                      labelText: "Password",
                      hintText: "Enter Password",
                      obscure: true,
                    ),
                    kDim.kGap60,
                    state.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : uiCon.commonButton(
                            width: double.infinity,
                            height: 50,
                            color: AppColors.buttoncolor,
                            onPressed: () {
                              //if not empty
                              if (_usernameController.text.isNotEmpty &&
                                  _passwordController.text.isNotEmpty) {
                                state
                                    .login(
                                  _usernameController.text,
                                  _passwordController.text,
                                )
                                    .then((_) {
                                  if (state.loginModel!.token != null) {
                                    Navigator.pushNamed(context, '/home');
                                  } else {
                                    // Show a proper error message if login failed
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Login failed. Please try again.')),
                                    );
                                  }
                                });
                              } else {
                                // Show a proper error message if login failed
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'please enter the email and password.')),
                                );
                              }
                              //Navigator.pushNamed(context, '/home');
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 20,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Padding _termsConditon() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text:
                "By creating or logging into an account you are agreeing with our ",
            style: KStyles().reg(size: 12, text: '').style,
            children: [
              TextSpan(
                text: "Terms and Conditions ",
                style: KStyles()
                    .bold(size: 12, text: '', color: AppColors.darkblue)
                    .style,
              ),
              TextSpan(
                text: "and ",
                style: KStyles()
                    .reg(
                      size: 12,
                      text: '',
                    )
                    .style,
              ),
              TextSpan(
                text: "Privacy Policy.",
                style: KStyles()
                    .bold(size: 12, text: '', color: AppColors.darkblue)
                    .style,
              ),
            ],
          )),
    );
  }
}
