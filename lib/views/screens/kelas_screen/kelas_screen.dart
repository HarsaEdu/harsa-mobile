import 'package:flutter/material.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/viewmodels/kelas_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/kelas_widgets/kelas_card_component.dart';
import 'widgets/deskripsi_tabview.dart';
import 'widgets/materi_tabview.dart';

class KelasScreen extends StatefulWidget {
  final Map? data;

  const KelasScreen({super.key, this.data});

  @override
  State<KelasScreen> createState() => _KelasScreenState();
}

class _KelasScreenState extends State<KelasScreen> {
  @override
  void initState() {
    final provider = Provider.of<KelasProvider>(context, listen: false);
    provider.getCourseDetails(courseId: widget.data?["course"].courseId);
    provider.getCourseFeedbacks(courseId: widget.data?["course"].courseId);
    provider.getMyCourseFeedback(courseId: widget.data?["course"].courseId);
    provider.getModuleData(courseId: widget.data?["course"].courseId);
    provider.ratingController = TextEditingController();
    provider.isEditing = false;
    provider.isUpdating = false;
    provider.rating = 0;
    super.initState();
  }

  @override
  void dispose() {
    final provider = Provider.of<KelasProvider>(context, listen: false);
    provider.ratingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 16),
              Row(
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
              const SizedBox(height: 16),
              Consumer<KelasProvider>(builder: (context, state, _) {
                final course = state.courseDetailsModel;
                return course == null
                    ? const Padding(
                        padding: EdgeInsets.all(40),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorsPallete.sandyBrown,
                          ),
                        ),
                      )
                    : KelasCard(
                        classImage: course.data.course.imageUrl,
                        className: course.data.course.title,
                        mentorName: course.data.course.intructur.name,
                        progress: course.data.courseTracking.progress,
                        // dueDate: course.data.,
                      );
              }),
              TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'Deskripsi',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Materi',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
                indicatorColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Consumer<KelasProvider>(builder: (context, state, _) {
                      final course = state.courseDetailsModel;
                      final feedback = state.courseFeedbackModel;
                      final myFeedback = state.myFeedbackModel;
                      return course == null || feedback == null
                          ? const Padding(
                              padding: EdgeInsets.all(40),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: ColorsPallete.sandyBrown,
                                ),
                              ),
                            )
                          : DeskripsiTabView(
                              course: course.data,
                              feedback: feedback,
                              myFeedback: myFeedback,
                            );
                    }),
                    Consumer<KelasProvider>(builder: (context, state, _) {
                      return MateriTabView(moduleData: state.moduleData);
                    }),
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
