import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harsa_mobile/viewmodels/tugas_provider.dart';
import 'package:provider/provider.dart';

import 'package:harsa_mobile/views/screens/tugas_screen/detail_screen.dart';
import 'package:harsa_mobile/views/widgets/confirm_dialog.dart';
import 'package:harsa_mobile/views/widgets/kelas_widgets/kelas_card_component.dart';

class TugasScreen extends StatefulWidget {
  const TugasScreen({Key? key}) : super(key: key);

  @override
  State<TugasScreen> createState() => _TugasScreenState();
}

class _TugasScreenState extends State<TugasScreen> {
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    var fileProvider = context.watch<TugasProvider>();

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
              const SizedBox(
                height: 80.0,
              ),
              if (fileProvider.isFileSelected || isSubmitted)
                Card(
                  elevation: 2.0,
                  margin: const EdgeInsets.all(3.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tugas",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              isSubmitted ? "Diserahkan" : "",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (fileProvider.isFileSelected || isSubmitted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailHalaman(
                                  tugasText: "Tugas Anda",
                                  fileName: fileProvider.selectedFileName ?? "",
                                ),
                              ),
                            );
                          }
                        },
                        child: Card(
                          margin: const EdgeInsets.only(
                            top: 10.0,
                            left: 5.0,
                            right: 5.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 209, 206, 206),
                              width: 1.0,
                            ),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    isSubmitted
                                        ? "Lampiran"
                                        : fileProvider.selectedFileName!,
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                  ),
                                  if (!isSubmitted) // Tambahkan kondisi ini
                                    GestureDetector(
                                      onTap: () {
                                        if (!isSubmitted) {
                                          fileProvider.clearFile();
                                        }
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
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 20.0,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (!isSubmitted) {
                              ConfirmationDialog.show(
                                context,
                                title: 'Kamu Sudah yakin ingin mengumpulkan',
                                content:
                                    'Tugas mu dapat di perbaikin setelah di kirim',
                                onConfirm: () {
                                  Navigator.pop(context);
                                  fileProvider.selectFile(
                                      fileProvider.selectedFileName ??
                                          "dummy.pdf");
                                  setState(() {
                                    isSubmitted = true;
                                  });
                                },
                                onCancel: () {
                                  fileProvider.clearFile();
                                  Navigator.pop(context);
                                },
                              );
                            } else {
                              // Tombol "Batal" ketika sudah mengumpulkan
                              fileProvider.clearFile();
                              setState(() {
                                isSubmitted = false;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            minimumSize: const Size.fromHeight(45.0),
                          ),
                          child: Text(
                            isSubmitted ? "Batal" : "Serahkan",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                )
              else
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 15.0,
                  ),
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
                                        // ignore: avoid_print
                                        print(
                                          'File path: ${result.files.single.path}',
                                        );
                                        fileProvider.selectFile(
                                            result.files.single.name);
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                      } else {
                                        // ignore: avoid_print
                                        print('Pemilihan file dibatalkan');
                                      }
                                    } catch (e) {
                                      // ignore: avoid_print
                                      print('Error: $e');
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 95.0,
                                    ),
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
                                        width: 8,
                                      ),
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
                                    fileProvider.clearFile();
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 95.0,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(
                                        color: Colors.black,
                                        width: 1.0,
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 95.0,
                      ),
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
