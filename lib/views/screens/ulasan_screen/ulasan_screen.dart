import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_model.dart';
import 'package:harsa_mobile/models/feedback_models/course_feedback_models.dart';
import 'package:harsa_mobile/models/feedback_models/my_feedback_model.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/viewmodels/ulasan_screen_provider.dart';
import 'package:harsa_mobile/views/screens/ulasan_screen/widgets/myulasan_card.dart';
import 'package:harsa_mobile/views/screens/ulasan_screen/widgets/testi_card.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class UlasanScreen extends StatelessWidget {
  final CourseDetailsData? course;
  final CourseFeedbackModel? feedback;
  final MyFeedbackModel? myFeedback;

  const UlasanScreen({
    Key? key,
    this.feedback,
    this.myFeedback,
    this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UlasanScreenProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SlidingUpPanel(
        controller: provider.panelController,
        maxHeight: MediaQuery.of(context).size.height * 0.3,
        minHeight: 0,
        isDraggable: false,
        defaultPanelState: PanelState.OPEN,
        boxShadow: const [],
        panel: _buildSlidingPanel(context, provider ),
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/outline/chevron_backward.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () {},
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
              child: Consumer<UlasanScreenProvider>(
                builder: (context, provider, child) {
                  return ListView.separated(
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: feedback?.data.length ?? 0,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, itemIndex) {
                      final feedbackItem = feedback?.data[itemIndex];
                      if (feedbackItem != null) {
                        final isMyFeedback = feedbackItem.user.id ==
                            provider.myFeedbackModel?.data.user.id;
                        if (isMyFeedback) {
                          return MyUlasanCard(
                            imageUrl: myFeedback!.data.user.imageUrl,
                            name: myFeedback!.data.user.name,
                            timeAgo: Provider.of<UlasanScreenProvider>(context,
                                    listen: false)
                                .feedbackSince(myFeedback!.data.updatedAt),
                            reviewText: myFeedback!.data.content,
                            rating: myFeedback!.data.rating,
                          );
                        } else {
                          return TestiCard(
                            imageUrl: feedback!.data[itemIndex].user.imageUrl,
                            name: feedback!.data[itemIndex].user.name,
                            timeAgo: Provider.of<UlasanScreenProvider>(context,
                                    listen: false)
                                .feedbackSince(
                                    feedback!.data[itemIndex].updatedAt),
                            reviewText: feedback!.data[itemIndex].content,
                            rating: feedback!.data[itemIndex].rating,
                          );
                        }
                      } else {
                        return Container();
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlidingPanel(BuildContext context, UlasanScreenProvider provider,
      ) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Beri Ulasan',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return GestureDetector(
                // onTap: () {
                //   provider.rate(index);
                // },
                // child: Icon(
                //   index < provider.rating ? Icons.star : Icons.star_border,
                //   color: Colors.black,
                //   size: 28,
                // ),
              );
            }),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: provider.ratingController,
            maxLines: 5,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'Tulis komentar Anda di sini...',
              hintStyle: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsPallete.sandyBrown,
                  minimumSize: const Size(99, 26),
                ),
                onPressed: () {
                  // if (provider.ratingController?.text.isNotEmpty ?? false) {
                  //   provider.submitMyFeedback(courseId: course.course.id);
                  // }
                },
                child: const Text(
                  'Kirim',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
