import 'dart:async';

import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  late Timer timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          elevation: 0,
        ),
        backgroundColor: whiteColor,
        body: Padding(
          padding:
              const EdgeInsets.only(right: 30, left: 30, bottom: 30, top: 10),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // new line
                    children: [
                      const SizedBox(),
                      const Text("Forget Password", style: headingStyle),
                      const SizedBox(height: 10),
                      Text(
                          "please enter your Email Address to get link reset your PIN",
                          style: descriptionStyle),
                      const SizedBox(height: 60),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        enabled: true ,
                        onChanged: (value) {
                          value = value.trim();
                        },
                        decoration: customInputDecoration("Email Address",
                            isConnected: true),
                        validator: (val) {
                          // This is a regular expression (regex) for validating email addresses.
                          final RegExp emailRegex = RegExp(
                            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
                          );

                          // Checks if the value passed to the validator (the email address) is empty.
                          if (val!.isEmpty) {
                            // If it is empty, it returns an error message.
                            return 'Email Address Is Empty';
                          } else {
                            // If the email address isn't empty, it checks the value against the regex.
                            if (!emailRegex.hasMatch(val)) {
                              // If the email address doesn't match the regex, it returns an error message.
                              return 'Email Address is Not Valid';
                            }
                            // If there are no issues, it returns null, indicating that there's no error.
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      const Spacer(),
                      ElevatedButton(
                        style: buttonStyleDarkBg(),
                        onPressed: () async {
                          // Check if the form fields are valid
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context)
                                .pushNamed('successfull-screen', arguments: {
                              'title': 'Successfull',
                              'subtitle': 'please check your email',
                              'message':
                                  'We have sent you an email with a link to reset your PIN.',
                            });
                          }
                        },
                        child: const Text('Continue',
                            style: buttonTextDarkBgStyle),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
