import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';

class VideoButton extends StatelessWidget {
  const VideoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.5,
        decoration: BoxDecoration(
          color: ColorsPallete.prussianBlue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: ColorsPallete.sandyBrown,
                child: SvgPicture.asset(
                  'assets/icons/outline/chevron_backward.svg',
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              Text(
                'Video',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
              CircleAvatar(
                backgroundColor: ColorsPallete.sandyBrown,
                child: SvgPicture.asset(
                  'assets/icons/outline/chevron_forward.svg',
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
