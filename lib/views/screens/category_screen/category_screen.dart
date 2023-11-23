import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/viewmodels/category_screen_provider.dart';
import 'package:harsa_mobile/views/widgets/category_widgets/category_card.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _CategoryScreen();
  }
}

class _CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<_CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryScreenProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: ColorsPallete.whiteGrey,
          body: DefaultTabController(
            length: provider.getCategoryCount(),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Row(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/outline/chevron_backward.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.black,
                            BlendMode.srcIn,
                          ),
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {},
                      ),
                      const Text(
                        'Kategori',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey),
                      bottom: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: Stack(
                    children: [
                      provider.isCategoryList
                          ? _buildCategoryTabBar(provider)
                          : _buildToggleTabBar(),
                      Positioned(
                        right: 0.2,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            border: Border(
                              left: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset(
                              provider.isArrowUp
                                  ? 'assets/icons/outline/chevron_up.svg'
                                  : 'assets/icons/outline/chevron_down.svg',
                              colorFilter: const ColorFilter.mode(
                                Colors.black,
                                BlendMode.srcIn,
                              ),
                              width: 28,
                              height: 28,
                            ),
                            onPressed: () {
                              setState(() {
                                provider.toggleArrowDirection();
                              });
                            },
                            iconSize: 30.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: provider.isCategoryList
                      ? TabBarView(
                          children: List.generate(
                            provider.getCategoryCount(),
                            (index) => _buildCategoryListView(provider, index),
                          ),
                        )
                      : _buildToggleCategoryView(provider),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryTabBar(CategoryScreenProvider provider) {
    return Container(
      color: Colors.white, // Atur warna latar belakang Container ke putih
      child: Row(
        children: [
          Expanded(
            child: TabBar(
              tabs: List.generate(
                provider.getCategoryCount(),
                (index) => Tab(text: provider.getCategoryAtIndex(index)),
              ),
              isScrollable: true,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              labelPadding: const EdgeInsets.symmetric(horizontal: 11.0),
            ),
          ),
          const SizedBox(width: 50.0),
        ],
      ),
    );
  }

  Widget _buildToggleTabBar() {
    return Container(
      height: 47.8,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      color: Colors.white, // Atur warna latar belakang Container ke putih
      child: const Row(
        children: [
          Text(
            'Daftar Kategori',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryListView(CategoryScreenProvider provider, int index) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
      itemCount: 10,
      itemBuilder: (context, itemIndex) {
        return CategoryCard(
          category: provider.getCategoryCardModel(index),
        );
      },
    );
  }

  Widget _buildToggleCategoryView(CategoryScreenProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: GridView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
              childAspectRatio: 129 / 148,
            ),
            itemCount: provider.getCategoryCount(),
            itemBuilder: (context, index) {
              return Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: InkWell(
                  onTap: () {
                    provider.changeTabIndex(index);
                    DefaultTabController.of(context).animateTo(index);
                    setState(() {
                      provider.toggleArrowDirection();
                    });
                  },
                  splashColor: ColorsPallete.lightBlueSky,
                  highlightColor: ColorsPallete.lightBlueSky,
                  borderRadius: BorderRadius.circular(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://www.hostinger.com/tutorials/wp-content/uploads/sites/2/2021/08/learn-coding-online-for-free.webp'),
                            fit:
                                BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
                          ),
                        ),
                        height: 79,
                        width: 82,
                      ),
                      const SizedBox(height: 15.0),
                      Text(
                        provider.getCategoryAtIndex(index),
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
