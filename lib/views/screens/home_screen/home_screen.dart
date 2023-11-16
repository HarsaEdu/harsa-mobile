import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsPallete.whiteGrey,
        body: Column(
          children: [
            Container(),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: SearchBar(
                                elevation: const MaterialStatePropertyAll(0),
                                side: const MaterialStatePropertyAll(
                                  BorderSide(color: Colors.grey, width: 1),
                                ),
                                padding: const MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 0,
                                  ),
                                ),
                                trailing: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: SvgPicture.asset(
                                      'assets/icons/outline/magnifyingglass.svg',
                                      colorFilter: const ColorFilter.mode(
                                        Colors.grey,
                                        BlendMode.srcIn,
                                      ),
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const CircleAvatar(
                            radius: 25,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 220,
                      width: double.infinity,
                      child: Image.network(''),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
