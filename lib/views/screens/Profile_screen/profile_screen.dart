import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Padding(
            padding: const EdgeInsets.all(16.0),
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
              child: Image.network(
                imageUrl,
                width: 50,
                height: 50,
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
              ),
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
