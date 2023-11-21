import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';

class MateriCardLightBlue extends StatelessWidget {
  final String title;
  final String description;
  final String badge;
  final double progress; // 0.0 to 1.0

  const MateriCardLightBlue({
    super.key,
    required this.title,
    required this.description,
    required this.badge,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsPallete.lightBlueSky,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        // Memungkinkan anak-anak berada di luar kotak
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 36,
              right: 24,
              bottom: 8,
            ),
            child: ListTile(
              title:
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(description,
                  style: Theme.of(context).textTheme.bodySmall),
              trailing: progress == 1.0
                  ? CircleAvatar(
                      backgroundColor: ColorsPallete.sandyBrown,
                      child:
                          SvgPicture.asset('assets/icons/filled/checklist.svg'),
                    )
                  : CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        '${(progress * 100).toInt()}%',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
              contentPadding: EdgeInsets.zero,
            ),
          ),

          // Badge di pojok kiri atas
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              alignment: Alignment.center,
              width: 64,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: const BoxDecoration(
                color: ColorsPallete.sandyBrown,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                badge,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
