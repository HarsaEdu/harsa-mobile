import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harsa_mobile/views/widgets/kelas_widgets/kelas_card_component.dart';
import 'package:harsa_mobile/views/widgets/materi_button.dart';

class TugasScreen extends StatefulWidget {
  const TugasScreen({Key? key}) : super(key: key);

  @override
  State<TugasScreen> createState() => _TugasScreenState();
}

class _TugasScreenState extends State<TugasScreen> {
  bool isFileSelected = false;
  String? selectedFileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tugas",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                elevation: 5.0,
                margin: const EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: SizedBox(
                  height: 500.0,
                  child: Column(
                    children: [
                      const KelasCard(
                        className: "Introducing UI/UX Design",
                        mentorName: "Explain About UI/UX Fudamental",
                        progress: 65,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                            10.0), // Sesuaikan sesuai kebutuhan
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/images/tugas.png', // Ganti dengan path asset gambar Anda
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Membuat resume tentang materi \nPengenalan UI/UX",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry. Lorem Ipsum\nhas been the industry's standard dummy text\never since the 1500s, when an unknown printer\ntook a galley of type and scrambled it to make a\ntype specimen book.",
                            style: GoogleFonts.poppins(
                              fontSize: 11.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Mateributton(),
              const SizedBox(
                height: 80.0,
              ),
              if (isFileSelected)
                Card(
                  elevation: 2.0,
                  margin: const EdgeInsets.all(3.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.only(
                            top: 10.0, left: 5.0, right: 5.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(
                            color: Color.fromARGB(
                                255, 209, 206, 206), // Warna garis pinggir
                            width: 1.0, // Lebar garis pinggir
                          ),
                        ),
                        child: SizedBox(
                          width: double
                              .infinity, // Agar kartu memenuhi lebar layar
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedFileName ?? "Pilih file",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    // Reset state untuk mengembalikan ke tampilan utama
                                    setState(() {
                                      isFileSelected = false;
                                      selectedFileName = null;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 20.0,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Logika untuk menyerahkan tugas
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            minimumSize: const Size.fromHeight(45.0),
                          ),
                          child: Text(
                            "Serahkan",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0, // Sesuaikan tinggi kartu sesuai kebutuhan
                        child: Container(
                            // Content kartu lainnya di sini
                            ),
                      ),
                    ],
                  ),
                )
              else
                Container(
                  margin: const EdgeInsets.only(
                      bottom: 15.0), // Sesuaikan nilai sesuai kebutuhan
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    try {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles(
                                        type: FileType.custom,
                                        allowedExtensions: ['pdf'],
                                      );

                                      if (result != null) {
                                        // Lakukan sesuatu dengan file yang dipilih
                                        print(
                                            'File path: ${result.files.single.path}');
                                        setState(() {
                                          selectedFileName =
                                              result.files.single.name;
                                          isFileSelected = true;
                                        });
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(
                                            context); // Menutup pop-up setelah memilih file
                                      } else {
                                        // Pengguna membatalkan pemilihan file
                                        print('Pemilihan file dibatalkan');
                                      }
                                    } catch (e) {
                                      print('Error: $e');
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 95.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    minimumSize: const Size.fromHeight(45.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Unggah File"),
                                      const SizedBox(
                                          width:
                                              8), // Jarak antara ikon dan teks
                                      SvgPicture.asset(
                                        'assets/icons/outline/upload.svg',
                                        width: 17,
                                        height: 17,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                ElevatedButton(
                                  onPressed: () {
                                    // Logika batal
                                    setState(() {
                                      isFileSelected = false;
                                      selectedFileName = null;
                                    });
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 95.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(
                                        color: Colors.black,
                                        // Warna garis pinggir
                                        width: 1.0,
                                        // Lebar garis pinggir
                                      ),
                                    ),
                                    minimumSize: const Size.fromHeight(45.0),
                                  ),
                                  child: const Text("Batal"),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 95.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size.fromHeight(45.0),
                    ),
                    child: Text(
                      "Unggah Jawaban",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
