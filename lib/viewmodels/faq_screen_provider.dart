import 'package:flutter/material.dart';
import '/models/faq.dart';

final List<Map<String, Object>> myFaq = [
  {
    "id": 1,
    "question": "Apa itu Harsa?",
    "answer":
        "Harsa adalah sebuah aplikasi Learning Management System (LMS) inovatif yang dirancang untuk mendukung pengalaman belajar secara digital. Dengan Harsa, pengguna dapat mengakses berbagai materi pembelajaran, tugas, dan ujian secara online.",
  },
  {
    "id": 2,
    "question": "Bagaimana Cara Mendaftar di Harsa?",
    "answer": "Jawaban bagaimana cara mendaftar di Harsa.",
  },
  {
    "id": 3,
    "question": "Apa Saja Materi Pelajaran yang Tersedia di Harsa?",
    "answer": "Jawaban apa saja materi pelajaran yang tersedia di Harsa.",
  },
  {
    "id": 4,
    "question": "Bagaimana Cara Memulai Kelas di Harsa?",
    "answer": "Jawaban bagaimana cara memulai kelas di Harsa.",
  },
  {
    "id": 5,
    "question":
        "Apakah Harsa Menyediakan Sertifikat untuk Kelas yang Telah Selesai?",
    "answer":
        "Jawaban apakah Harsa menyediakan sertifikat untuk kelas yang telah selesai.",
  },
  {
    "id": 6,
    "question": "Apakah Harsa Memiliki Fitur Pencarian untuk Materi Pelajaran?",
    "answer":
        "Jawaban apakah Harsa memiliki fitur pencarian untuk materi pelajaran.",
  },
  {
    "id": 7,
    "question": "Bagaimana Cara Menghubungi Tim Dukungan Harsa?",
    "answer": "Jawaban bagaimana cara menghubungi Tim Dukungan Harsa",
  },
  {
    "id": 8,
    "question": "Bagaimana Cara Mengumpulkan Tugas?",
    "answer": "Jawaban bagaimana cara mengumpulkan tugas.",
  },
];

List<Faq> getFaqList() {
  return myFaq.map((json) => Faq.fromJson(json)).toList();
}

class FaqScreenProvider with ChangeNotifier {
  FaqScreenProvider() {
    focusNode.addListener(notifyListeners);
  }

  final List<Faq> data = getFaqList();
  FocusNode focusNode = FocusNode();
  List<Faq> filteredData = getFaqList();

  int? _isExpandedId;
  int? get isExpandedId => _isExpandedId;
  String searchQuery = '';

  bool togglePanelExpansion(int panelId) {
    bool isExpanded;
    if (_isExpandedId == panelId) {
      _isExpandedId = null;
      isExpanded = false;
    } else {
      _isExpandedId = panelId;
      isExpanded = true;
    }
    notifyListeners();
    return isExpanded;
  }

  void searchFaq(String query) {
    searchQuery = query;
    if (query.isEmpty) {
      filteredData = data;
    } else {
      filteredData = data.where((faq) {
        return faq.question.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
