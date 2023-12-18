//profile belum berlanganan
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harsa_mobile/viewmodels/profile_provider.dart';
import 'package:harsa_mobile/views/widgets/card_progres.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileProvider pageProvider;

  @override
  void initState() {
    super.initState();
    pageProvider = Provider.of<ProfileProvider>(context, listen: false);
    pageProvider.context = context;
    pageProvider.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, value, child) => Material(
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
                child: value.userProfileData != null
                    ? Image.network(
                        value.userProfileData!.imageUrl,
                        width: 58,
                        height: 80,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.person),
              ),
              title: Text(
                value.userProfileData != null
                    ? value.userProfileData!.username
                    : "",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              subtitle: Text(
                value.userProfileData != null
                    ? value.userProfileData!.roleName
                    : "",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                  onPressed: pageProvider.editProfile,
                  icon: const Icon(
                    Icons.chevron_right,
                    size: 40,
                  )),
            ),
            const Padding(
              padding: EdgeInsets.all(3.0),
              child: Divider(
                thickness: 1.5,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60, top: 10),
              child: value.userProfileData != null &&
                      value.userProfileData!.subscriptionId != 0 &&
                      value.subsDetail != null
                  ? SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: CustomCardWidget(
                        width: MediaQuery.sizeOf(context).width,
                        packageName: 'Masa Aktif Membership',
                        daysRemain:
                            '${(DateTime.now().difference(value.userProfileData!.startDate).inDays + 1)}/${value.subsDetail!.duration} Hari',
                        progress: (DateTime.now()
                                    .difference(
                                        value.userProfileData!.startDate)
                                    .inDays +
                                1) /
                            value.subsDetail!.duration,
                        date:
                            '${value.userProfileData!.startDate.day} ${DateFormat("MMMM").format(value.userProfileData!.startDate)} ${value.userProfileData!.startDate.year} - ${value.userProfileData!.endDate.day} ${DateFormat("MMMM").format(value.userProfileData!.endDate)} ${value.userProfileData!.endDate.year}',
                      ),
                    )
                  : ElevatedButton(
                      onPressed: pageProvider.langganan,
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
                            "Langganan Sekarang",
                            style: GoogleFonts.poppins(
                              fontSize: 18.0,
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
            TextButton(
              onPressed: pageProvider.kelasSaya,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                dense: true, // Add this line to reduce the space
                leading: SizedBox(
                  width: 30, // Adjust the width as needed
                  child: SvgPicture.asset(
                    'assets/icons/outline/books_vertical.svg',
                    width: 36, // Adjust the icon size as needed
                    height: 36,
                  ),
                ),
                title: Text(
                  "Kelas saya",
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
            // Sertifikat
            TextButton(
              onPressed: pageProvider.sertif,
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
                    'assets/icons/outline/sertifikat.svg',
                    width: 36,
                    height: 36,
                  ),
                ),
                title: Text(
                  "Sertifikat",
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

            TextButton(
              onPressed: pageProvider.history,
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
                    'assets/icons/outline/credit_card.svg',
                    width: 36,
                    height: 36,
                  ),
                ),
                title: Text(
                  "Riwayat Transaksi",
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
            // FAQ
            TextButton(
              onPressed: pageProvider.faq,
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
                    fontSize: 17.0,
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
              onPressed: pageProvider.logOut,
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
      ),
    );
  }
}
