// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/viewmodels/ulasan_screen_provider.dart';
import 'package:provider/provider.dart';

class MyUlasanCard extends StatelessWidget {
  final String fotoUrl;
  final String namaPengguna;
  final String waktu;
  final String teksUlasan;
  final int rating;

  const MyUlasanCard({
    super.key,
    required this.fotoUrl,
    required this.namaPengguna,
    required this.waktu,
    required this.teksUlasan,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(fotoUrl),
                radius: (42 / 2),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          namaPengguna,
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Container(
                            width: 3.0,
                            height: 3.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorsPallete.lightRed,
                            ),
                          ),
                        ),
                        Text(
                          ' $waktu',
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      teksUlasan,
                      style: const TextStyle(fontSize: 12.0),
                    ),
                    const SizedBox(height: 25.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Row(
                            children: List.generate(5, (index) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                child: SvgPicture.asset(
                                  index < rating
                                      ? 'assets/icons/filled/rating.svg'
                                      : 'assets/icons/filled/non_rating.svg',
                                  color: index < rating
                                      ? Colors.amber
                                      : Colors.grey,
                                  width: 16,
                                  height: 14,
                                ),
                              );
                            }),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              IconButton(
                                icon: SvgPicture.asset(
                                  'assets/icons/outline/square_and_pencil.svg',
                                  width: 24,
                                  height: 24,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  Provider.of<UlasanScreenProvider>(context,
                                          listen: false)
                                      .editMyFeedback();
                                },
                              ),
                              IconButton(
                                icon: SvgPicture.asset(
                                  'assets/icons/outline/trash.svg',
                                  width: 24,
                                  height: 24,
                                  color: Colors.black,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
