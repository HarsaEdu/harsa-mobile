import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/ulasan_model.dart';

class CardUlasan extends StatelessWidget {
  final UlasanModel ulasan;

  CardUlasan({required this.ulasan});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(ulasan.fotoUrl),
              radius: 30.0,
            ),
            SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        ulasan.namaPengguna,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 3.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: CircleAvatar(
                          radius: 3.0,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 3.0),
                      Text(
                        ' ${ulasan.waktu}',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    ulasan.teksUlasan,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        color:
                            index < ulasan.rating ? Colors.amber : Colors.grey,
                      );
                    }),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
