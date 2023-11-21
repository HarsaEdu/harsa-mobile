import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:harsa_mobile/models/ulasan_model.dart';
import 'package:harsa_mobile/views/widgets/ulasan_widgets/card_ulasan.dart';

class UlasanScreen extends StatefulWidget {
  @override
  _UlasanScreenState createState() => _UlasanScreenState();
}

class _UlasanScreenState extends State<UlasanScreen> {
  final List<UlasanModel> daftarUlasan = [
    UlasanModel(
      fotoUrl:
          'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
      namaPengguna: 'Pengguna 1',
      waktu: '5 h lalu',
      teksUlasan: 'There are many variations',
      rating: 4.0,
    ),
  ];

  double rating = 0.0;
  TextEditingController komentarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ulasan',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: daftarUlasan.length,
                itemBuilder: (context, index) {
                  return CardUlasan(ulasan: daftarUlasan[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.32,
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          border: Border.all(color: Colors.grey),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Beri Ulasan',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 16.0),

            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (newRating) {
                setState(() {
                  rating = newRating;
                });
              },
            ),

            SizedBox(height: 16.0),

            // Komentar
            TextFormField(
              controller: komentarController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Tulis komentar Anda di sini...',
              ),
            ),
            SizedBox(height: 16.0),

            // Tombol Kirim
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Kirim',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
