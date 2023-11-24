// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harsa_mobile/models/ulasan_model.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';

class CardUlasan extends StatelessWidget {
  final UlasanModel ulasan;
  final Function() onEdit;
  final Function() onDelete;

  const CardUlasan({
    super.key,
    required this.ulasan,
    required this.onEdit,
    required this.onDelete,
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
                backgroundImage: NetworkImage(ulasan.fotoUrl),
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
                          ulasan.namaPengguna,
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
                          ' ${ulasan.waktu}',
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      ulasan.teksUlasan,
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
                                  index < ulasan.rating
                                      ? 'assets/icons/filled/rating.svg'
                                      : 'assets/icons/filled/non_rating.svg',
                                  color: index < ulasan.rating
                                      ? Colors.amber
                                      : Colors.grey,
                                  width: 16,
                                  height: 14,
                                ),
                              );
                            }),
                          ),
                          const Spacer(),
                          if (ulasan.isUserReview)
                            Row(
                              children: [
                                IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/icons/outline/square_and_pencil.svg',
                                    width: 24,
                                    height: 24,
                                    color: Colors.black,
                                  ),
                                  onPressed: onEdit,
                                ),
                                IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/icons/outline/trash.svg',
                                    width: 24,
                                    height: 24,
                                    color: Colors.black,
                                  ),
                                  onPressed: onDelete,
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
