import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/chatbot_models/get_thread_chats_model.dart';
import 'package:harsa_mobile/models/chatbot_models/get_user_threads_model.dart';
import 'package:harsa_mobile/services/chatbot_service.dart';
import 'package:harsa_mobile/utils/constants/aichatbot_screen_constants.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';

class AIChatbotProvider with ChangeNotifier {
  late final GlobalKey<ScaffoldState> scaffoldKey;
  late final GlobalKey<FormState> chatFormKey;
  late final GlobalKey<FormState> topicFormKey;
  late final GlobalKey<FormState> renameFormKey;
  late final TextEditingController chatController;
  late final TextEditingController topicController;
  late final TextEditingController renameController;
  late final FocusNode renameNode;

  AIChatbotProvider() {
    scaffoldKey = GlobalKey();
    chatFormKey = GlobalKey();
    topicFormKey = GlobalKey();
    renameFormKey = GlobalKey();
    chatController = TextEditingController();
    topicController = TextEditingController();
    renameController = TextEditingController();
    renameNode = FocusNode();

    renameNode.addListener(() {
      if (!renameNode.hasFocus) isRenaming = "";
      notifyListeners();
    });

    getUserThreads();
  }

  bool canPop = false;

  String isRenaming = "";
  String activeThreadId = "";
  List<Map<String, String>> suggestions = [];

  AIChatBotScreen screen = AIChatBotScreen.topic;
  LoadingState chatLoadingState = LoadingState.initial;

  ThreadChatsModel? threadChatsModel;
  UserThreadsModel? userThreadsModel;

  void onBack(BuildContext context, bool didPop) {
    if (canPop == false || scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.closeEndDrawer();
      canPop = true;
    }
    notifyListeners();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.closeEndDrawer();
    notifyListeners();
  }

  void openDrawer() {
    getUserThreads();
    scaffoldKey.currentState!.openEndDrawer();
    canPop = false;
    notifyListeners();
  }

  String? validateTopic(String? value) {
    if (value == null || value == "") return "Masukkan Topik";
    return null;
  }

  String? validateChat(String? value) {
    if (value == null || value == "") return "Masukkan Prompt";
    return null;
  }

  String? validateRename(String? value) {
    if (value == null || value == "") return "";
    return null;
  }

  void buatChatBaru(BuildContext context) {
    suggestions.clear();
    activeThreadId = "";
    screen = AIChatBotScreen.topic;
    scaffoldKey.currentState!.closeEndDrawer();
    notifyListeners();
  }

  void addSuggestions({required String topic}) {
    suggestions.addAll(
      [
        {
          "title": "Buatkan pembahasan tentang $topic",
          "subtitle": "Untuk aplikasi LMS",
        },
        {
          "title": "Beri saya ide",
          "subtitle": "Tentang topik $topic",
        },
      ],
    );
  }

  void submitTopic() async {
    if (!topicFormKey.currentState!.validate()) return;

    addSuggestions(topic: topicController.text);

    notifyListeners();

    try {
      chatLoadingState = LoadingState.loading;
      notifyListeners();

      await ChatbotService.createTopic(topic: topicController.text);

      final threads = await ChatbotService.getUserThreads();

      userThreadsModel = threads;
      activeThreadId = userThreadsModel!.data![0].id;

      final chats =
          await ChatbotService.getThreadChats(threadId: activeThreadId);

      threadChatsModel = chats;

      chatLoadingState = LoadingState.success;
    } catch (_) {
      chatLoadingState = LoadingState.failed;
      notifyListeners();
      rethrow;
    }

    topicController.clear();
    screen = AIChatBotScreen.chat;
    notifyListeners();
  }

  void submitSuggestion({
    required String threadId,
    required String suggestion,
  }) async {
    try {
      chatLoadingState = LoadingState.loading;
      notifyListeners();

      await ChatbotService.sendChat(
        message: suggestion,
        threadId: threadId,
      );

      final chats = await ChatbotService.getThreadChats(threadId: threadId);

      threadChatsModel = chats;

      chatLoadingState = LoadingState.success;
    } catch (_) {
      chatLoadingState = LoadingState.failed;
      notifyListeners();
      rethrow;
    }

    chatController.clear();
    suggestions.clear();
    screen = AIChatBotScreen.chat;
    notifyListeners();
  }

