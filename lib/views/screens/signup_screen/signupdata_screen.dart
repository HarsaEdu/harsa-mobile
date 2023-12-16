import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
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
              EdgeInsets.symmetric(horizontal: 28, vertical: screenHeight / 10),
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
                      'assets/icons/outline/chevron-left.svg',
                    ),
                  ),

                  // title
                  const Text(
                    "Isi Data",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(width: 10),
                ],
              ),

              SizedBox(height: screenHeight / 20),

              // isi data form
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
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
                            style: TextStyle(fontSize: 16),
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
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                borderSide: BorderSide(
                                  color: ColorsPallete.prussianBlue,
                                ),
                              ),
                              hintText: "Masukkan nama depan",
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 16,
                              ),
                            ),
                            cursorColor: ColorsPallete.prussianBlue,
                            validator: (value) =>
                                state.validateFirstName(value),
                            style: const TextStyle(fontSize: 16),
                          ),

                          SizedBox(height: screenHeight / 40),

                          // last name label
                          const Text(
                            "Nama Belakang",
                            style: TextStyle(fontSize: 16),
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
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                borderSide: BorderSide(
                                  color: ColorsPallete.prussianBlue,
                                ),
                              ),
                              hintText: "Masukkan nama belakang",
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 16,
                              ),
                            ),
                            cursorColor: ColorsPallete.prussianBlue,
                            validator: (value) => state.validateLastName(value),
                            style: const TextStyle(fontSize: 16),
                          ),

                          SizedBox(height: screenHeight / 40),

                          // dob label
                          const Text(
                            "Tanggal Lahir",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          // dob field
                          Stack(
                            children: <Widget>[
                              TextFormField(
                                controller: state.dateofbirthController,
                                keyboardType: TextInputType.datetime,
                                readOnly: true,
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
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 16,
                                  ),
                                ),
                                cursorColor: ColorsPallete.prussianBlue,
                                validator: (value) => state.validateDate(value),
                                style: const TextStyle(fontSize: 16),
                                onTap: () {
                                  state.selectDate(context);
                                },
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  onPressed: () {
                                    state.selectDate(context);
                                  },
                                  icon: const Icon(
                                    Icons.calendar_month_rounded,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: screenHeight / 40),

                          // phone number label
                          const Text(
                            "Nomor Telepon",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          // phone number field
                          TextFormField(
                            controller: state.phoneController,
                            keyboardType: TextInputType.phone,
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
                              hintText: "Masukkan nomor telepon",
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 16,
                              ),
                            ),
                            cursorColor: ColorsPallete.prussianBlue,
                            validator: (value) => state.validatePhone(value),
                            style: const TextStyle(fontSize: 16),
                          ),

                          SizedBox(height: screenHeight / 40),

                          // gender label
                          const Text(
                            "Jenis Kelamin",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: <Widget>[
                              Radio(
                                value: "m",
                                groupValue: state.genderValue,
                                visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity,
                                ),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                onChanged: (value) =>
                                    state.selectGender(value!),
                                activeColor: const Color(0xFF105DA3),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                "Pria",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Radio(
                                value: "f",
                                groupValue: state.genderValue,
                                visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity,
                                ),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                onChanged: (value) =>
                                    state.selectGender(value!),
                                activeColor: const Color(0xFF105DA3),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                "Wanita",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: screenHeight / 20),

                          // submit button
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: const Text(
                                    "Simpan",
                                    style: TextStyle(
                                      color: Color(0xFF222222),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  onPressed: () {
                                    state.submitProfileData(context);
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

              SizedBox(height: screenHeight / 30),

              // lewati button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        '/signupcategory',
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        side: const BorderSide(color: Color(0xFFF2994A)),
                        foregroundColor: Colors.orange,
                      ),
                      child: const Text(
                        "Lewati",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
