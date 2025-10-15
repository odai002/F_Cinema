import 'package:cinema_reservations/Controller/mainpages/editaccount_controller.dart';
import 'package:cinema_reservations/Core/Constant/colors.dart';
import 'package:cinema_reservations/View/Widget/Auth/CustomTextfailed.dart';
import 'package:cinema_reservations/View/Widget/Auth/CustomeButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/function/validate_input.dart';
import '../Widget/profile/profile_avatar.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final EditaccountController controller = Get.put(EditaccountController());
    final RxString selectedGender = 'Male'.obs;

    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        shadowColor: Colors.black54,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        title: Text('37'.tr,
            style: const TextStyle(color: AppColors.grey50)),
        centerTitle: true,
        backgroundColor: AppColors.secondry,
      ),
      body: Form(
        key: controller.formstate55,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: ListView(
            children: [
              const SizedBox(height: 10),

              // صورة الحساب
              GetBuilder<EditaccountController>(
                builder: (controller) => ProfileAvatar(
                  width: width,
                  localImage: controller.profileImage,
                  imageUrl: null,
                  onCameraPressed: controller.pickImage,
                  showCameraButton: true,
                ),
              ),

              const SizedBox(height: 30),
              Text('38'.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 25,
                      color: AppColors.secondry,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),

              Text('39'.tr,
                  style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.secondry,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Male',
                        groupValue: selectedGender.value,
                        onChanged: (val) {
                          selectedGender.value = val!;
                        },
                        activeColor: AppColors.secondry,
                      ),
                      Text('40'.tr),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Female',
                        groupValue: selectedGender.value,
                        onChanged: (val) {
                          selectedGender.value = val!;
                        },
                        activeColor: AppColors.secondry,
                      ),
                      Text('41'.tr),
                    ],
                  ),
                ],
              )),
              const SizedBox(height: 20),

              Customtextfailed(
                iconData: Icons.person,
                hintText: '42'.tr,
                lableText: '43'.tr,
                controller: controller.fullName,
                validator: (val) => validinput(val!, 3, 15, 'username'),
              ),
              const SizedBox(height: 20),

              Customtextfailed(
                iconData: Icons.phone,
                hintText: '44'.tr,
                lableText: '45'.tr,
                controller: controller.phoneNumber,
                validator: (val) => validinput(val!, 10, 10, 'phone'),
              ),
              const SizedBox(height: 20),

              Customtextfailed(
                iconData: Icons.location_on_outlined,
                hintText: '46'.tr,
                lableText: '47'.tr,
                controller: controller.address,
                validator: (val) => validinput(val!, 5, 100, 'address'),
              ),
              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Customebutton(
                      text: '48'.tr,
                      onPressed: () {
                        controller.gender = selectedGender.value;
                        controller.Save();
                      }),
                  const SizedBox(width: 15),
                  Customebutton(
                      text: '49'.tr, onPressed: controller.Cancel),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
