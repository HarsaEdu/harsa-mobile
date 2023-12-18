import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_model.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';
import 'package:harsa_mobile/viewmodels/daftar_kelas_provider.dart';
import 'package:harsa_mobile/viewmodels/kelas_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/kelas_widgets/kelas_card_component.dart';
import 'widgets/statistic_card.dart';
import 'widgets/testimoni_card.dart';

class DaftarKelasScreen extends StatefulWidget {
  final CourseDetailsData? data;

  const DaftarKelasScreen({super.key, this.data});

  @override
  State<DaftarKelasScreen> createState() => _DaftarKelasScreenState();
}

class _DaftarKelasScreenState extends State<DaftarKelasScreen> {
  @override
  void initState() {
    final provider = Provider.of<DaftarKelasProvider>(context, listen: false);
    provider.getEnrolledCourses(context, data: widget.data!);
    provider.getCourseFeedbacks(courseId: widget.data!.course.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const SizedBox(width: 12),
                Text(
                  'Kelas',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Consumer<DaftarKelasProvider>(
                          builder: (context, state, _) {
                        return state.loadingState == LoadingState.loading
                            ? const Padding(
                                padding: EdgeInsets.all(16),
                                child: Center(
                                  child: CircularProgressIndicator(
                                      color: ColorsPallete.sandyBrown),
                                ),
                              )
                            : KelasCard(
                                classImage: widget.data!.course.imageUrl,
                                className: widget.data!.course.title,
                                mentorName: widget.data!.course.intructur.name,
                                button: widget.data!.isSubscription
                                    ? "Daftar"
                                    : "Berlangganan Sekarang",
                                onPressed: () {
                                  Provider.of<DaftarKelasProvider>(context,
                                          listen: false)
                                      .checkSubs(
                                    context,
                                    courseId: widget.data!.course.id,
                                    isSubbed: widget.data!.isSubscription,
                                  );
                                });
                      }),
                      const SizedBox(height: 16),
                      Text(
                        'Deskripsi Kelas',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.data!.course.description,
                      ),
                      const SizedBox(height: 20),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              widget.data!.course.intructur.imageUrl),
                        ),
                        title: Text(widget.data!.course.intructur.name),
                        subtitle: Text(widget.data!.course.intructur.job),
                        contentPadding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          StatisticCard(
                            title: 'Siswa',
                            subtitle: widget.data!.course.enrolled.toString(),
                            width: MediaQuery.of(context).size.width,
                          ),
                          const SizedBox(width: 12),
                          StatisticCard(
                            title: 'Materi',
                            subtitle:
                                widget.data!.course.totalModules.toString(),
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
                          // TextButton(
                          //   onPressed: () {
                          //     Navigator.pushNamed(context, "/ulasan");
                          //   },
                          //   child: Text(
                          //     'Lainnya',
                          //     style: Theme.of(context)
                          //         .textTheme
                          //         .bodyLarge!
                          //         .copyWith(fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                Consumer<DaftarKelasProvider>(builder: (context, state, _) {
                  // return SliverList(
                  //   delegate: SliverChildBuilderDelegate(
                  //     (context, index) => Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  //       child: TestimoniCard(
                  //         imageUrl: state
                  //             .courseFeedbackModel!.data[index].user.imageUrl,
                  //         name:
                  //             state.courseFeedbackModel!.data[index].user.name,
                  //         timeAgo:
                  //             Provider.of<KelasProvider>(context, listen: false)
                  //                 .feedbackSince(state.courseFeedbackModel!
                  //                     .data[index].updatedAt),
                  //         reviewText:
                  //             state.courseFeedbackModel!.data[index].content,
                  //         rating: state.courseFeedbackModel!.data[index].rating,
                  //       ),
                  //     ),
                  //     childCount: state.courseFeedbackModel!.data.length > 3
                  //         ? 3
                  //         : state.courseFeedbackModel!.data.length,
                  //   ),
                  // );
                  return state.courseFeedbackModel == null
                      ? const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 6,
                          ),
                          child: Text("Belum ada ulasan"),
                        )
                      : Column(
                          children: [
                            for (final feedback
                                in state.courseFeedbackModel!.data.take(5))
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: TestimoniCard(
                                  imageUrl: feedback.user.imageUrl,
                                  name: feedback.user.name,
                                  timeAgo: Provider.of<KelasProvider>(context,
                                          listen: false)
                                      .feedbackSince(feedback.updatedAt),
                                  reviewText: feedback.content,
                                  rating: feedback.rating,
                                ),
                              ),
                          ],
                        );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
