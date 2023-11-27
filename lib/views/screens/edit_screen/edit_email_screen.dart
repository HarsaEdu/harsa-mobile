import 'package:flutter/material.dart';
import 'package:harsa_mobile/viewmodels/edit_email_provider.dart';
import 'package:provider/provider.dart';

class EditEmailScreen extends StatefulWidget {
  const EditEmailScreen({super.key});

  @override
  State<EditEmailScreen> createState() => _EditEmailScreenState();
}

class _EditEmailScreenState extends State<EditEmailScreen> {
  @override
  void initState() {
    final provider = Provider.of<EditEmailProvider>(context, listen: false);
    provider.emailController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ubah Email",
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
      body: Consumer<EditEmailProvider>(builder: (context, state, _) {
        return Form(
          key: state.editEmailFormKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: <Widget>[
              const Text(
                "Email",
                style: TextStyle(
                  color: Color(0xFF94959B),
                ),
              ),
              TextFormField(
                controller: state.emailController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusColor: Colors.red,
                ),
                cursorColor: Colors.black,
              ),
              const SizedBox(height: 70),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: state.submitEditEmail,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Ubah",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
