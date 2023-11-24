import 'package:flutter/material.dart';
import 'package:harsa_mobile/utils/constants/aichatbot_screen_constants.dart';

class AIChatbotProvider with ChangeNotifier {
  GlobalKey<FormState>? topicFormKey;
  GlobalKey<FormState>? chatFormKey;
  TextEditingController? topicController;
  TextEditingController? chatController;
  List<String> topics = [];
  String? activeTopic;
  List<Map<String, String>> suggestions = [
    {
      "title": "Buatkan user persona",
      "subtitle": "Untuk aplikasi LMS",
    },
    {
      "title": "Buatkan user persona 2",
      "subtitle": "Untuk aplikasi LMS 2",
    },
  ];
  List<String> userChats = [];
  List<String> aiResponses = [];

  AIChatBotScreen screen = AIChatBotScreen.topic;

  String? validateTopic(String? value) {
    if (value == null || value == "") return "";
    return null;
  }

  void submitTopic() {
    if (!topicFormKey!.currentState!.validate()) return;
    topics.add(topicController!.text);
    activeTopic = topicController!.text;

    topicController!.clear();
    screen = AIChatBotScreen.suggestion;
    notifyListeners();
  }

  void tapSuggestion(Map<String, String> suggestion) {
    userChats.add("${suggestion["title"]} ${suggestion["subtitle"]}");
    aiResponses.add(
        "${suggestion["title"]!.toUpperCase()} ${suggestion["subtitle"]!.toUpperCase()}");

    screen = AIChatBotScreen.chat;
    notifyListeners();
  }

  String? validateChat(String? value) {
    if (value == null || value == "") return "";
    return null;
  }

  void submitChat() {
    if (!chatFormKey!.currentState!.validate()) return;

    userChats.add(chatController!.text);
    aiResponses.add(chatController!.text.toUpperCase());

    chatController!.clear();
    screen = AIChatBotScreen.chat;
    notifyListeners();
  }

  void closeDrawer(BuildContext context) {
    screen = AIChatBotScreen.topic;
    notifyListeners();

    Navigator.pop(context);
  }

  void tapTopic(BuildContext context, String topic) {
    Navigator.pop(context);

    activeTopic = topic;
    notifyListeners();
  }

  void deleteTopic(String topic) {
    final int deletedTopicIdx =
        topics.indexWhere((element) => element == topic);

    topics.removeAt(deletedTopicIdx);
    if (topics.isNotEmpty && deletedTopicIdx != 0) {
      activeTopic = topics[deletedTopicIdx - 1];
    } else if (topics.isNotEmpty && deletedTopicIdx == 0) {
      activeTopic = topics[0];
    } else {
      activeTopic = null;
      screen = AIChatBotScreen.topic;
      userChats.clear();
      aiResponses.clear();
    }

    notifyListeners();
  }
}
