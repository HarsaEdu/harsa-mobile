import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harsa_mobile/views/widgets/card_progres.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    String imagePath = "assets/images/profile.png";

    return Material(
      color: const Color(0xffffffff),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text(
              "Profile",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imagePath,
                width: 58,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              "rafi",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            subtitle: Text(
              "Mahasiswa",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              thickness: 1.5,
            ),
          ),
          const CustomCardWidget(
            packageName: 'Paket Reguler\nBulanan',
            subText: 'Harsa',
            logoAssetPath: 'assets/images/WFill_Logo_Harsa.jpg',
          ),
          Column(
            children: [
              TextButton(
                onPressed: () {},
                style: TextButtonTheme.of(context).style,
                child: ListTile(
                  leading: SizedBox(
                    child: SvgPicture.asset(
                        'assets/icons/outline/books_vertical.svg'),
                  ),
                  title: Text(
                    "Kelas saya",
                    style: GoogleFonts.poppins(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: SvgPicture.asset(
                      'assets/icons/outline/chevron_forward.svg'),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButtonTheme.of(context).style,
                child: ListTile(
                  leading: SizedBox(
                    child:
                        SvgPicture.asset('assets/icons/outline/sertifikat.svg'),
                  ),
                  title: Text(
                    "Sertifikat",
                    style: GoogleFonts.poppins(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: SvgPicture.asset(
                      'assets/icons/outline/chevron_forward.svg'),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButtonTheme.of(context).style,
                child: ListTile(
                  leading: SizedBox(
                    child: SvgPicture.asset(
                        'assets/icons/outline/exclamation.svg'),
                  ),
                  title: Text(
                    "FAQ",
                    style: GoogleFonts.poppins(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: SvgPicture.asset(
                      'assets/icons/outline/chevron_forward.svg'),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButtonTheme.of(context).style,
                child: ListTile(
                  leading: SizedBox(
                    child: SvgPicture.asset(
                        'assets/icons/outline/rectangle_arrow_fw.svg'),
                  ),
                  title: Text(
                    "Logout",
                    style: GoogleFonts.poppins(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: SvgPicture.asset(
                      'assets/icons/outline/chevron_forward.svg'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
