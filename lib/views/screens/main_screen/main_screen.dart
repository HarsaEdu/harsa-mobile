import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/viewmodels/main_screen_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final MainScreenProvider pageProvider;

  @override
  void initState() {
    super.initState();

    pageProvider = Provider.of<MainScreenProvider>(context, listen: false);
    pageProvider.checkPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
      builder: (context, value, child) => PopScope(
        canPop: value.canPop,
        onPopInvoked: (didPop) => pageProvider.onBack(didPop),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: value.pageList[value.pageIndex],
          backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 5),
            ),
            child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor:
                  value.pageIndex == 2 ? Colors.orange : Colors.blue[900],
              onPressed: () => pageProvider.bottomNaBar(2),
              elevation: 0,
              child: SvgPicture.asset(
                'assets/icons/filled/wand_and_stars.svg',
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                fit: BoxFit.cover,
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            padding: EdgeInsets.zero,
            child: SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => pageProvider.bottomNaBar(0),
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/outline/li_home.svg',
                              colorFilter: ColorFilter.mode(
                                  value.pageIndex == 0
                                      ? Colors.black
                                      : Colors.grey,
                                  BlendMode.srcIn),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Beranda',
                              style: TextStyle(
                                color: value.pageIndex == 0
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => pageProvider.bottomNaBar(1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/outline/books_vertical.svg',
                            colorFilter: ColorFilter.mode(
                                value.pageIndex == 1
                                    ? Colors.black
                                    : Colors.grey,
                                BlendMode.srcIn),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Kelas',
                            style: TextStyle(
                              color: value.pageIndex == 1
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: InkWell(
                      onTap: () => pageProvider.bottomNaBar(3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/outline/bell.svg',
                                colorFilter: ColorFilter.mode(
                                    value.pageIndex == 3
                                        ? Colors.black
                                        : Colors.grey,
                                    BlendMode.srcIn),
                              ),
                              const Positioned(
                                right: 0,
                                child: Badge(
                                  backgroundColor:
                                      Color.fromARGB(200, 239, 49, 49),
                                  smallSize: 15,
                                  isLabelVisible: false,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Notifikasi',
                            style: TextStyle(
                              color: value.pageIndex == 3
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => pageProvider.bottomNaBar(4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/outline/person.svg',
                            colorFilter: ColorFilter.mode(
                                value.pageIndex == 4
                                    ? Colors.black
                                    : Colors.grey,
                                BlendMode.srcIn),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Profil',
                            style: TextStyle(
                              color: value.pageIndex == 4
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
