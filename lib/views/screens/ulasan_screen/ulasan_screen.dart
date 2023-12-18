import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_model.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';
import 'package:harsa_mobile/viewmodels/feedback_provider.dart';
import 'package:provider/provider.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/views/screens/ulasan_screen/widgets/list_feedback.dart';
import 'package:harsa_mobile/views/screens/ulasan_screen/widgets/sliding_panel.dart';

class UlasanScreen extends StatefulWidget {
  final CourseDetailsData? data;

  const UlasanScreen({Key? key, this.data}) : super(key: key);

  @override
  State<UlasanScreen> createState() => _UlasanScreenState();
}

class _UlasanScreenState extends State<UlasanScreen> {
  @override
  void initState() {
    final provider = Provider.of<FeedbackProvider>(context, listen: false);
    provider.getCourseFeedbacks(courseId: widget.data!.course.id);
    provider.getMyCourseFeedback(courseId: widget.data!.course.id);
    provider.ratingController = TextEditingController();
    provider.isEditing = false;
    provider.isUpdating = false;
    provider.rating = 0;
    provider.rating = 0;
    super.initState();
  }

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
            child: Consumer<FeedbackProvider>(
              builder: (context, kelasProvider, _) {
                final feedback = kelasProvider.courseFeedbackModel;
                final myFeedback = kelasProvider.myFeedbackModel;
                return kelasProvider.loadingState == LoadingState.loading
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
