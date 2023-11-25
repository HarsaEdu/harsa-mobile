import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/quiz.dart';

class QuizProvider with ChangeNotifier {
  // Data quiz disimpan dalam bentuk list karena list menyediakan urutan yang jelas dan teratur dari pertanyaan-pertanyaan tersebut.
  List<Quiz> _questions = [
    Quiz(
      question:
          '1. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: '2. Pertanyaan kedua.',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: '3. Pertanyaan ketiga.',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: '4. Pertanyaan keempat.',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: '5. Pertanyaan kelima.',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan keenam',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan ketujuh',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan kedelapan',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan keempat',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan keempat',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan keempat',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan keempat',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan keempat',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan keempat',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan keempat',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan keempat',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan keempat',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan keempat',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan keempat',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan keempat',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan keempat',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan keempat',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan keempat',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
    Quiz(
      question: 'Pernyataan keempat',
      options: [
        'A. Lorem Ipsum',
        'B. Lorem Ipsum',
        'C. Lorem Ipsum',
        'D. Lorem Ipsum'
      ],
      answer: 1,
    ),
  ];

  final PageController pageController = PageController();

  // Menambahkan getter untuk _questions
  List<Quiz> get questions => _questions;
  // Indeks pertanyaan yang sedang aktif
  int _currentQuestionIndex = 0;

  // Map untuk menyimpan jawaban yang dipilih
  final Map<int, int> _selectedOptions = {};

  // Getter untuk pertanyaan saat ini
  Quiz get currentQuestion => _questions[_currentQuestionIndex];

  // Fungsi untuk menginisialisasi pertanyaan dari JSON atau sumber lain
  void loadQuestions(List<Quiz> questionsFromJson) {
    _questions = questionsFromJson;
    notifyListeners();
  }

  // Getter untuk total pertanyaan
  int get totalQuestions => _questions.length;

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
    if (_currentQuestionIndex < _questions.length - 1) {
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
    if (questionIndex >= 0 && questionIndex < totalQuestions) {
      _currentQuestionIndex = questionIndex;
      pageController.jumpToPage(questionIndex);
      notifyListeners();
    }
  }
}
