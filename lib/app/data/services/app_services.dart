import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/providers/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';

class AppServices extends GetxService {
  @override
  onInit() {
    super.onInit();
    getAccessToken();
    getUserId();
    getUserName();
    getUserImage();
    getUserEmail();
    getUserPhone();
    getfirsttime();
  }

  /*--------------------------------------------------------------------------*/
  /*------------------------------  Variables  -------------------------------*/
  /*--------------------------------------------------------------------------*/
  RxBool notificationsOn = RxBool(true);
  RxBool isSignup = RxBool(false);

  RxInt packageId = 0.obs;
  RxInt customerId = 0.obs;

  RxString accessToken = RxString('');
  RxString userName = RxString('');
  RxString userEmail = RxString('');
  RxString userImage = RxString('');
  RxString userPhone = RxString('');
  RxString userBirthDate = RxString('');
  RxString userGender = RxString('');
  RxString userCurrencyCode = RxString('');
  RxString userCountryCode = RxString('');
  RxInt userId = RxInt(0);
  RxString? pinCode;
  RxBool isFirstTime = true.obs;

  /*--------------------------------------------------------------------------*/
  /*-------------------------  Control Toggle Bars  --------------------------*/
  /*--------------------------------------------------------------------------*/
  PageController pageController = PageController(initialPage: 0);
  RxInt currentPage = 0.obs;

  animateToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  pickImage(VoidCallback onCameraTap, VoidCallback onGalleryTap) async {
    Get.defaultDialog(
      title: 'Select Image'.tr,
      backgroundColor: Colors.white,
      titleStyle: Get.textTheme.titleMedium!.copyWith(
        color: Get.theme.primaryColor,
        fontWeight: FontWeight.bold,
        fontFamily: (Get.locale == const Locale('ar')) ? 'Almarai' : 'Poppin',
      ),
      middleText: 'Select an image from your device'.tr,
      middleTextStyle: Get.textTheme.bodyMedium!.copyWith(
        color: Colors.grey,
        fontFamily: (Get.locale == const Locale('ar')) ? 'Almarai' : 'Poppin',
      ),
      titlePadding: const EdgeInsets.all(20),
      actions: [
        TextButton(
          onPressed: onCameraTap,
          child: 'Camera'.tr.bodyMedium(color: Constants.grey2),
        ),
        TextButton(
          onPressed: onGalleryTap,
          child: 'Gallery'.tr.bodyMedium(color: Constants.grey2),
        ),
      ],
    );
  }

  /*--------------------------------------------------------------------------*/
  /*---------------------------  Save Functions  -----------------------------*/
  /*--------------------------------------------------------------------------*/

  void setIsFirstTime(bool val) async {
    isFirstTime = val.obs;
    SharedPrefsHelper.storeisFirstTime(val);
  }

  void saveAccessToken(String token) {
    accessToken = token.obs;
    SharedPrefsHelper.saveApiKeyToPrefs(token);
  }

  void saveUserName(String name) {
    userName = name.obs;
    SharedPrefsHelper.saveUserName(name);
  }

  void saveUserEmail(String email) {
    userEmail = email.obs;
    SharedPrefsHelper.saveUserEmail(email);
  }

  void saveUserImage(String image) {
    userImage = image.obs;
    SharedPrefsHelper.saveUserImg(image);
  }

  void saveUserPhone(String phone) {
    userPhone = phone.obs;
    userPhone.refresh();
    SharedPrefsHelper.saveUserPhone(phone);
  }

  void saveUserId(int id) {
    userId = id.obs;
    SharedPrefsHelper.saveUserIdToPrefs(id);
  }

  void saveNotificationOn(bool status) {
    SharedPrefsHelper.saveNotificationStatus(status);
  }

  /*--------------------------------------------------------------------------*/
  /*----------------------------  Get Functions  -----------------------------*/
  /*--------------------------------------------------------------------------*/

  void getAccessToken() async {
    String? data = await SharedPrefsHelper.getApiTokenFromPrefs();
    if (data != null) {
      accessToken = data.obs;
      debugPrint('tokennnnnnnnnnnnnnnnnn :: $accessToken');
    }
  }

  void getUserName() async {
    String? data = await SharedPrefsHelper.getUserName();
    if (data != null) {
      userName = data.obs;
      debugPrint('Naaaaaaaaaaaaaaaaaame :: $userName');
    }
  }

  void getUserEmail() async {
    String? data = await SharedPrefsHelper.getUserEmail();
    if (data != null) {
      userEmail = data.obs;
      debugPrint('Emaaaaiiiiiiiiiiiiiiiilll :: $userEmail');
    }
  }

  void getUserImage() async {
    String? data = await SharedPrefsHelper.getUserImg();
    if (data != null) {
      userImage = data.obs;
      debugPrint('Imaaaaaaaaaaaaaaaaage :: $userImage');
    }
  }

  void getUserPhone() async {
    String? data = await SharedPrefsHelper.getUserPhone();
    if (data != null) {
      userPhone = data.obs;
      debugPrint('Imaaaaaaaaaaaaaaaaage :: $userPhone');
    }
  }

  void getUserId() async {
    int? data = await SharedPrefsHelper.getUserIdFromPrefs();
    if (data != null) {
      userId = data.obs;
      debugPrint('iddddddddddddddddddddddddd :: $userId');
    }
  }

  void getNotificationOn() async {
    bool? data = await SharedPrefsHelper.getNotificationStatus();
    if (data != null) {
      notificationsOn = data.obs;
    }
  }

  void getfirsttime() async {
    bool? data = await SharedPrefsHelper.getIsFirstTime();
    if (data != null) {
      isFirstTime = data.obs;
    }
  }

  /*--------------------------------------------------------------------------*/
  /*--------------------------  Remove User Data  ----------------------------*/
  /*--------------------------------------------------------------------------*/

  void removeUserData() async {
    accessToken.value = '';
    userId.value = 0;
    userName.value = '';
    userPhone.value = '';
    userImage.value = '';
    userEmail.value = '';
    userBirthDate.value = '';
    userGender.value = '';
    SharedPrefsHelper.removeToken();
    SharedPrefsHelper.removeUserId();
    SharedPrefsHelper.removeUserName();
    SharedPrefsHelper.removeUserEmail();
    SharedPrefsHelper.removeUserPhone();
    SharedPrefsHelper.removeUserImg();
    SharedPrefsHelper.removeNotificationStatus();
    SharedPrefsHelper.removeUserBirthDate();
    SharedPrefsHelper.removeUserGender();
    SharedPrefsHelper.removeCountry();
    SharedPrefsHelper.removeCurrency();
  }
}
