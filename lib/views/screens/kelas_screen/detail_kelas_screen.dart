import 'package:flutter/material.dart';
import 'package:harsa_mobile/viewmodels/detail_kelas_provider.dart';
import 'package:harsa_mobile/views/widgets/kelas_widgets/kelas_card_component.dart';
import 'package:provider/provider.dart';

class DetailKelasScreen extends StatefulWidget {
  const DetailKelasScreen({super.key});

  @override
  State<DetailKelasScreen> createState() => _DetailKelasScreenState();
}

class _DetailKelasScreenState extends State<DetailKelasScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    final provider = Provider.of<DetailKelasProvider>(context, listen: false);
    provider.tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          // cards: menu kelas
          const KelasCard(
            classImage: 'https://picsum.photos/40',
            className: "UI/UX : Becoming Professional",
            mentorName: "Bagus Adhi Laksana",
            progress: 0,
            // dueDate: "10 Oktober - 25 Desember 2023",
            // button: "Daftar",
          ),

          // cards: deskripsi kelas, literly kelas
          const KelasCard(
            classImage: 'https://picsum.photos/40',
            className: "UI/UX : Becoming Professional",
            mentorName: "Bagus Adhi Laksana",
            progress: 10,
            dueDate: "10 Oktober - 25 Desember 2023",
            // button: "Daftar",
          ),

          // cards: daftar
          const KelasCard(
            classImage: 'https://picsum.photos/40',
            className: "UI/UX : Becoming Professional",
            mentorName: "Bagus Adhi Laksana",
            // progress: 4,
            // dueDate: "10 Oktober - 25 Desember 2023",
            button: "Daftar",
          ),

          // cards: list materi, video, materi, tugas
          const KelasCard(
            // classImage: 'https://picsum.photos/40',
            className: "UI/UX : Becoming Professional",
            mentorName: "Bagus Adhi Laksana",
            progress: 65,
            // dueDate: "10 Oktober - 25 Desember 2023",
            // button: "Daftar",
          ),

          // cards: quiz
          const KelasCard(
            // classImage: 'https://picsum.photos/40',
            className: "UI/UX : Becoming Professional",
            mentorName: "Bagus Adhi Laksana",
            // progress: 4,
            // dueDate: "10 Oktober - 25 Desember 2023",
            // button: "Daftar",
          ),

          // tab bar
          // tab bar labels
          Consumer<DetailKelasProvider>(
            builder: (context, state, _) {
              return TabBar(
                controller: state.tabController,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 12,
                ),
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                unselectedLabelColor: const Color(0xFF949494),
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 1),
                ),
                overlayColor: MaterialStateProperty.all(Colors.black12),
                tabs: const <Widget>[
                  // labels
                  Text("Deskripsi", style: TextStyle(fontSize: 14)),
                  Text("Materi", style: TextStyle(fontSize: 14)),
                ],
              );
            },
          ),

          // tab bar screens/views
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Consumer<DetailKelasProvider>(
              builder: (context, state, _) {
                return TabBarView(
                  controller: state.tabController,
                  children: const <Widget>[
                    // ISI KONTEN TAB DESKRIPSI
                    Text("Deskripsi View"),
                    // ISI KONTEN TAB MATERI
                    Text("Materi View"),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
