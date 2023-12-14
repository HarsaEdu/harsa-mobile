import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/quizz_models/quizz_model.dart';
import 'package:harsa_mobile/services/quizz_services.dart';

class QuizProvider with ChangeNotifier {
  final PageController pageController = PageController();
  QuizzData? _quizzData;

  QuizzData? get quizzData => _quizzData;
  Future<void> getQuizzData(int id, int moduleId) async {
    try {
      final quizzData =
          await QuizzServices().getQuizzById(id: id, moduleId: moduleId);
      if (quizzData != null) {
        _quizzData = quizzData;
        debugPrint('=> ${quizzData.toString()}');
        notifyListeners();
      }
    } catch (e) {
      debugPrint('=> error: $e');
      rethrow;
    }
  }

  // Indeks pertanyaan yang sedang aktif
  int _currentQuestionIndex = 0;

  // Map untuk menyimpan jawaban yang dipilih
  final Map<int, int> _selectedOptions = {};

  Future<void> submitQuizzAnswers(int id) async {
    try {
      List<QuizzAnswer> answers = _selectedOptions.entries.map((entry) {
        return QuizzAnswer(questionId: entry.key, optionId: entry.value);
      }).toList();
      debugPrint('=> answers : ${answers.toList()}');
      await QuizzServices().submitAnswers(id, answers);
    } catch (e) {
      debugPrint('=> error: $e');
      rethrow;
    }
  }

  // Getter untuk indeks pertanyaan saat ini
  int get currentQuestionIndex => _currentQuestionIndex;

  // Fungsi untuk memilih jawaban
  void selectOption(int questionIndex, int selectedOption) {
    _selectedOptions[questionIndex] = selectedOption;
    notifyListeners();
  }

  // Fungsi untuk memeriksa apakah opsi dipilih
  bool isSelectedOption(int questionIndex, int optionIndex) {
    return _selectedOptions[questionIndex] == optionIndex;
  }

  bool isAnswered(int questionIndex) {
    return _selectedOptions.containsKey(questionIndex);
  }

  // Fungsi untuk berpindah ke pertanyaan sebelumnya
  void goToPreviousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      if (pageController.hasClients) {
        pageController.jumpToPage(_currentQuestionIndex);
      }
      notifyListeners();
    }
  }

  bool _isGridViewVisible = false;

  bool get isGridViewVisible => _isGridViewVisible;

  void toggleGridViewVisibility() {
    _isGridViewVisible = !_isGridViewVisible;
    notifyListeners();
  }

  // Fungsi untuk berpindah ke pertanyaan berikutnya
  void goToNextQuestion() {
    if (_currentQuestionIndex < quizzData!.questions.length - 1) {
      _currentQuestionIndex++;
      if (pageController.hasClients) {
        pageController.jumpToPage(_currentQuestionIndex);
      }
      notifyListeners();
    }
  }

  // Fungsi untuk memperbarui indeks pertanyaan berdasarkan PageView
  void updateQuestionIndex(int newIndex) {
    _currentQuestionIndex = newIndex;
    notifyListeners();
  }

  void goToQuestion(int questionIndex) {
    if (questionIndex >= 0 && questionIndex < quizzData!.questions.length) {
      _currentQuestionIndex = questionIndex;
      pageController.jumpToPage(questionIndex);
      notifyListeners();
    }
  }
}
