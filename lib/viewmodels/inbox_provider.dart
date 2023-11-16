import 'package:flutter/material.dart';
import '../models/inbox.dart';

class InboxProvider extends ChangeNotifier {
  InboxProvider() {
    initialData();
  }
  Inbox? _data;
  Inbox? get data => _data;
  set setData(Inbox newData) {
    _data = newData;
    notifyListeners();
  }

  void initialData() {
    setData = Inbox.fromJson(inbox);
  }

  final Map<String, dynamic> inbox = {
    "data": [
      {
        "id": 16844594,
        "profile_pic": null,
        "title": "Tenggat Tugas 1 Terlewati",
        "subtitle": "Becoming Professional UI / UX Designer",
        "desc":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien...",
      },
      {
        "id": 16844595,
        "profile_pic":
            "https://cdns.diadona.co.id/diadona.id/resources/photonews/2022/02/08/57845/664xauto-11-potret-close-up-anya-geraldine-yang-disebut-cewek-paling-jago-foto-selfie--2202082-008.jpg",
        "title": "Tenggat Tugas 2 Terlewati",
        "subtitle": "Becoming Professional UI / UX Designer",
        "desc":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien. ",
      },
      {
        "id": 16844596,
        "profile_pic":
            "https://cdns.diadona.co.id/diadona.id/resources/photonews/2022/02/08/57845/664xauto-11-potret-close-up-anya-geraldine-yang-disebut-cewek-paling-jago-foto-selfie--2202082-008.jpg",
        "title": "Tenggat Tugas 3 Terlewati",
        "subtitle": "Becoming Professional UI / UX Designer",
        "desc":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien.",
      },
    ]
  };
}
