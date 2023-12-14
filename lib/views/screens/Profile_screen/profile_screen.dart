//profile belum berlanganan
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
            padding: EdgeInsets.all(3.0),
            child: Divider(
              thickness: 1.5,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60, top: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFf2994a),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fixedSize: const Size(
                    .0, 55.0), // atur lebar dan tinggi sesuai keinginan
              ),
              child: SizedBox(
                width: 200.0, // atur lebar sesuai keinginan
                height: 50.0, // atur tinggi sesuai keinginan
                child: Center(
                  child: Text(
                    "Langganan Sekaranga",
                    style: GoogleFonts.poppins(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              top: 16.0,
            ), // Sesuaikan nilai left dan top sesuai kebutuhan
            child: Text(
              "General",
              style: GoogleFonts.poppins(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // FAQ
          TextButton(
            onPressed: () {
              // Tambahkan aksi yang diinginkan saat teks ditekan
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              dense: true,
              leading: SizedBox(
                width: 30,
                child: SvgPicture.asset(
                  'assets/icons/outline/exclamation.svg',
                  width: 30,
                  height: 36,
                ),
              ),
              title: Text(
                "FAQ",
                style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: SvgPicture.asset(
                'assets/icons/outline/chevron_forward.svg',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              top: 16.0,
            ), // Sesuaikan nilai left dan top sesuai kebutuhan
            child: Text(
              "Akun",
              style: GoogleFonts.poppins(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Ubah Email
          TextButton(
            onPressed: () {
              // Tambahkan aksi yang diinginkan saat teks ditekan
              Navigator.pushNamed(context, "/editemail");
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              dense: true, // Add this line to reduce the space
              leading: SizedBox(
                width: 30,
                child: SvgPicture.asset(
                  'assets/icons/outline/books_vertical.svg',
                  width: 36,
                  height: 36,
                ),
              ),
              title: Text(
                "Ubah Email",
                style: GoogleFonts.poppins(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: SvgPicture.asset(
                'assets/icons/outline/chevron_forward.svg',
              ),
            ),
          ),
          // Ubah Password
          TextButton(
            onPressed: () {
              // Tambahkan aksi yang diinginkan saat teks ditekan
              Navigator.pushNamed(context, "/editsandi");
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              dense: true, // Add this line to reduce the space
              leading: SizedBox(
                width: 30,
                child: SvgPicture.asset(
                  'assets/icons/outline/sertifikat.svg',
                  width: 36,
                  height: 36,
                ),
              ),
              title: Text(
                "Ubah Password",
                style: GoogleFonts.poppins(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: SvgPicture.asset(
                'assets/icons/outline/chevron_forward.svg',
              ),
            ),
          ),
          // Logout
          TextButton(
            onPressed: () {
              // Tambahkan aksi yang diinginkan saat teks ditekan
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              dense: true, // Add this line to reduce the space
              leading: SizedBox(
                width: 30,
                child: SvgPicture.asset(
                  'assets/icons/outline/rectangle_arrow_fw.svg',
                  width: 36,
                  height: 36,
                ),
              ),
              title: Text(
                "Logout",
                style: GoogleFonts.poppins(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: SvgPicture.asset(
                'assets/icons/outline/chevron_forward.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
