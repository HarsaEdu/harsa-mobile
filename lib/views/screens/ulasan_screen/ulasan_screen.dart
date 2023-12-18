import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/viewmodels/kelas_provider.dart';
import 'package:harsa_mobile/views/screens/ulasan_screen/widgets/list_feedback.dart';
import 'package:harsa_mobile/views/screens/ulasan_screen/widgets/sliding_panel.dart';

class UlasanScreen extends StatefulWidget {
  final Map? data;

  const UlasanScreen({Key? key, this.data}) : super(key: key);

  @override
  State<UlasanScreen> createState() => _UlasanScreenState();
}

class _UlasanScreenState extends State<UlasanScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                const Text(
                  'Ulasan',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<KelasProvider>(
              builder: (context, kelasProvider, _) {
                final feedback = kelasProvider.courseFeedbackModel;
                final myFeedback = kelasProvider.myFeedbackModel;
                return feedback == null
                    ? const Padding(
                        padding: EdgeInsets.all(40),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorsPallete.sandyBrown,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          ListFeedback(
                            feedback: feedback,
                            myFeedback: myFeedback,
                          ),
                          const SlidingPanel(),
                        ],
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
