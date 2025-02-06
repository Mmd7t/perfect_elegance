import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/customers/bindings/customer_details_binding.dart';
import 'package:perfect_elegance/app/modules/customers/views/edit_customer_view.dart';
import 'package:perfect_elegance/app/modules/main/bindings/stores_binding.dart';
import 'package:perfect_elegance/app/modules/main/views/stores_view.dart';
import 'package:perfect_elegance/app/modules/profile/bindings/account_verified_binding.dart';
import 'package:perfect_elegance/app/modules/requests/bindings/add_order_binding.dart';
import 'package:perfect_elegance/app/modules/requests/bindings/order_details_binding.dart';
import 'package:perfect_elegance/app/modules/requests/views/add_more_product_view.dart';
import 'package:perfect_elegance/app/modules/requests/views/request_details_view.dart';
import 'package:perfect_elegance/app/modules/shipments/bindings/shipments_details_binding.dart';
import 'package:perfect_elegance/app/modules/tickets/bindings/ticket_details_binding.dart';

import '../../no_internet_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/forget_pass_view.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/otp_code_view.dart';
import '../modules/auth/views/reset_password.dart';
import '../modules/auth/views/signup_view.dart';
import '../modules/customers/bindings/customers_binding.dart';
import '../modules/customers/views/customer_details_view.dart';
import '../modules/customers/views/customers_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/account_statement_binding.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/account_statement_view.dart';
import '../modules/profile/views/account_verified_view.dart';
import '../modules/profile/views/policy_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile/views/terms_view.dart';
import '../modules/requests/bindings/requests_binding.dart';
import '../modules/requests/views/add_customer_view.dart';
import '../modules/requests/views/add_new_product_view.dart';
import '../modules/requests/views/add_request_view.dart';
import '../modules/requests/views/requests_view.dart';
import '../modules/returns/bindings/returns_binding.dart';
import '../modules/returns/views/returns_view.dart';
import '../modules/settlements/bindings/settlements_binding.dart';
import '../modules/settlements/views/settlements_view.dart';
import '../modules/shipments/bindings/shipments_binding.dart';
import '../modules/shipments/views/shipment_details_view.dart';
import '../modules/shipments/views/shipments_view.dart';
import '../modules/tickets/bindings/tickets_binding.dart';
import '../modules/tickets/views/add_ticket_view.dart';
import '../modules/tickets/views/ticket_details_view.dart';
import '../modules/tickets/views/tickets_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.noInternet,
      page: () => const NoInternetView(),
    ),
    GetPage(
      name: Routes.main,
      page: () => const MainView(),
      bindings: [
        MainBinding(),
        RequestsBinding(),
        ShipmentsBinding(),
        SettlementsBinding(),
        ProfileBinding(),
      ],
    ),
    GetPage(
      name: Routes.stores,
      page: () => const StoresView(),
      binding: StoresBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.accountVerified,
      page: () => const AccountVerifiedView(),
      binding: AccountVerifiedBinding(),
    ),
    GetPage(
      name: Routes.policy,
      page: () => const PolicyView(),
    ),
    GetPage(
      name: Routes.terms,
      page: () => const TermsView(),
    ),
    GetPage(
      name: Routes.accountStatement,
      page: () => const AccountStatementView(),
      binding: AccountStatementBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgetPass,
      page: () => const ForgetPassView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.otpCode,
      page: () => const OtpCodeView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.requests,
      page: () => const RequestsView(),
      binding: RequestsBinding(),
    ),
    GetPage(
      name: Routes.shipments,
      page: () => const ShipmentsView(),
      binding: ShipmentsBinding(),
    ),
    GetPage(
      name: Routes.shipmentDetails,
      page: () => const ShipmentDetailsView(),
      binding: ShipmentDetailsBinding(),
    ),
    GetPage(
      name: Routes.settlements,
      page: () => const SettlementsView(),
      binding: SettlementsBinding(),
    ),
    GetPage(
      name: Routes.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: Routes.resetPass,
      page: () => const ResetPassword(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.notifications,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: Routes.requestDetails,
      page: () => const RequestDetailsView(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: Routes.addProductsRequest,
      page: () => const AddMoreProductView(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: Routes.addRequest,
      page: () => const AddRequestView(),
      binding: AddOrderBinding(),
    ),
    GetPage(
      name: Routes.addCustomer,
      page: () => const AddCustomerView(),
      binding: AddOrderBinding(),
    ),
    GetPage(
      name: Routes.addNewProduct,
      page: () => const AddNewProductView(),
      binding: AddOrderBinding(),
    ),
    GetPage(
      name: Routes.tickets,
      page: () => const TicketsView(),
      binding: TicketsBinding(),
    ),
    GetPage(
      name: Routes.addTicket,
      page: () => const AddTicketView(),
      binding: TicketsBinding(),
    ),
    GetPage(
      name: Routes.ticketDetails,
      page: () => const TicketDetailsView(),
      binding: TicketDetailsBinding(),
    ),
    GetPage(
      name: Routes.customers,
      page: () => const CustomersView(),
      binding: CustomersBinding(),
    ),
    GetPage(
      name: Routes.customerDetails,
      page: () => const CustomerDetailsView(),
      binding: CustomerDetailsBinding(),
    ),
    GetPage(
      name: Routes.editCustomer,
      page: () => const EditCustomerView(),
      binding: CustomerDetailsBinding(),
    ),
    GetPage(
      name: Routes.returns,
      page: () => const ReturnsView(),
      binding: ReturnsBinding(),
    ),
  ];
}
