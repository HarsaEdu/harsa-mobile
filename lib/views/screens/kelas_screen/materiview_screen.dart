import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../viewmodels/materiview_provider.dart';
import '../../widgets/kelas_widgets/kelas_card_component.dart';
import 'widgets/video_button.dart';

class MateriViewScreen extends StatelessWidget {
  const MateriViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<MateriViewProvider>(context, listen: false);
    final controller = provider.controller;
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
                  'Materi',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
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
                              height: MediaQuery.sizeOf(context).height * 0.43,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(width: 0.5, color: Colors.grey),
                              ),
                              child: const Text('OK'),
                            ),
                            Column(
                              children: [
                                const KelasCard(
                                  className: "UI/UX : Becoming Professional",
                                  mentorName: "Bagus Adhi Laksana",
                                  progress: 65,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.235,
                                      child:
                                          WebViewWidget(controller: controller),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 48),
                        const VideoButton()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
