import 'package:flutter/material.dart';
import '../../widgets/kelas_widgets/kelas_card_component.dart';
import 'widgets/deskripsi_tabview.dart';
import 'widgets/materi_tabview.dart';

class KelasScreen extends StatelessWidget {
  const KelasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 16),
              Row(
                children: [
                  const Icon(Icons.arrow_back_ios),
                  const SizedBox(width: 12),
                  Text(
                    'Kelas',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const KelasCard(
                classImage: 'https://picsum.photos/40',
                className: "UI/UX : Becoming Professional",
                mentorName: "Bagus Adhi Laksana",
                progress: 65,
                dueDate: "10 Oktober - 25 Desember 2023",
              ),
              TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'Deskripsi',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Materi',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
                indicatorColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
              ),
              const Expanded(
                child: TabBarView(
                  children: <Widget>[
                    DeskripsiTabView(),
                    MateriTabView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
