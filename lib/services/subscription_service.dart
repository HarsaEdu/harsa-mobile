import 'package:dio/dio.dart';

import 'package:harsa_mobile/models/subscription_models/subscription_model.dart';
import 'package:harsa_mobile/utils/constants/urls.dart';

class SubsService {
  static final Dio dio = Dio();
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjcmVhdGVkX2F0IjoiMjAyMy0xMS0yNFQxNDozMzoxOS4wNDhaIiwiZW1haWwiOiJ0ZXN0c3R1ZGVudEBnbWFpbC5jb20iLCJleHAiOjE3MDIyNDQzOTksImlkIjoyLCJyb2xlX25hbWUiOiJzdHVkZW50IiwidXNlcm5hbWUiOiJ0dWRlbnQgbWFudHVsIn0.TsxUo-DDSRb9T8rzCYURnr5xhL-KVfRlAhnAu0X2R_c';

  Future<List<Datum>> getSubscriptions() async {
    try {
      dio.options.headers['Authorization'] = "Bearer $token";
      final Response response = await dio.get(
        '${Urls.baseUrl}/mobile/subs-plan',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
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


// import 'package:dio/dio.dart';

// import 'package:harsa_mobile/models/subscription_models/subscription_model.dart';
// import 'package:harsa_mobile/utils/constants/urls.dart';

// class SubsService {
//   static final Dio dio = Dio();

//   Future<List<Datum>> getSubscriptions() async {
//     try {
//       final response = await dio.get('${Urls.baseUrl}/mobile/subs-plan');
//       if (response.statusCode == 200) {
//         final welcome = Welcome.fromJson(response.data);
//         return welcome.data;
//       } else {
//         throw Exception('Failed to load subscriptions');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }
// }
