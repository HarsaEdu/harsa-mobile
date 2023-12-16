// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:harsa_mobile/models/chatbot_models/get_thread_chats_model.dart';
import 'package:harsa_mobile/models/chatbot_models/post_chat_model.dart';
import 'package:harsa_mobile/models/chatbot_models/post_create_topic_model.dart';
import 'package:harsa_mobile/models/chatbot_models/get_user_threads_model.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:harsa_mobile/utils/constants/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatbotService {
  static final Dio dio = Dio();

  static Future<CreateTopicModel> createTopic({
    required String topic,
  }) async {
    CreateTopicModel? createTopicModel;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? accessToken = preferences.getString(SPKey.accessToken);

    try {
      const String url = "${Urls.baseUrl}${Urls.platformUrl}/chatbot";
      final Map data = {
        "topic": topic,
      };

      dio.options.headers["Authorization"] = "Bearer $accessToken";

      final Response response = await dio.post(url, data: data);

      createTopicModel = CreateTopicModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }

    return createTopicModel;
  }

  static Future<PostChatModel> sendChat({
    required String message,
    required String threadId,
  }) async {
    PostChatModel? chatModel;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? accessToken = preferences.getString(SPKey.accessToken);

    try {
      final String url = "${Urls.baseUrl}${Urls.platformUrl}/chatbot/$threadId";
      final Map data = {
        "message": message,
      };

      dio.options.headers["Authorization"] = "Bearer $accessToken";

      final Response response = await dio.post(url, data: data);

      chatModel = PostChatModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }

    return chatModel;
  }

  static Future<UserThreadsModel> getUserThreads() async {
    UserThreadsModel? userThreadsModel;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? accessToken = preferences.getString(SPKey.accessToken);

    try {
      const String url = "${Urls.baseUrl}${Urls.platformUrl}/chatbot";

      dio.options.headers["Authorization"] = "Bearer $accessToken";

      final Response response = await dio.get(url);

      userThreadsModel = UserThreadsModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }

    return userThreadsModel;
  }

  static Future<ThreadChatsModel> getThreadChats({
    required String threadId,
  }) async {
    ThreadChatsModel? threadChatsModel;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? accessToken = preferences.getString(SPKey.accessToken);

    try {
      final String url =
          "${Urls.baseUrl}${Urls.platformUrl}/chatbot/$threadId?limit=100";

      dio.options.headers["Authorization"] = "Bearer $accessToken";

      final Response response = await dio.get(url);

      threadChatsModel = ThreadChatsModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }

    return threadChatsModel;
  }

  static Future<ThreadChatsModel> deleteThread({
    required String threadId,
  }) async {
    ThreadChatsModel? threadChatsModel;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? accessToken = preferences.getString(SPKey.accessToken);

    try {
      final String url = "${Urls.baseUrl}${Urls.platformUrl}/chatbot/$threadId";

      dio.options.headers["Authorization"] = "Bearer $accessToken";

      final Response response = await dio.delete(url);

      threadChatsModel = ThreadChatsModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }

    return threadChatsModel;
  }

  static Future<ThreadChatsModel> updateThread({
    required String threadId,
    required String newThread,
  }) async {
    ThreadChatsModel? threadChatsModel;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? accessToken = preferences.getString(SPKey.accessToken);

    try {
      final String url = "${Urls.baseUrl}${Urls.platformUrl}/chatbot/$threadId";
      final Map data = {
        "topic": newThread,
      };

      dio.options.headers["Authorization"] = "Bearer $accessToken";

      final Response response = await dio.put(url, data: data);
      print(threadId);
      print(response.data);

      threadChatsModel = ThreadChatsModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }

    return threadChatsModel;
  }
}
