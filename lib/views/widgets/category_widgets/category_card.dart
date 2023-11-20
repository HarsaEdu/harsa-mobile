import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harsa_mobile/models/category_card_model.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';

class CategoryCard extends StatelessWidget {
  final CategoryCardModel category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 110,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 224, 221, 221),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              image: DecorationImage(
                image: NetworkImage(category
                    .imageUrl), // Gunakan NetworkImage untuk gambar dari URL
                fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category.subtitle,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/filled/rating.svg',
                        width: 16, // Sesuaikan ukuran sesuai kebutuhan Anda
                        height: 14,
                        colorFilter: const ColorFilter.mode(
                          ColorsPallete.sandyBrown,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        category.rating.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
