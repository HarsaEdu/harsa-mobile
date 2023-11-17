import 'package:flutter/material.dart';

class SignupCategoryScreen extends StatelessWidget {
  const SignupCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 60,
          horizontal: 16,
        ),
        children: <Widget>[
          // title
          Text(
            "Yang Kamu Suka!",
            style: Theme.of(context).textTheme.titleSmall,
          ),

          const SizedBox(height: 30),

          // search bar (lo-fi)
          Container(
            height: 40,
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(9999),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 4,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFA2D2FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Text(
                      "Kategori ${index + 1}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 14),

          // confirm button
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Konfirmasi",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
