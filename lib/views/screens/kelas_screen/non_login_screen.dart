import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_no_login_model.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';
import 'package:harsa_mobile/viewmodels/daftar_kelas_provider.dart';
import 'package:harsa_mobile/viewmodels/kelas_provider.dart';
import 'package:harsa_mobile/viewmodels/non_login_kelas_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/kelas_widgets/kelas_card_component.dart';
import 'widgets/statistic_card.dart';
import 'widgets/testimoni_card.dart';

class NonLoginClassScreen extends StatefulWidget {
  final CourseDetailsNoLoginData? data;

  const NonLoginClassScreen({super.key, this.data});

  @override
  State<NonLoginClassScreen> createState() => _NonLoginClassScreenState();
}

class _NonLoginClassScreenState extends State<NonLoginClassScreen> {
  late final NonLoginClassProvider pageProvider;

  @override
  void initState() {
    pageProvider = Provider.of<NonLoginClassProvider>(context, listen: false);

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
                                classImage: widget.data!.imageUrl,
                                className: widget.data!.title,
                                mentorName: widget.data!.intructur.name,
                                button: "Login",
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                              );
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
                        widget.data!.description,
                      ),
                      const SizedBox(height: 20),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(widget.data!.intructur.imageUrl),
                        ),
                        title: Text(widget.data!.intructur.name),
                        subtitle: Text((widget.data!.intructur.job)!),
                        contentPadding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          StatisticCard(
                            title: 'Siswa',
                            subtitle: widget.data!.enrolled.toString(),
                            width: MediaQuery.of(context).size.width,
                          ),
                          const SizedBox(width: 12),
                          StatisticCard(
                            title: 'Materi',
                            subtitle: widget.data!.totalModules.toString(),
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
