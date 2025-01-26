import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prl_app/services/profileService.dart';

class ProfileController extends GetxController {
  final ProfileService profileService = ProfileService();

  // Observables for user details
  var firstName = ''.obs;
  var lastName = ''.obs;
  var mobile = ''.obs;
  var address = ''.obs;
  var profileImage = ''.obs; // To hold the profile image URL or path

  // Loading state
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  void fetchUserDetails() async {
    try {
      isLoading.value = true;
      final data = await profileService.getUserDetails();
      if (data.isNotEmpty) {
        final user = data['user'];
        firstName.value = user['f_name'] ?? '';
        lastName.value = user['l_name'] ?? '';
        mobile.value = user['mobile'] ?? '';
        address.value = user['primary_address']['address'] ?? '';
        profileImage.value = user['profile_image'] ?? '';
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load user details');
    } finally {
      isLoading.value = false;
    }
  }

  void updateUserDetails() async {
    final data = {
      'f_name': firstName.value,
      'l_name': lastName.value,
      'mobile': mobile.value,
      'address': address.value,
    };

    final success = await profileService.updateUserDetails(data);
    if (success) {
      fetchUserDetails();
    }
  }

  Future<void> pickAndUploadProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final success = await profileService.uploadProfileImage(File(pickedFile.path));
      if (success) {
        fetchUserDetails(); // Refresh the user details
      }
    }
  }
}
