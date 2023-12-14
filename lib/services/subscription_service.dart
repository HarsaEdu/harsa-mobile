import 'package:dio/dio.dart';
import 'package:harsa_mobile/models/subscription_models/subscription_model.dart';
import 'package:harsa_mobile/utils/constants/urls.dart';

class SubsService {
  static final Dio dio = Dio();

  Future<List<Datum>> getSubscriptions() async {
    try {
      final response = await dio.get('${Urls.baseUrl}/mobile/subs-plan');
      if (response.statusCode == 200) {
        final welcome = Welcome.fromJson(response.data);
        return welcome.data;
      } else {
        throw Exception('Failed to load subscriptions');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
