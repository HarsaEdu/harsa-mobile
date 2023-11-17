import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harsa_mobile/viewmodels/signupdata_provider.dart';
import 'package:provider/provider.dart';

class SignupDataScreen extends StatefulWidget {
  const SignupDataScreen({super.key});

  @override
  State<SignupDataScreen> createState() => _SignupDataScreenState();
}

class _SignupDataScreenState extends State<SignupDataScreen> {
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
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      'assets/icons/chevron-left.svg',
                    ),
                  ),

                  // title
                  Text(
                    "Isi Data",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),

                  const SizedBox(width: 10),
                ],
              ),

              SizedBox(height: screenHeight / 10),

              // isi data form
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Consumer<SignupDataProvider>(
                  builder: (context, state, _) {
                    return Form(
                      key: state.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // firstname label
                          const Text(
                            "Nama Depan",
                          ),
                          const SizedBox(height: 8),
                          // firstname field
                          TextFormField(
                            controller: state.firstnameController,
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

                          // last name label
                          const Text(
                            "Nama Belakang",
                          ),
                          const SizedBox(height: 8),
                          // last name field
                          TextFormField(
                            controller: state.lastnameController,
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

                          // dob label
                          const Text(
                            "Tanggal Lahir",
                          ),
                          const SizedBox(height: 8),
                          // dob field
                          TextFormField(
                            controller: state.dateofbirthController,
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

                          // phone number label
                          const Text(
                            "Nomor Telepon",
                          ),
                          const SizedBox(height: 8),
                          // phone number field
                          TextFormField(
                            controller: state.phoneController,
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

                          // gender label
                          const Text(
                            "Jenis Kelamin",
                          ),
                          const SizedBox(height: 8),
                          // gender field
                          DropdownButtonFormField(
                            icon: const Icon(Icons.keyboard_arrow_down),
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
                            value: state.genderValue,
                            onChanged: (String? value) =>
                                state.selectGender(value!),
                            items: state.gender
                                .map<DropdownMenuItem<String>>(
                                    (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ))
                                .toList(),
                          ),

                          SizedBox(height: screenHeight / 20),

                          // submit button
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: ElevatedButton(
                                  child: const Text(
                                    "Simpan",
                                  ),
                                  onPressed: () {
                                    // confirmation dialog
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          alignment: Alignment.center,
                                          actionsPadding:
                                              const EdgeInsets.fromLTRB(
                                                  20, 0, 20, 20),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: const BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          title: Text(
                                            "Simpan data user?",
                                            style: GoogleFonts.poppins(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          content: Text(
                                            "Konfirmasi simpan data",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                            textAlign: TextAlign.center,
                                          ),
                                          actionsAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          actions: <Widget>[
                                            // cancel button
                                            OutlinedButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              style: OutlinedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              child: Text(
                                                "No, cancel",
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),

                                            // confirm button
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pushReplacementNamed(
                                                  context,
                                                  '/signupcategory',
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                backgroundColor:
                                                    const Color(0xFFF2994A),
                                                side: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Text(
                                                "Yes, confirm",
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
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

              // lewati button
              // ada di wireframe tapi gaada di hifi

              // TextButton(
              //   onPressed: () => Navigator.pushNamed(
              //     context,
              //     '/signupcategory',
              //   ),
              //   child: Container(
              //     padding: const EdgeInsets.only(bottom: 1),
              //     decoration: const BoxDecoration(
              //       border: Border(
              //         bottom: BorderSide(
              //           color: Colors.black,
              //         ),
              //       ),
              //     ),
              //     child: Text(
              //       "Lewati",
              //       style: GoogleFonts.poppins(
              //         color: Colors.black,
              //         letterSpacing: 0.35,
              //         fontSize: 14,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
