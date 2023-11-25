import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';

class CustomDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor:
              ColorsPallete.prussianBlue, // Ganti dengan warna yang tepat
          content: Padding(
            padding: const EdgeInsets.only(top: 32.0, bottom: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorsPallete.sandyBrown,
                      width: 4.0,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor:
                        ColorsPallete.sandyBrown, // Warna background circle
                    radius: MediaQuery.sizeOf(context).width * 0.15,
                    child: SvgPicture.asset(
                      'assets/icons/filled/checklist.svg',
                      width: MediaQuery.sizeOf(context).width * 0.2,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Congratulations!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold, color: ColorsPallete.white),
                ),
                const SizedBox(height: 10),
                Text(
                  'Kamu sudah berhasil menyelesaikan Quiz Introducing UI/UX',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: ColorsPallete.white),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Oke',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorsPallete.white),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Menutup dialog
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
