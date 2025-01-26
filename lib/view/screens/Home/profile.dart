import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/profileController.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/model/data/API.dart';
import 'package:prl_app/model/routes/routes.dart';
import 'package:prl_app/services/LogInService.dart';
import 'package:prl_app/view/widgets/Home/bottun_container_icon_widget.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  final Loginservice service = Loginservice();
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.darkMain,
        title: const TextWidget(
          data: 'Profile',
          color: ColorApp.lightMain,
          fontWeight: FontWeight.bold,
          size: 24,
        ),
        centerTitle: true,
      ),
      backgroundColor: ColorApp.darkMain,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Image Section
                Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    CircleAvatar(
      radius: 40,
      backgroundColor: ColorApp.secndApp,
      backgroundImage: controller.profileImage.value.isNotEmpty
          ? NetworkImage("${Api.imageHomeURL}${controller.profileImage.value}")
          : null,
      child: controller.profileImage.value.isEmpty
          ? const Icon(
              Icons.person_outline_rounded,
              size: 40,
              color: ColorApp.lightMain,
            )
          : null,
    ),
    BottunContainerIconWidget(
      onTap: () {
        controller.pickAndUploadProfileImage();
      },
    ),
  ],
),



                const SizedBox(height: 24),
                // First Name Field
                const TextWidget(
                  data: 'First Name',
                  color: ColorApp.lightMain,
                  fontWeight: FontWeight.bold,
                  size: 16,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller:
                      TextEditingController(text: controller.firstName.value),
                  onChanged: (value) => controller.firstName.value = value,
                  style: const TextStyle(color: ColorApp.lightMain),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorApp.secndApp,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Enter your first name',
                  ),
                ),
                const SizedBox(height: 16),
                // Last Name Field
                const TextWidget(
                  data: 'Last Name',
                  color: ColorApp.lightMain,
                  fontWeight: FontWeight.bold,
                  size: 16,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller:
                      TextEditingController(text: controller.lastName.value),
                  onChanged: (value) => controller.lastName.value = value,
                  style: const TextStyle(color: ColorApp.lightMain),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorApp.secndApp,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Enter your last name',
                  ),
                ),
                const SizedBox(height: 16),
                // Mobile Field
                const TextWidget(
                  data: 'Mobile',
                  color: ColorApp.lightMain,
                  fontWeight: FontWeight.bold,
                  size: 16,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller:
                      TextEditingController(text: controller.mobile.value),
                  onChanged: (value) => controller.mobile.value = value,
                  style: const TextStyle(color: ColorApp.lightMain),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorApp.secndApp,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Enter your mobile number',
                  ),
                ),
                const SizedBox(height: 16),
                // Address Field
                const TextWidget(
                  data: 'Address',
                  color: ColorApp.lightMain,
                  fontWeight: FontWeight.bold,
                  size: 16,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller:
                      TextEditingController(text: controller.address.value),
                  onChanged: (value) => controller.address.value = value,
                  style: const TextStyle(color: ColorApp.lightMain),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorApp.secndApp,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Enter your address',
                  ),
                ),
                const SizedBox(height: 24),
                // Save Button
                Center(
                  child: ElevatedButton(
                    onPressed: controller.updateUserDetails,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorApp.mainApp,
                    ),
                    child: const Text(
                      'Save Changes',
                      style: TextStyle(color: ColorApp.lightMain),
                    ),
                  ),
                ),
                // Logout Button
Center(
  child: ElevatedButton(
    onPressed: () async {
      final isLogout = await service.logout();
      if (isLogout) {
        Get.offAllNamed(AppRoutes.login);
      } else {
        Get.snackbar("Error", "Logout failed. Please try again.");
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorApp.mainApp,
    ),
    child: const Text(
      'Log Out',
      style: TextStyle(color: ColorApp.lightMain),
    ),
  ),
),
              ],
            ),
          ),
        );
      }),
    );
  }
}
