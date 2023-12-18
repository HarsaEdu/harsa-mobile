// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/viewmodels/ulasan_screen_provider.dart';
import 'package:harsa_mobile/views/screens/ulasan_screen/widgets/ulasan_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class UlasanScreenContent extends StatelessWidget {
  const UlasanScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UlasanScreenProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SlidingUpPanel(
        controller: provider.panelController,
        maxHeight: MediaQuery.of(context).size.height * 0.3,
        minHeight: 0,
        isDraggable: false,
        defaultPanelState: PanelState.OPEN,
        boxShadow: const [],
        panel: _buildSlidingPanel(context, provider),
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/outline/chevron_backward.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    'Ulasan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<UlasanScreenProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: provider.daftarUlasan.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CardUlasan(
                          ulasan: provider.daftarUlasan[index],
                          onEdit: () {
                            provider.showEditPanel(
                                provider.daftarUlasan[index], index);
                          },
                          onDelete: () {
                            provider.deleteUlasan(provider.daftarUlasan[index]);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlidingPanel(
      BuildContext context, UlasanScreenProvider provider) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Beri Ulasan',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          RatingBar.builder(
            initialRating: provider.rating,
            minRating: 1,
            direction: Axis.horizontal,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
            itemSize: 21,
            itemBuilder: (context, index) {
              return SvgPicture.asset(
                index < provider.rating
                    ? 'assets/icons/filled/rating.svg'
                    : 'assets/icons/filled/non_rating.svg',
                color: index < provider.rating ? Colors.amber : Colors.grey,
              );
            },
            onRatingUpdate: (newRating) {
              provider.rating = newRating;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: provider.komentarController,
            maxLines: 5,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'Tulis komentar Anda di sini...',
              hintStyle: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsPallete.sandyBrown,
                  minimumSize: const Size(99, 26),
                ),
                onPressed: () {
                  if (provider.ulasanTerbaru != null) {
                    provider.editUlasan();
                  } else {
                    provider.kirimUlasan();
                  }
                  provider.updateUlasanState();
                  if (provider.komentarController.text.isNotEmpty &&
                      provider.rating > 0) {
                    provider.panelController.close();
                  }
                },
                child: const Text(
                  'Kirim',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
