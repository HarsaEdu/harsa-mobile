import 'package:flutter/material.dart';

class InterestCategoryScreen extends StatefulWidget {
  const InterestCategoryScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InterestCategoryScreenState createState() => _InterestCategoryScreenState();
}

class _InterestCategoryScreenState extends State<InterestCategoryScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> allCategories = [
    'Komputer',
    'Komputer',
    'Komputer',
    'Komputer',
    'Komputer',
    'Komputer',
    'Komputer',
    'Komputer',
  ];
  List<String> displayedCategories = [];

  @override
  void initState() {
    super.initState();
    displayedCategories = allCategories;
  }

  void filterCategories(String query) {
    setState(() {
      displayedCategories = allCategories
          .where((category) =>
              category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yang kamu suka!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: filterCategories,
                    decoration: InputDecoration(
                      labelText: 'Cari kategori',
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.search),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.1,
                mainAxisSpacing: 5.0,
              ),
              itemCount: displayedCategories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: const Color(0xFF092C4C), // Warna #092C4C
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF2994A),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.image,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            'Komputer',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'OpenSans', // Gunakan font Open Sans
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF999999),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: const Text(
                'Konfirmasi',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
