import 'package:flutter/material.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';

import 'materi_card.dart';

class MateriTabView extends StatelessWidget {
  const MateriTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const MateriCard(
            title: 'Introducing UI/UX Design',
            description: 'Explain About UI/UX Fundamental',
            progress: 1.0, // Completed
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
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(height: 8),
                      MateriItem(
                          title: 'Video - Pengenalan UI/UX', completed: true),
                      Divider(thickness: 0.5, color: Colors.black),
                      MateriItem(
                          title: 'Materi - Pengenalan UI/UX', completed: true),
                      Divider(thickness: 0.5, color: Colors.black),
                      MateriItem(
                          title: 'Tugas - Penjelasan dan contoh UI/UX',
                          completed: false),
                      Divider(thickness: 0.5, color: Colors.black),
                      MateriItem(
                          title: 'Quiz - Post Test Introducing UI/UX',
                          completed: false),
                    ],
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
