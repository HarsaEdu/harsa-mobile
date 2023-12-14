import 'package:flutter/material.dart';
import 'package:harsa_mobile/viewmodels/quiz_provider.dart';
import 'package:harsa_mobile/views/widgets/congratulation_alert.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants/colors.dart';
import '../../widgets/confirmation_dialog.dart';
import '../../widgets/kelas_widgets/kelas_card_component.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<QuizProvider>(context, listen: false).getQuizzData(1, 1);
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<QuizProvider>();
    return Scaffold(
      backgroundColor: ColorsPallete.whiteGrey,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios),
                const SizedBox(width: 12),
                Text(
                  'Quiz',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 16),
                        Stack(
                          children: [
                            Container(
                              height: MediaQuery.sizeOf(context).height * 0.70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(width: 0.5, color: Colors.grey),
                              ),
                            ),
                            Column(
                              children: [
                                KelasCard(
                                  className: controller.quizzData!.title,
                                  mentorName: controller.quizzData!.description,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.16,
                                          child: Image.network(
                                            'https://picsum.photos/id/201/5000/3000',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Perhatikan pertanyaan berikut ini!',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(fontSize: 18),
                                      ),
                                      const SizedBox(height: 12),
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.35,
                                        child: PageView.builder(
                                          controller: controller.pageController,
                                          onPageChanged: (index) {
                                            controller
                                                .updateQuestionIndex(index);
                                          },
                                          itemCount: controller
                                              .quizzData?.questions.length,
                                          itemBuilder: (context, index) {
                                            final question = controller
                                                .quizzData?.questions[index];
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  question!.question,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                ),
                                                const SizedBox(height: 12.0),
                                                ...question.options
                                                    .map((option) {
                                                  final optionIndex = question
                                                      .options
                                                      .indexOf(option);
                                                  final isSelected = controller
                                                      .isSelectedOption(
                                                          index, optionIndex);
                                                  return GestureDetector(
                                                    onTap: () =>
                                                        controller.selectOption(
                                                            index, optionIndex),
                                                    child: Container(
                                                      width: double.infinity,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 30,
                                                          vertical: 11.0),
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 10.0),
                                                      decoration: BoxDecoration(
                                                        color: isSelected
                                                            ? ColorsPallete
                                                                .sandyBrown
                                                            : Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                        border: Border.all(),
                                                      ),
                                                      child: Text(
                                                        option.value,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium!
                                                            .copyWith(
                                                                color: isSelected
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Visibility(
                  visible: controller.isGridViewVisible,
                  maintainSize: false,
                  maintainAnimation: true,
                  maintainState: true,
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.17,
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 8,
                        childAspectRatio: 1,
                      ),
                      itemCount: controller.quizzData?.questions.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => controller.goToQuestion(index),
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: controller.currentQuestionIndex == index
                                  ? ColorsPallete.prussianBlue
                                  : controller.isAnswered(index)
                                      ? ColorsPallete
                                          .lightBlueSky // Warna soal yang sudah dijawab
                                      : ColorsPallete
                                          .white, // Warna soal yang belum dijawab
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ColorsPallete.grey),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                color: controller.currentQuestionIndex == index
                                    ? ColorsPallete.white
                                    : ColorsPallete.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: controller.currentQuestionIndex > 0,
                      maintainState: true,
                      maintainSize: true,
                      maintainAnimation: true,
                      child: ElevatedButton(
                        onPressed: controller.currentQuestionIndex > 0
                            ? () {
                                controller.goToPreviousQuestion();
                              }
                            : null,
                        child: Text(
                          'Sebelumnya',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: ColorsPallete.black),
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => controller.toggleGridViewVisibility(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: ColorsPallete.grey)),
                        child: Text(
                          '${controller.currentQuestionIndex + 1}/${controller.quizzData!.questions.length}',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ),
                    const Spacer(),
                    if (controller.currentQuestionIndex <
                        controller.quizzData!.questions.length - 1)
                      ElevatedButton(
                        onPressed: () {
                          controller.goToNextQuestion();
                        },
                        child: Text(
                          'Selanjutnya',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: ColorsPallete.black),
                        ),
                      )
                    else
                      ElevatedButton(
                        onPressed: () {
                          ConfirmationDialog.show(
                            context,
                            title: 'Sudah Yakin dengan jawaban mu',
                            content:
                                'Periksa kembali jawabanmu sebelum di simpan',
                            onConfirm: () async {
                              await controller
                                  .submitQuizzAnswers(1)
                                  .then((value) => Navigator.of(context).pop());
                              if (mounted) {
                                CongratulationAlert.show(context,
                                    title: 'Congratulation!',
                                    content:
                                        'Kamu sudah berhasil menyelesaikan ${controller.quizzData!.title}');
                              }
                            },
                            onCancel: () {
                              Navigator.of(context).pop();
                            },
                          );
                        },
                        child: Text(
                          'Selesai',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: ColorsPallete.black),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
