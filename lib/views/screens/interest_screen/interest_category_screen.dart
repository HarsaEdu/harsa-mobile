import 'package:flutter/material.dart';
import 'package:harsa_mobile/services/interest_services.dart';
import 'package:harsa_mobile/viewmodels/intereset_provider.dart';
import 'package:harsa_mobile/views/screens/main_screen/main_screen.dart';
import 'package:provider/provider.dart';

class InterestCategoryScreen extends StatefulWidget {
  const InterestCategoryScreen({Key? key}) : super(key: key);

  @override
  _InterestCategoryScreenState createState() => _InterestCategoryScreenState();
}

class _InterestCategoryScreenState extends State<InterestCategoryScreen> {
  late TextEditingController searchController;
  List<Category> selectedCategories = [];

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  void toggleCategory(Category category) {
    if (selectedCategories.contains(category)) {
      setState(() {
        selectedCategories.remove(category);
      });
    } else {
      setState(() {
        selectedCategories.add(category);
      });
    }
  }

  void confirmSelection() async {
    List<int> categoryIds =
        selectedCategories.map((category) => category.id).toList();
    print('Category IDs: $categoryIds');

    var userInterestService = UserInterestService();
    var result = await userInterestService.createInterest(categoryIds);

    if (result != null) {
      print('Categories successfully submitted!');
    } else {
      print('Failed to submit categories!');
    }
  }

  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Yang Kamu Suka!',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (query) {
                      categoryProvider.filterCategories(query);
                    },
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
              itemCount: categoryProvider.displayedCategories.length,
              itemBuilder: (context, index) {
                final category = categoryProvider.displayedCategories[index];
                final isSelected = selectedCategories.contains(category);

                return GestureDetector(
                  onTap: () {
                    toggleCategory(category);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: isSelected
                          ? const Color(0xFF499DE9)
                          : const Color(0xFFA2D2FF),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Image.asset(
                              category.imagePath,
                              height: 80.0,
                              width: 80.0,
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            category.name,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'OpenSans',
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
              onPressed: () {
                confirmSelection();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MainScreen()), // Ganti MainScreen() dengan halaman tujuan
                );
              },
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
