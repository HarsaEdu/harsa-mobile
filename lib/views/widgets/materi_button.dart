import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/constants/colors.dart';

class Mateributton extends StatelessWidget {
  const Mateributton({
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
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),  
                ),
              ),
              Text(
                'Materi',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
              CircleAvatar(
                backgroundColor: ColorsPallete.sandyBrown,
                child: SvgPicture.asset(
                  'assets/icons/outline/chevron_forward.svg',
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
