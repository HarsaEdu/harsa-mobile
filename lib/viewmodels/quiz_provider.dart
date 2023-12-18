import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/quiz_models/quiz_model.dart';
import 'package:harsa_mobile/services/quiz_services.dart';

class QuizProvider with ChangeNotifier {
  final PageController pageController = PageController();
  Quiz? _quiz;
  // Indeks pertanyaan yang sedang aktif
  int _currentQuestionIndex = 0;
  // Map untuk menyimpan jawaban yang dipilih
  final Map<int, int> _selectedOptions = {};
  bool _isGridViewVisible = false;

  Quiz? get quiz => _quiz;
  // Getter untuk indeks pertanyaan saat ini
  int get currentQuestionIndex => _currentQuestionIndex;
  bool get isGridViewVisible => _isGridViewVisible;

  Future<void> getQuizData(int id) async {
    try {
      final quiz =
          await QuizServices().getQuizById(id: id);
      if (quiz != null) {
        _quiz = quiz;
        debugPrint('=> ${quiz.toString()}');
        notifyListeners();
      }
    } catch (e) {
      debugPrint('=> error: $e');
      rethrow;
    }
  }

  Future<void> submitQuizAnswers(int id) async {
    try {
      List<QuizAnswer> answers = _selectedOptions.entries.map((entry) {
        return QuizAnswer(questionId: entry.key, optionId: entry.value);
      }).toList();
      debugPrint('=> answers : ${answers.toList()}');
      await QuizServices().submitAnswers(id, answers);
    } catch (e) {
      debugPrint('=> error: $e');
      rethrow;
    }
  }

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

  void toggleGridViewVisibility() {
    _isGridViewVisible = !_isGridViewVisible;
    notifyListeners();
  }

  // Fungsi untuk berpindah ke pertanyaan berikutnya
  void goToNextQuestion() {
    if (_currentQuestionIndex < quiz!.questions.length - 1) {
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
    if (questionIndex >= 0 && questionIndex < quiz!.questions.length) {
      _currentQuestionIndex = questionIndex;
      pageController.jumpToPage(questionIndex);
      notifyListeners();
    }
  }
}
