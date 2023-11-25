import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailHalaman extends StatelessWidget {
  final String tugasText;
  final String fileName;

  const DetailHalaman(
      {super.key, required this.tugasText, required this.fileName});

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
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          Container(
            height: 700.0,
            margin: const EdgeInsets.all(0.0),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      tugasText,
                      style: GoogleFonts.poppins(
                        fontSize: 18.0,
                        fontWeight:
                            FontWeight.bold, // Tambahkan properti fontWeight
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text(
                      " lihat 1 lampiran",
                      style: TextStyle(
                        fontSize: 13.0,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        margin: const EdgeInsets.only(
                          top: 10.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 209, 206, 206),
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              // Logo PDF di sini (ganti dengan gambar logo PDF)
                              SvgPicture.asset(
                                'assets/icons/filled/pdf.svg',
                                width: 28.0, // Sesuaikan lebar logo
                                height: 28.0, // Sesuaikan tinggi logo
                              ),
                              const SizedBox(
                                  width: 10.0), // Jarak antara logo dan teks
                              Text(
                                fileName,
                                style: TextStyle(fontSize: 16.0),
                              ),

                              const SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "Status tugas :",
                      style: GoogleFonts.poppins(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Diserahkan",
                      style: GoogleFonts.poppins(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
