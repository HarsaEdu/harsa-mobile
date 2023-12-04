import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';

class PaymentDialog extends StatelessWidget {
  final String title;
  final String content;
  final String iconPath;
  const PaymentDialog({super.key, required this.title, required this.content, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsPallete.prussianBlue,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
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
                    ColorsPallete.sandyBrown,
                radius: MediaQuery.sizeOf(context).width * 0.15,
                child: SvgPicture.asset(
                  iconPath,
                  width: MediaQuery.sizeOf(context).width * 0.2,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold, color: ColorsPallete.white),
            ),
            const SizedBox(height: 10),
            Text(
              content,
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
                      fontWeight: FontWeight.bold, color: ColorsPallete.white),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
