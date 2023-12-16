import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';
import 'package:harsa_mobile/viewmodels/signup_provider.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 30, vertical: screenHeight / 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // back button & title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // back button
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, '/login'),
                    child: SvgPicture.asset(
                      'assets/icons/outline/chevron-left.svg',
                    ),
                  ),
                  // title
                  const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 22),
                  ),

                  const SizedBox(width: 10),
                ],
              ),

              SizedBox(height: screenHeight / 10),

              // signup form
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Consumer<SignupProvider>(
                  builder: (context, state, _) {
                    return Form(
                      key: state.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // username label
                          const Text(
                            "Username",
                          ),
                          const SizedBox(height: 8),
                          // username field
                          TextFormField(
                            controller: state.usernameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                borderSide: BorderSide(
                                  color: ColorsPallete.prussianBlue,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 16,
                              ),
                              hintText: "Masukkan Username",
                              errorStyle: const TextStyle(fontSize: 14),
                              errorMaxLines: 3,
                              errorText: state.signupLoadingState ==
                                      LoadingState.failed
                                  ? "*Username / Email sudah terdaftar"
                                  : null,
                            ),
                            cursorColor: ColorsPallete.prussianBlue,
                            validator: (value) => state.validateUsername(value),
                            style: const TextStyle(fontSize: 16),
                          ),

                          SizedBox(height: screenHeight / 40),

                          // email label
                          const Text(
                            "Email",
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
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                borderSide: BorderSide(
                                  color: ColorsPallete.prussianBlue,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 16,
                              ),
                              hintText: "Masukkan alamat email",
                              errorStyle: const TextStyle(fontSize: 14),
                              errorMaxLines: 3,
                              errorText: state.signupLoadingState ==
                                      LoadingState.failed
                                  ? "*Username / Email sudah terdaftar"
                                  : null,
                            ),
                            cursorColor: ColorsPallete.prussianBlue,
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
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                borderSide: BorderSide(
                                  color: ColorsPallete.prussianBlue,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 16,
                              ),
                              hintText: "Masukkan password",
                              errorStyle: TextStyle(fontSize: 14),
                              errorMaxLines: 3,
                            ),
                            obscureText: true,
                            cursorColor: ColorsPallete.prussianBlue,
                            validator: (value) => state.validatePassword(value),
                            style: const TextStyle(fontSize: 16),
                          ),

                          SizedBox(height: screenHeight / 40),

                          // confirm password label
                          const Text(
                            "Konfirmasi Password",
                          ),
                          const SizedBox(height: 8),
                          // confirm password field
                          TextFormField(
                            controller: state.confirmPassController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                borderSide: BorderSide(
                                  color: ColorsPallete.prussianBlue,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 16,
                              ),
                              hintText: "Ketik ulang password",
                              errorStyle: TextStyle(fontSize: 14),
                              errorMaxLines: 3,
                            ),
                            obscureText: true,
                            cursorColor: ColorsPallete.prussianBlue,
                            validator: (value) =>
                                state.validateConfirmPassword(value),
                            style: const TextStyle(fontSize: 16),
                          ),

                          SizedBox(height: screenHeight / 20),

                          // submit button
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: state.signupLoadingState ==
                                          LoadingState.loading
                                      ? null
                                      : () => state.register(context),
                                  // : () {
                                  //     Navigator.pushReplacementNamed(
                                  //         context, "/main");
                                  //     Navigator.pushNamed(
                                  //         context, "/signupdata");
                                  //   },
                                  child: const Text(
                                    "Daftar",
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
              ),

              // SizedBox(height: screenHeight / 40),

              // or continue with
              // ada di wireframe tapi gaada di hifi
              // Column(
              //   mainAxisSize: MainAxisSize.min,
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: <Widget>[
              //     SizedBox(
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: <Widget>[
              //           Expanded(
              //             child: Container(
              //               color: Colors.grey,
              //               height: 1,
              //             ),
              //           ),
              //           const Padding(
              //             padding: EdgeInsets.symmetric(horizontal: 8.0),
              //             child: Text("Or Continue With"),
              //           ),
              //           Expanded(
              //             child: Container(
              //               color: Colors.grey,
              //               height: 1,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     const SizedBox(height: 20),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: <Widget>[
              //         Container(
              //           width: 48,
              //           height: 48,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             border: Border.all(
              //               color: const Color(0xFFC7C7CC),
              //             ),
              //           ),
              //         ),
              //         const SizedBox(width: 12),
              //         Container(
              //           width: 48,
              //           height: 48,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             border: Border.all(
              //               color: const Color(0xFFC7C7CC),
              //             ),
              //           ),
              //         ),
              //         const SizedBox(width: 12),
              //         Container(
              //           width: 48,
              //           height: 48,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             border: Border.all(
              //               color: const Color(0xFFC7C7CC),
              //             ),
              //           ),
              //         ),
              //       ],
              //     )
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
