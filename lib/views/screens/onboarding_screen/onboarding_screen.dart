import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:harsa_mobile/viewmodels/onboarding_viewmodel.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingProvider(),
      builder: (context, child) => Consumer<OnboardingProvider>(
        builder: (context, viewModel, child) => Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                controller: viewModel.pageController,
                itemCount: viewModel.contents.length,
                onPageChanged: viewModel.onPageChanged,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(viewModel.contents[index].imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      viewModel.contents[viewModel.currentPage]
                                          .title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      viewModel.contents[viewModel.currentPage]
                                          .subtitle,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2,
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: Stack(
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        width: 72,
                                        height: 72,
                                        child: CircularProgressIndicator(
                                          value: viewModel.getProgress(),
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                  Color>(
                                            Color(0xFFF2994A),
                                          ),
                                          backgroundColor: Colors.transparent,
                                          strokeWidth: 3.0,
                                        ),
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () =>
                                            viewModel.nextPage(context),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        child: Center(
                                          child: Container(
                                            width: 48,
                                            height: 48,
                                            padding: const EdgeInsets.all(4),
                                            decoration: ShapeDecoration(
                                              color: viewModel.currentPage ==
                                                      viewModel
                                                              .contents.length -
                                                          1
                                                  ? const Color(0xFFF2994A)
                                                  : Colors.transparent,
                                              shape: const CircleBorder(
                                                side: BorderSide(
                                                  width: 2.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
