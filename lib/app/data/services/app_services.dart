import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/providers/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/main/views/home_view.dart';
import 'package:perfect_elegance/app/modules/profile/views/profile_view.dart';
import 'package:perfect_elegance/app/modules/requests/views/requests_view.dart';
import 'package:perfect_elegance/app/modules/settlements/views/settlements_view.dart';
import 'package:perfect_elegance/app/modules/shipments/views/shipments_view.dart';
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
    getIsVerified();
    getStoreName();
  }

  /*--------------------------------------------------------------------------*/
  /*------------------------------  Variables  -------------------------------*/
  /*--------------------------------------------------------------------------*/
  RxInt currentIndex = 0.obs;
  final List<String> navBarIcons = [
    'home',
    'request',
    'truck',
    'settlement',
    'settings',
  ];
  final List<String> activeNavBarIcons = [
    'home-fill',
    'request-fill',
    'truck-fill',
    'settlement-fill',
    'settings-fill',
  ];
  final List<String> navBarTitles = [
    'الرئيسية',
    'الطلبات',
    'الشحنات',
    'التسوية',
    'حسابي',
  ];

  final List<Widget> navBarPages = [
    const HomeView(),
    const RequestsView(),
    const ShipmentsView(),
    const SettlementsView(),
    const ProfileView(),
  ];

  final PageController pageController = PageController();

  RxBool notificationsOn = RxBool(true);
  RxBool isSignup = RxBool(false);

  RxInt packageId = 0.obs;
  RxInt customerId = 0.obs;
  RxInt ticketId = 0.obs;
  RxInt orderId = 0.obs;

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
  RxBool isVerified = false.obs;
  RxString storeName = "".obs;

  /*--------------------------------------------------------------------------*/
  /*-------------------------  Control Toggle Bars  --------------------------*/
  /*--------------------------------------------------------------------------*/

  pickImage(VoidCallback onCameraTap, VoidCallback onGalleryTap) async {
    Get.defaultDialog(
      title: 'أختر صورة',
      backgroundColor: Colors.white,
      titleStyle: Get.textTheme.titleMedium!.copyWith(
        color: Get.theme.primaryColor,
        fontWeight: FontWeight.bold,
        fontFamily: 'Cairo',
      ),
      middleText: 'أختر صورة من جهازك'.tr,
      middleTextStyle: Get.textTheme.bodyMedium!.copyWith(
        color: Colors.grey,
        fontFamily: 'Cairo',
      ),
      titlePadding: const EdgeInsets.all(20),
      actions: [
        TextButton(
          onPressed: onCameraTap,
          child: 'الكاميرا'.tr.bodyMedium(color: Constants.grey2),
        ),
        TextButton(
          onPressed: onGalleryTap,
          child: 'المعرض'.tr.bodyMedium(color: Constants.grey2),
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

  void setStoreName(String val) async {
    storeName = val.obs;
    SharedPrefsHelper.storeStoreName(val);
  }

  void setIsVerified(bool val) async {
    isVerified = val.obs;
    SharedPrefsHelper.storeisverified(val);
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

  void getStoreName() async {
    String? data = await SharedPrefsHelper.getStoreName();
    if (data != null) {
      storeName = data.obs;
      debugPrint('Store Name :: $storeName');
    }
  }

  void getIsVerified() async {
    bool? data = await SharedPrefsHelper.getIsVerified();
    if (data != null) {
      isVerified = data.obs;
      debugPrint('verified :: $isVerified');
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
    SharedPrefsHelper.removeAll();
  }
}
