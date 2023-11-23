import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/widgets/testimoni_card.dart';

import 'statistic_card.dart';

class DeskripsiTabView extends StatelessWidget {
  const DeskripsiTabView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deskripsi Kelas',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            ),
            const SizedBox(height: 20),
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/40'),
              ),
              title: Text('Wahyu Nugroho'),
              subtitle: Text('Universitas Gajah Mada'),
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                StatisticCard(
                  title: 'Siswa',
                  subtitle: '235',
                  width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(width: 12),
                StatisticCard(
                  title: 'Materi',
                  subtitle: '25',
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ulasan',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Lainnya',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            CarouselSlider.builder(
              itemCount: 5,
              options: CarouselOptions(
                // enlargeCenterPage: true,
                height: height * 0.16,
                autoPlay: true,
              ),
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return const TestimoniCard(
                  name: 'Ponyo Sunyopo',
                  timeAgo: '12 h lalu',
                  reviewText:
                      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu.',
                  rating: 4,
                );
              },
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Beri Ulasan',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize:
                      MainAxisSize.min, // Menjadikan Row sekecil mungkin
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Icon(
                        index < 0 ? Icons.star : Icons.star_border,
                        color: Colors.black,
                        size: 28,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 8),
                TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsPallete.sandyBrown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                    ),
                    child: Text('Kirim',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
