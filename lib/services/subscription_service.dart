import 'package:dio/dio.dart';
import 'package:harsa_mobile/models/subscription_models/subs_detail.dart';
import 'package:harsa_mobile/models/subscription_models/subscription_model.dart';
import 'package:harsa_mobile/utils/constants/urls.dart';

class SubsService {
  static final Dio dio = Dio();

  Future<List<Datum>> getSubscriptions({int limit = 5}) async {
    try {
      final response = await dio
          .get('${Urls.baseUrl}/mobile/subs-plan?offset=0&limit=$limit');
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

  Future<SubsDetail> getSubsDetail({required int id}) async {
    try {
      final response = await dio.get('${Urls.baseUrl}/mobile/subs-plan/$id');
      if (response.statusCode == 200) {
        final welcome = SubsDetail.fromJson(response.data['data']);
        return welcome;
      } else {
        throw Exception('Failed to load subscriptions');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
