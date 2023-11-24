import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';

class MateriCard extends StatelessWidget {
  final String title;
  final String description;
  final double progress; // 0.0 to 1.0

  const MateriCard({
    super.key,
    required this.title,
    required this.description,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
        color: ColorsPallete.prussianBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white),
        ),
        subtitle: Text(
          description,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white),
        ),
        trailing: progress == 1.0
            ? CircleAvatar(
                backgroundColor: ColorsPallete.sandyBrown,
                child: SvgPicture.asset('assets/icons/filled/checklist.svg'),
              )
            : CircleAvatar(
                // radius: 24,
                backgroundColor: Colors.orange,
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
    );
  }
}

class MateriItem extends StatelessWidget {
  final String title;
  final bool completed;

  const MateriItem({
    Key? key,
    required this.title,
    required this.completed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(title),
          ),
          completed
              ? const Icon(Icons.check_circle, color: ColorsPallete.sandyBrown)
              : const SizedBox(width: 24, height: 24),
        ],
      ),
    );
  }
}
