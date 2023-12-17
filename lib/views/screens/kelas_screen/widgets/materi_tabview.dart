import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/classes_models.dart/materi_model.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/video_screen.dart';
import 'package:harsa_mobile/views/screens/quiz_screen/quiz_screen.dart';
import 'package:harsa_mobile/views/screens/tugas_screen/tugas_screen.dart';
import 'materi_card.dart';

class MateriTabView extends StatelessWidget {
  final MateriModel? moduleData;
  const MateriTabView({super.key, this.moduleData});

  @override
  Widget build(BuildContext context) {
    if (moduleData == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    // Fungsi untuk membangun list MateriItem dari subModules, submissions, dan quizzes
    List<Widget> buildMateriItems() {
      List<Widget> items = [];

      // Menambahkan subModules
      for (var subModule in moduleData!.subModules) {
        items.add(InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const VideoScreen()));
            },
            child: MateriItem(
                title: subModule.title, completed: subModule.isComplete)));
        items.add(const Divider(thickness: 0.5, color: Colors.black));
      }

      // Menambahkan submissions
      for (var submission in moduleData!.submissions) {
        items.add(InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        TugasScreen(idTugas: moduleData!.submissions[0].id)));
          },
          child: MateriItem(
              title: submission.title, completed: submission.isComplete),
        ));
        items.add(const Divider(thickness: 0.5, color: Colors.black));
      }

      // Menambahkan quizzes
      for (var quiz in moduleData!.quizzes) {
        items.add(InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const QuizScreen()));
            },
            child: MateriItem(title: quiz.title, completed: quiz.isComplete)));
        items.add(const Divider(thickness: 0.5, color: Colors.black));
      }

      return items;
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          MateriCard(
            title: moduleData!.title,
            description: moduleData!.description,
            progress: moduleData!.progress,
          ),
          const SizedBox(height: 10),
          Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 70),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: ColorsPallete.lightBlueSky,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: buildMateriItems(),
                    // children: [
                    //   SizedBox(height: 8),
                    //   Divider(thickness: 0.5, color: Colors.black),
                    //   MateriItem(
                    //       title: 'Materi - Pengenalan UI/UX', completed: true),
                    //   Divider(thickness: 0.5, color: Colors.black),
                    //   MateriItem(
                    //       title: 'Tugas - Penjelasan dan contoh UI/UX',
                    //       completed: false),
                    //   Divider(thickness: 0.5, color: Colors.black),
                    //   MateriItem(
                    //       title: 'Quiz - Post Test Introducing UI/UX',
                    //       completed: false),
                    // ],
                  ),
                ),
              ),
              const MateriCard(
                title: 'UI/UX Fundamental',
                description: 'Explain About UI/UX Fundamental',
                progress: 0.5, // 50% progress
              ),
            ],
          ),
          const SizedBox(height: 10),
          const MateriCard(
            title: 'UX Research',
            description: 'Explain About UI/UX Fundamental',
            progress: 0, // 50% progress
          ),
        ],
      ),
    );
  }
}
