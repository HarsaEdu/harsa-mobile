import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/subscription_models/subscription_model.dart';
import 'package:harsa_mobile/services/subscription_service.dart';

class SubscriptionPlanListProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  List<Datum> _subscriptions = [];

  List<Datum> get subscriptions => _subscriptions;

  Future<void> loadSubscriptions() async {
    try {
      final List<Datum> subscriptions = await SubsService().getSubscriptions();
      _subscriptions = subscriptions;
      notifyListeners();
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
