import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_model.dart';
import 'package:harsa_mobile/models/feedback_models/course_feedback_models.dart';
import 'package:harsa_mobile/models/feedback_models/my_feedback_model.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';
import 'package:harsa_mobile/viewmodels/kelas_provider.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/widgets/testimoni_card.dart';
import 'package:provider/provider.dart';

import 'statistic_card.dart';

class DeskripsiTabView extends StatelessWidget {
  final CourseDetailsData? course;
  final CourseFeedbackModel? feedback;
  final MyFeedbackModel? myFeedback;

  const DeskripsiTabView({
    super.key,
    this.course,
    this.feedback,
    this.myFeedback,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: course == null
            ? const Padding(
                padding: EdgeInsets.all(40),
                child: Center(
                  child: CircularProgressIndicator(
                    color: ColorsPallete.sandyBrown,
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi Kelas',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    course!.course.description,
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(course!.course.intructur.imageUrl),
                    ),
                    title: Text(course!.course.intructur.name),
                    subtitle: Text(course!.course.intructur.job),
                    contentPadding: EdgeInsets.zero,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      StatisticCard(
                        title: 'Siswa',
                        subtitle: course!.course.enrolled.toString(),
                        width: MediaQuery.of(context).size.width,
                      ),
                      const SizedBox(width: 12),
                      StatisticCard(
                        title: 'Materi',
                        subtitle: course!.course.totalModules.toString(),
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ulasan',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/ulasan", arguments: course);
                        },
                        child: Text(
                          'Lainnya',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  CarouselSlider.builder(
                    itemCount: 3,
                    options: CarouselOptions(
                      // enlargeCenterPage: true,
                      height: height * 0.16,
                      autoPlay: true,
                    ),
                    itemBuilder: (
                      BuildContext context,
                      int itemIndex,
                      int pageViewIndex,
                    ) {
                      return feedback == null
                          ? const Padding(
                              padding: EdgeInsets.all(40),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: ColorsPallete.sandyBrown,
                                ),
                              ),
                            )
                          : TestimoniCard(
                              imageUrl: feedback!.data[itemIndex].user.imageUrl,
                              name: feedback!.data[itemIndex].user.name,
                              timeAgo: Provider.of<KelasProvider>(context,
                                      listen: false)
                                  .feedbackSince(
                                      feedback!.data[itemIndex].updatedAt),
                              reviewText: feedback!.data[itemIndex].content,
                              rating: feedback!.data[itemIndex].rating,
                            );
                    },
                  ),
                  const SizedBox(height: 16),
                  Consumer<KelasProvider>(
                    builder: (context, state, _) {
                      return state.loadingState == LoadingState.loading
                          ? const Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: ColorsPallete.sandyBrown,
                                ),
                              ),
                            )
                          : state.isEditing
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Beri Ulasan',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      mainAxisSize: MainAxisSize
                                          .min, // Menjadikan Row sekecil mungkin
                                      children: List.generate(5, (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            state.rate(index);
                                          },
                                          child: Icon(
                                            index < state.rating
                                                ? Icons.star
                                                : Icons.star_border,
                                            color: Colors.black,
                                            size: 28,
                                          ),
                                        );
                                      }),
                                    ),
                                    const SizedBox(height: 8),
                                    Form(
                                      key: state.ratingFormKey,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      child: TextFormField(
                                        controller: state.ratingController,
                                        maxLines: 2,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ColorsPallete.prussianBlue,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.all(12),
                                        ),
                                        cursorColor: ColorsPallete.prussianBlue,
                                        validator: (value) =>
                                            state.validateRating(value),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: ElevatedButton(
                                        onPressed: () => state.submitMyFeedback(
                                            courseId: course!.course.id),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              ColorsPallete.sandyBrown,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 50),
                                        ),
                                        child: Text(
                                            state.isUpdating
                                                ? "Update"
                                                : 'Kirim',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ulasan Anda',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 16),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: ColorsPallete.prussianBlue,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Column(
                                        children: [
                                          TestimoniCard(
                                            imageUrl:
                                                myFeedback!.data.user.imageUrl,
                                            name: myFeedback!.data.user.name,
                                            timeAgo: Provider.of<KelasProvider>(
                                                    context,
                                                    listen: false)
                                                .feedbackSince(
                                                    myFeedback!.data.updatedAt),
                                            reviewText:
                                                myFeedback!.data.content,
                                            rating: myFeedback!.data.rating,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 4,
                                              bottom: 8,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  onPressed: () =>
                                                      state.editMyFeedback(),
                                                  icon: SvgPicture.asset(
                                                    'assets/icons/outline/square_and_pencil.svg',
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                      Colors.white,
                                                      BlendMode.srcIn,
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () =>
                                                      state.deleteMyFeedback(
                                                          courseId: course!
                                                              .course.id),
                                                  icon: SvgPicture.asset(
                                                    'assets/icons/outline/trash.svg',
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                      Colors.white,
                                                      BlendMode.srcIn,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
