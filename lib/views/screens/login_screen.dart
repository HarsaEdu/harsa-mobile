import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harsa_mobile/viewmodels/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 12,
                                ),
                              ),
                              style: Theme.of(context).textTheme.bodyMedium,
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
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 12,
                                ),
                              ),
                              obscureText: true,
                              style: Theme.of(context).textTheme.bodyMedium,
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
                                    onPressed: () {},
                                    child: const Text("Masuk"),
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
                      Text(
                        "Don't have an account? ",
                        style: Theme.of(context).textTheme.bodySmall,
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
