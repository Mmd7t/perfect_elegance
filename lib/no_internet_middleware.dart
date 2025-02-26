// import 'package:get/get.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';

// class InternetCheckMiddleware extends GetMiddleware {
//   @override
//   Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
//     final connectivity = Connectivity();
//     final status = await connectivity.checkConnectivity();

//     if (status.contains(ConnectivityResult.none)) {
//       return GetNavConfig.fromRoute('/no-internet');
//     }

//     return super.redirectDelegate(route);
//   }
// }
