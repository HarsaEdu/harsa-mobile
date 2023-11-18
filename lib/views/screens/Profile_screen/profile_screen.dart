// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://i.guim.co.uk/img/static/sys-images/Observer/Columnist/Columnists/2011/1/6/1294316555078/Ryan-Gosling-007.jpg?width=465&dpr=1&s=none";

    return Material(
      color: const Color(0xffffffff),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Profile",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: const Text(
              "rafi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            subtitle: const Text(
              "Mahasiswa",
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              thickness: 1.5,
            ),
          ),
          Column(
            children: [
              ListTile(
                leading: SizedBox(
                  child: SvgPicture.asset(
                      'assets/icons/outline/books_vertical.svg'),
                ),
                title: const Text(
                  "Kelas saya",
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: SvgPicture.asset(
                    'assets/icons/outline/chevron_forward.svg'),
              ),
              ListTile(
                leading: SizedBox(
                  child:
                      SvgPicture.asset('assets/icons/outline/sertifikat.svg'),
                ),
                title: const Text(
                  "Sertifikat",
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: SvgPicture.asset(
                    'assets/icons/outline/chevron_forward.svg'),
              ),
              ListTile(
                leading: SizedBox(
                  child:
                      SvgPicture.asset('assets/icons/outline/exclamation.svg'),
                ),
                title: const Text(
                  "FAQ",
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: SvgPicture.asset(
                    'assets/icons/outline/chevron_forward.svg'),
              ),
              ListTile(
                leading: SizedBox(
                  child: SvgPicture.asset(
                      'assets/icons/outline/rectangle_arrow_fw.svg'),
                ),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: SvgPicture.asset(
                    'assets/icons/outline/chevron_forward.svg'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
