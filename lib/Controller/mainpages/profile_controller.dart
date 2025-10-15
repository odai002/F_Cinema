import 'package:get/get.dart';

import '../../Data/Remote/mainpages/profile_service.dart';

class ProfileController extends GetxController {
  final ProfileService _profileService = ProfileService();

  var userProfile = <String, dynamic>{}.obs;

  Future<void> loadProfile() async {
    try {
      await _profileService.getProfile();
      userProfile.value = _profileService.userProfile ?? {}; // تخزينها محليًا في المتغير
    } catch (e) {
      print("خطأ أثناء جلب الملف الشخصي: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }
}
