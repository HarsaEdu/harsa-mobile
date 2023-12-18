import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/feedback_models/course_feedback_models.dart';
import 'package:harsa_mobile/models/feedback_models/my_feedback_model.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/viewmodels/feedback_provider.dart';
import 'package:harsa_mobile/viewmodels/kelas_provider.dart';
import 'package:harsa_mobile/views/screens/ulasan_screen/widgets/myulasan_card.dart';
import 'package:harsa_mobile/views/screens/ulasan_screen/widgets/testi_card.dart';
import 'package:provider/provider.dart';

class ListFeedback extends StatelessWidget {
  final CourseFeedbackModel? feedback;
  final MyFeedbackModel? myFeedback;

  const ListFeedback({
    Key? key,
    this.feedback,
    this.myFeedback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedbackProvider>(
      builder: (context, provider, _) {
        if (feedback == null) {
          return const Padding(
            padding: EdgeInsets.all(40),
            child: Center(
              child: CircularProgressIndicator(
                color: ColorsPallete.sandyBrown,
              ),
            ),
          );
        } else {
          return Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: feedback!.data.length,
              itemBuilder: (BuildContext context, int itemIndex) {
                if (myFeedback != null && itemIndex == 0) {
                  return MyUlasanCard(
                    imageUrl: myFeedback!.data.user.imageUrl,
                    name: myFeedback!.data.user.name,
                    timeAgo: Provider.of<KelasProvider>(context, listen: false)
                        .feedbackSince(myFeedback!.data.updatedAt),
                    reviewText: myFeedback!.data.content,
                    rating: myFeedback!.data.rating,
                  );
                } else {
                  return TestiCard(
                    imageUrl: feedback!.data[itemIndex].user.imageUrl,
                    name: feedback!.data[itemIndex].user.name,
                    timeAgo: Provider.of<KelasProvider>(context, listen: false)
                        .feedbackSince(feedback!.data[itemIndex].updatedAt),
                    reviewText: feedback!.data[itemIndex].content,
                    rating: feedback!.data[itemIndex].rating,
                  );
                }
              },
            ),
          );
        }
      },
    );
  }
}
