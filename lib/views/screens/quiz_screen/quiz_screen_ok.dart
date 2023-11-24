import 'package:flutter/material.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/quiz_provider.dart';

class QuizScreenOK extends StatelessWidget {
  const QuizScreenOK({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: Consumer<QuizProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: provider.pageController,
                  onPageChanged: (index) {
                    provider.updateQuestionIndex(index);
                  },
                  itemCount: provider.totalQuestions,
                  itemBuilder: (context, index) {
                    final question = provider.questions[index];
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question.question,
                            style: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          ...question.options.map((option) {
                            final optionIndex =
                                question.options.indexOf(option);
                            final isSelected =
                                provider.isSelectedOption(index, optionIndex);
                            return GestureDetector(
                              onTap: () =>
                                  provider.selectOption(index, optionIndex),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15.0),
                                margin: const EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? ColorsPallete.sandyBrown
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(),
                                ),
                                child: Text(
                                  option,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8,
                    childAspectRatio: 1,
                  ),
                  itemCount: provider.totalQuestions,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: provider.currentQuestionIndex == index
                            ? ColorsPallete.prussianBlue
                            : provider.isAnswered(index)
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
                          color: provider.currentQuestionIndex == index
                              ? ColorsPallete.white
                              : ColorsPallete.black,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (provider.currentQuestionIndex > 0)
                    ElevatedButton(
                      onPressed: () {
                        provider.goToPreviousQuestion();
                      },
                      child: Text(
                        'Sebelumnya',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: ColorsPallete.black),
                      ),
                    ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: ColorsPallete.grey)),
                    child: Text(
                        '${provider.currentQuestionIndex + 1}/${provider.totalQuestions}'),
                  ),
                  if (provider.currentQuestionIndex <
                      provider.totalQuestions - 1)
                    ElevatedButton(
                      onPressed: () {
                        provider.goToNextQuestion();
                      },
                      child: Text(
                        'Selanjutnya',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: ColorsPallete.black),
                      ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
