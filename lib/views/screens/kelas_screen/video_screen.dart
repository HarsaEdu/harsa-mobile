import 'package:flutter/material.dart';
import 'package:harsa_mobile/viewmodels/video_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../widgets/kelas_widgets/kelas_card_component.dart';
import 'widgets/video_button.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'Video',
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
                                const SizedBox(height: 20),
                                ChangeNotifierProvider(
                                  create: (_) =>
                                      VideoScreenProvider('nPt8bK2gbaU'),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Consumer<VideoScreenProvider>(
                                          builder: (context, prov, _) =>
                                              YoutubePlayer(
                                                controller: prov.controller,
                                                showVideoProgressIndicator:
                                                    true,
                                                onReady: () {},
                                              )),
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


