import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce/features/authentication/screens/singup/signup.dart';
import 'package:e_commerce/features/authentication/screens/singup/verify_email.dart';
import 'package:e_commerce/features/personalization/screens/address/address.dart';
import 'package:e_commerce/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce/features/shop/screens/cart/cart.dart';
import 'package:e_commerce/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/order/order.dart';
import 'package:e_commerce/features/shop/screens/store/store.dart';
import 'package:e_commerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.store, page: () => const StoreScreen(),),
    GetPage(name: Routes.wishlist, page: () => const WishlistScreen(),),
    GetPage(name: Routes.profile, page: () => const ProfileScreen(),),
    GetPage(name: Routes.order, page: () => const OrderScreen(),),
    GetPage(name: Routes.checkout, page: () => const CheckoutScreen(),),
    GetPage(name: Routes.cart, page: () => const CartScreen(),),
    GetPage(name: Routes.editProfile, page: () => const ProfileScreen(),),
    GetPage(name: Routes.userAddress, page: () => const UserAddressScreen(),),
    GetPage(name: Routes.signup, page: () => const SignupScreen(),),
    GetPage(name: Routes.verifyEmail, page: () => const VerifyEmailScreen(),),
    GetPage(name: Routes.signIn, page: () => const LoginScreen(),),
    GetPage(name: Routes.forgetPassword, page: () => const ForgetPasswordScreen(),),
    GetPage(name: Routes.onBoarding, page: () => const OnboardingScreen(),),
  ];
}