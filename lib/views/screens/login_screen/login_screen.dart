import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';
import 'package:harsa_mobile/viewmodels/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset:
          false, // prevent the screen resize & widget repositioning on phone keyboard popup (text input field focus)
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          // grey background
          Container(
            width: screenWidth,
            height: screenHeight / 2,
            color: const Color(0xFF092C4C),
          ),

          // continue with
          // ada di wireframe tapi gaada di hifi
          // Positioned(
          //   bottom: screenHeight * 0.03,
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: <Widget>[
          //       SizedBox(
          //         width: screenWidth * 9 / 10,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: <Widget>[
          //             Expanded(
          //               child: Container(
          //                 color: Colors.grey,
          //                 height: 1,
          //               ),
          //             ),
          //             const Padding(
          //               padding: EdgeInsets.symmetric(horizontal: 8.0),
          //               child: Text("Or Continue With"),
          //             ),
          //             Expanded(
          //               child: Container(
          //                 color: Colors.grey,
          //                 height: 1,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       const SizedBox(height: 20),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: <Widget>[
          //           Container(
          //             width: 48,
          //             height: 48,
          //             decoration: BoxDecoration(
          //               shape: BoxShape.circle,
          //               border: Border.all(
          //                 color: const Color(0xFFC7C7CC),
          //               ),
          //             ),
          //           ),
          //           const SizedBox(width: 12),
          //           Container(
          //             width: 48,
          //             height: 48,
          //             decoration: BoxDecoration(
          //               shape: BoxShape.circle,
          //               border: Border.all(
          //                 color: const Color(0xFFC7C7CC),
          //               ),
          //             ),
          //           ),
          //           const SizedBox(width: 12),
          //           Container(
          //             width: 48,
          //             height: 48,
          //             decoration: BoxDecoration(
          //               shape: BoxShape.circle,
          //               border: Border.all(
          //                 color: const Color(0xFFC7C7CC),
          //               ),
          //             ),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),

          // login card
          Center(
            child: Container(
              width: screenWidth * 9 / 10,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 32,
                    offset: Offset(0, 15),
                  ),
                ],
              ),

              // form
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // login title
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight / 30),

                  Consumer<LoginProvider>(
                    builder: (context, state, _) {
                      return Form(
                        key: state.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // input fields
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // email label
                            const Text(
                              "Email / Username",
                            ),
                            const SizedBox(height: 8),
                            // email field
                            TextFormField(
                              controller: state.emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 16,
                                ),
                                hintText: "Masukkan email / username",
                                errorStyle: const TextStyle(fontSize: 14),
                                errorMaxLines: 3,
                                errorText: state.loginLoadingState ==
                                        LoadingState.failed
                                    ? "Email / Username tidak ditemukan"
                                    : null,
                              ),
                              validator: (value) => state.validateEmail(value),
                              style: const TextStyle(fontSize: 16),
                            ),

                            SizedBox(height: screenHeight / 40),

                            // password label
                            const Text(
                              "Password",
                            ),
                            const SizedBox(height: 8),
                            // password field
                            TextFormField(
                              controller: state.passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 16,
                                ),
                                hintText: "Masukkan password Anda",
                                errorStyle: const TextStyle(fontSize: 14),
                                errorMaxLines: 3,
                                errorText: state.loginLoadingState ==
                                        LoadingState.failed
                                    ? "Password yang Anda masukkan salah"
                                    : null,
                              ),
                              obscureText: true,
                              validator: (value) =>
                                  state.validatePassword(value),
                              style: const TextStyle(fontSize: 16),
                            ),

                            SizedBox(height: screenHeight / 60),

                            // forgot password button
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password?",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            SizedBox(height: screenHeight / 30),

                            // submit button
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: state.loginLoadingState ==
                                            LoadingState.loading
                                        ? null
                                        : () => state.login(context),
                                    child: const Text(
                                      "Masuk",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  SizedBox(height: screenHeight / 40),

                  // register button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // the suffix text
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 12),
                      ),

                      // the button
                      TextButton(
                        onPressed: () => Navigator.pushReplacementNamed(
                          context,
                          '/signup',
                        ),
                        child: const Text(
                          "Register Now",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
