import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/classes_models.dart/materi_model.dart';
import 'package:harsa_mobile/models/classes_models.dart/new_course_details_model.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/list_materi_screen.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/video_screen.dart';
import 'package:harsa_mobile/views/screens/quiz_screen/quiz_screen.dart';
import 'package:harsa_mobile/views/screens/tugas_screen/tugas_screen.dart';
import 'materi_card.dart';

class MateriTabView extends StatelessWidget {
  final CourseData? courseData;
  final MateriModel? moduleData;
  const MateriTabView({super.key, this.courseData, this.moduleData});

  @override
  Widget build(BuildContext context) {
    if (courseData == null || moduleData == null) {
      return const Center(child: CircularProgressIndicator());
    }

    List<Widget> buildMateriItems(BuildContext context, Module module) {
      List<Widget> items = [];

      // Menyiapkan list untuk subModules, submissions, dan quizzes yang berkaitan dengan modul ini
      var subModuleItems =
          moduleData!.subModules.where((el) => el.id == module.id).toList();
      var submissionItems =
          moduleData!.submissions.where((el) => el.id == module.id).toList();
      var quizItems =
          moduleData!.quizzes.where((el) => el.id == module.id).toList();

      // Gabungkan semua items ke dalam satu list untuk memudahkan penambahan Divider
      var combinedItems = [
        ...subModuleItems.map((subModule) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VideoScreen(),
                  ),
                );
              },
              child: MateriItem(
                  title: subModule.title, completed: subModule.isComplete),
            )),
        ...submissionItems.map((submission) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TugasScreen(idTugas: submission.id),
                  ),
                );
              },
              child: MateriItem(
                  title: submission.title, completed: submission.isComplete),
            )),
        ...quizItems.map(
          (quiz) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizScreen(id: quiz.id),
                ),
              );
            },
            child: MateriItem(title: quiz.title, completed: quiz.isComplete),
          ),
        ),
      ];

      // Iterasi melalui combinedItems dan tambahkan Divider setelah setiap item kecuali yang terakhir
      for (var i = 0; i < combinedItems.length; i++) {
        items.add(combinedItems[i]);
        // Tambahkan Divider jika bukan item terakhir
        if (i < combinedItems.length - 1) {
          items.add(const Divider(thickness: 0.5, color: Colors.black));
        }
      }

      // Jika tidak ada items untuk ditampilkan, kembalikan SizedBox kosong
      if (items.isEmpty) {
        return [const SizedBox.shrink()];
      }

      // Jika ada items, kembalikan Container dengan list items di dalamnya
      return [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: ColorsPallete.lightBlueSky,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Column(children: items),
        ),
      ];
    }

    List<Widget> buildModules(BuildContext context) {
      List<Widget> items = [];

      for (var section in courseData!.sections) {
        for (var module in section.modules) {
          items.add(
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListMateriScreen(
                        moduleId: module.id,
                        title: module.title,
                        instructur: courseData!.course.instructor.name,
                        progress: courseData!.courseTracking.progress),
                  ),
                );
              },
              child: MateriCard(
                title: module.title,
                description: module.description,
                progress: module.progress.toDouble(),
              ),
            ),
          );
          items.addAll(buildMateriItems(context, module));
          items.add(const SizedBox(height: 8));
        }
      }
      return items;
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          ...buildModules(context),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
