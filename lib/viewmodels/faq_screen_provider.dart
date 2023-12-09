import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/faq_models/faq_models.dart';
import 'package:harsa_mobile/services/faq_services.dart';

class FaqScreenProvider with ChangeNotifier {
  final FaqService _faqService = FaqService();

  FaqScreenProvider() {
    focusNode.addListener(notifyListeners);
    fetchData(); // Automatically fetch data when the provider is initialized.
  }

  List<Faqmodel> data = [];
  FocusNode focusNode = FocusNode();
  List<Datum> filteredData = [];

  int? _isExpandedId;
  int? get isExpandedId => _isExpandedId;
  String searchQuery = '';

  Future<void> fetchData() async {
    final faqData =
        await _faqService.getAll(1); // Adjust the moduleId as needed
    if (faqData != null) {
      data = [faqData];
      filteredData = faqData.data;
      notifyListeners();
    }
  }

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
      filteredData =
          data.map((faqModel) => faqModel.data).expand((i) => i).toList();
    } else {
      filteredData =
          data.map((faqModel) => faqModel.data).expand((i) => i).where((faq) {
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
