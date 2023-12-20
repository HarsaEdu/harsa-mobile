import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/profile_models/profile_models.dart';
import 'package:harsa_mobile/services/profile_service.dart';
import 'package:harsa_mobile/services/profile_services.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class EditProfileProvider extends ChangeNotifier {
  String gender = 'male';
  bool pickerVisible = false;
  String? imagepath;
  UserProfileData? userProfileData;
  late LoadingState loadingState;
  final ScrollController scrollController = ScrollController();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void genderSelector(String value) {
    gender = value;
    notifyListeners();
  }

  void pickImage() {
    if (pickerVisible) {
      pickerVisible = false;
    } else {
      pickerVisible = true;
    }
    notifyListeners();
  }

  Future<void> cameraImagePicker() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
    debugPrint('${file?.path}');
    imagepath = file?.path.toString();
    pickerVisible = false;
    notifyListeners();
  }

  Future<void> galleryImagePicker() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    debugPrint('${file?.path}');
    imagepath = file?.path.toString();
    pickerVisible = false;
    notifyListeners();
  }

  Future<void> datePicker(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: currentDate,
    );

    if (selectedDate != null && selectedDate != currentDate) {
      String formattedDate =
          "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
      birthDateController.text = formattedDate;
    }
  }

  Future<void> submitEditProfile(BuildContext context) async {
    try {
      if (firstNameController.text.isEmpty ||
          lastNameController.text.isEmpty ||
          birthDateController.text.isEmpty ||
          jobController.text.isEmpty ||
          bioController.text.isEmpty ||
          phoneController.text.isEmpty ||
          cityController.text.isEmpty ||
          addressController.text.isEmpty) {
        return;
      }

      loadingState = LoadingState.loading;
      notifyListeners();

      var response = await ProfileService().updateProfile(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        dateBirth:
            DateTime.parse(birthDateController.text).millisecondsSinceEpoch,
        job: jobController.text,
        bio: bioController.text,
        gender: gender,
        phoneNumber: int.parse(phoneController.text),
        city: cityController.text,
        address: addressController.text,
        imagePath: imagepath ?? '',
      );

      debugPrint(response?.message);

      loadingState = LoadingState.success;
      if (context.mounted) {
        Navigator.pop(context);
      }
    } on DioException catch (e) {
      // ignore: avoid_print
      print("DioException: $e");
      loadingState = LoadingState.failed;
    }
    notifyListeners();
  }

  void getProfile() async {
    userProfileData = await ProfileServices.getUserProfile();
    firstNameController.text = userProfileData!.firstName;
    lastNameController.text = userProfileData!.lastName;
    phoneController.text = userProfileData!.phoneNumber;
    // ignore: unnecessary_null_comparison
    birthDateController.text = userProfileData!.dateBirth != null
        ? DateFormat('yyyy-MM-dd').format(userProfileData!.dateBirth)
        : '';
    jobController.text = userProfileData!.job;
    bioController.text = userProfileData!.bio;
    cityController.text = userProfileData!.city;
    addressController.text = userProfileData!.address;

    notifyListeners();
  }
}