  void submitChat(String threadId) async {
    if (!chatFormKey.currentState!.validate()) return;

    try {
      chatLoadingState = LoadingState.loading;
      notifyListeners();

      await ChatbotService.sendChat(
        message: chatController.text,
        threadId: threadId,
      );

      final chats = await ChatbotService.getThreadChats(threadId: threadId);

      threadChatsModel = chats;
      chatController.clear();

      chatLoadingState = LoadingState.success;
    } catch (_) {
      chatLoadingState = LoadingState.failed;
      notifyListeners();
      rethrow;
    }

    screen = AIChatBotScreen.chat;
    notifyListeners();
  }

  void tapTopic({
    required BuildContext context,
    required String topic,
    required String threadId,
  }) async {
    try {
      chatLoadingState = LoadingState.loading;
      notifyListeners();

      final chats = await ChatbotService.getThreadChats(threadId: threadId);

      threadChatsModel = chats;
      chatLoadingState = LoadingState.success;
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
        threadChatsModel = null;
      }

      chatLoadingState = LoadingState.success;
    } catch (_) {
      chatLoadingState = LoadingState.failed;
      notifyListeners();
      rethrow;
    }

    if (threadChatsModel!.data!.isEmpty && suggestions.isEmpty) {
      addSuggestions(topic: topic);
      notifyListeners();
    }

    screen = AIChatBotScreen.chat;
    activeThreadId = threadId;
    scaffoldKey.currentState!.closeEndDrawer();
    notifyListeners();
  }

  void getUserThreads() async {
    try {
      chatLoadingState = LoadingState.loading;
      notifyListeners();

      final threads = await ChatbotService.getUserThreads();

      userThreadsModel = threads;

      chatLoadingState = LoadingState.success;
    } catch (_) {
      chatLoadingState = LoadingState.failed;
      notifyListeners();
      rethrow;
    }

    notifyListeners();
  }

  void deleteThread({required String threadId}) async {
    try {
      chatLoadingState = LoadingState.loading;
      notifyListeners();

      final threads = await ChatbotService.getUserThreads();
      final int threadIndex =
          threads.data!.indexWhere((thread) => thread.id == threadId);

      await ChatbotService.deleteThread(threadId: threadId);

      final newThreads = await ChatbotService.getUserThreads();

      userThreadsModel = newThreads;

      if (userThreadsModel!.data == null || userThreadsModel!.data!.isEmpty) {
        screen = AIChatBotScreen.topic;
        activeThreadId = "";
      } else {
        activeThreadId =
            userThreadsModel!.data![threadIndex == 0 ? 0 : threadIndex - 1].id;
      }

      final chats =
          await ChatbotService.getThreadChats(threadId: activeThreadId);

      threadChatsModel = chats;

      chatLoadingState = LoadingState.success;
    } catch (_) {
      chatLoadingState = LoadingState.failed;
      notifyListeners();
      rethrow;
    }

    notifyListeners();
  }

  void renameThread({
    required String threadTitle,
    required String threadId,
  }) {
    renameNode.requestFocus();
    renameController.text = threadTitle;
    isRenaming = threadId;

    notifyListeners();
  }

  void submitRename({
    required String threadTitle,
    required String threadId,
  }) async {
    late final String newTitle;
    newTitle = !renameFormKey.currentState!.validate()
        ? threadTitle
        : renameController.text;

    try {
      chatLoadingState = LoadingState.loading;
      notifyListeners();

      await ChatbotService.updateThread(
        threadId: threadId,
        newThread: newTitle,
      );

      final newThreads = await ChatbotService.getUserThreads();

      userThreadsModel = newThreads;

      chatLoadingState = LoadingState.success;
    } catch (_) {
      chatLoadingState = LoadingState.failed;
      notifyListeners();
      rethrow;
    }

    isRenaming = "";
    renameController.clear();
    notifyListeners();
  }
}
