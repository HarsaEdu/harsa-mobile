import 'package:flutter/material.dart';

class CustomBottomSheetDialog {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const CustomBottomSheetContent();
      },
    );
  }
}

class CustomBottomSheetContent extends StatelessWidget {
  const CustomBottomSheetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(9),
                topRight: Radius.circular(9),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Paket Reguler',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 18),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi',
                    style: TextStyle(
                      color: Color(0xFF667084),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Harga terjangkau untuk kantong pelajar dan mahasiswa',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Durasi',
                    style: TextStyle(
                      color: Color(0xFF667084),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '30 hari',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Harga',
                    style: TextStyle(
                      color: Color(0xFF667084),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Rp.35000',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF092C4C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Langganan Sekarang',
                            style: TextStyle(
                              color: Color(0xFFF6F6F6),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
