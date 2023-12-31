import 'package:flutter/material.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';
import 'package:harsa_mobile/viewmodels/edit_sandi_provider.dart';
import 'package:provider/provider.dart';

class EditSandiScreen extends StatefulWidget {
  const EditSandiScreen({super.key});

  @override
  State<EditSandiScreen> createState() => _EditSandiScreenState();
}

class _EditSandiScreenState extends State<EditSandiScreen> {
  @override
  void initState() {
    final provider = Provider.of<EditSandiProvider>(context, listen: false);
    provider.sandiLamaController.clear();
    provider.sandiBaruController.clear();
    provider.sandiConfirmController.clear();
    provider.loadingState = LoadingState.initial;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ubah Kata Sandi",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
          ),
        ),
      ),
      body: Consumer<EditSandiProvider>(builder: (context, state, _) {
        return Form(
          key: state.editSandiFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: <Widget>[
              const Text(
                "Sandi Lama",
                style: TextStyle(
                  color: Color(0xFF94959B),
                ),
              ),
              Stack(
                children: <Widget>[
                  TextFormField(
                    controller: state.sandiLamaController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(right: 48),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusColor: Colors.red,
                    ),
                    cursorColor: Colors.black,
                    obscureText: state.isSandiLamaObscure,
                    validator: (value) => state.validateOldPassword(value),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => state.toggleObscure("lama"),
                      icon: Icon(
                        state.isSandiLamaObscure
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: const Color(0xFFD9D9D9),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                "Sandi Baru",
                style: TextStyle(
                  color: Color(0xFF94959B),
                ),
              ),
              Stack(
                children: <Widget>[
                  TextFormField(
                    controller: state.sandiBaruController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(right: 48),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusColor: Colors.red,
                    ),
                    cursorColor: Colors.black,
                    obscureText: state.isSandiBaruObscure,
                    validator: (value) => state.validateNewPassword(value),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => state.toggleObscure("baru"),
                      icon: Icon(
                        state.isSandiBaruObscure
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: const Color(0xFFD9D9D9),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                "Konfirmasi Sandi Baru",
                style: TextStyle(
                  color: Color(0xFF94959B),
                ),
              ),
              Stack(
                children: <Widget>[
                  TextFormField(
                    controller: state.sandiConfirmController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(right: 48),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusColor: Colors.red,
                    ),
                    cursorColor: Colors.black,
                    obscureText: state.isSandiConfirmObscure,
                    validator: (value) => state.validateConfirmPassword(value),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => state.toggleObscure("confirm"),
                      icon: Icon(
                        state.isSandiConfirmObscure
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: const Color(0xFFD9D9D9),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              state.loadingState == LoadingState.failed
                  ? const Text(
                      "Sandi lama salah",
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    )
                  : const SizedBox(),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: state.loadingState == LoadingState.loading
                          ? null
                          : () => state.submitEditSandi(context),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Ubah Kata Sandi",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
