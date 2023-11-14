import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(),
          SingleChildScrollView(
            child: Column(
              children: [
                const Text('Kategori'),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) => Container(
                    height: 84,
                    width: 84,
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {},
                      child: const Text('Kategori'),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
