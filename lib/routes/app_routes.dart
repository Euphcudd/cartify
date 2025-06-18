import 'package:cartify/screens/customer/home_screen.dart';
import 'package:cartify/screens/splash_screen.dart';
import 'package:flutter/material.dart';
// import '../screens/customer/home_screen.dart';
// import '../screens/customer/category_products.dart';
// import '../screens/customer/product_detail.dart';
// import '../screens/customer/cart_screen.dart';
// import '../screens/customer/checkout_screen.dart';
// import '../screens/customer/order_status_screen.dart';
// import '../screens/customer/track_order_screen.dart';

// import '../screens/admin/admin_home.dart';
// import '../screens/admin/login_admin.dart';
// import '../screens/admin/product_manage.dart';
// import '../screens/admin/order_list.dart';
// import '../screens/admin/upload_bill.dart';
// import '../screens/admin/reports_dashboard.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String mainScreen = '/';
  static const String customerHome = '/home';
  static const String categoryProducts = '/category-products';
  static const String productDetail = '/product-detail';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String orderStatus = '/order-status';
  static const String trackOrder = '/track-order';

  static const String adminLogin = '/admin-login';
  static const String adminHome = '/admin-home';
  static const String productManage = '/product-manage';
  static const String orderList = '/order-list';
  static const String uploadBill = '/upload-bill';
  static const String reportsDashboard = '/reports-dashboard';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case mainScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      // case customerHome:
      //   return MaterialPageRoute(builder: (_) => const HomeScreen());
      // case categoryProducts:
      //   return MaterialPageRoute(builder: (_) => const CategoryProductsScreen());
      // case productDetail:
      //   return MaterialPageRoute(builder: (_) => const ProductDetailScreen());
      // case cart:
      //   return MaterialPageRoute(builder: (_) => const CartScreen());
      // case checkout:
      //   return MaterialPageRoute(builder: (_) => const CheckoutScreen());
      // case orderStatus:
      //   return MaterialPageRoute(builder: (_) => const OrderStatusScreen());
      // case trackOrder:
      //   return MaterialPageRoute(builder: (_) => const TrackOrderScreen());

      // // Admin Routes
      // case adminLogin:
      //   return MaterialPageRoute(builder: (_) => const AdminLoginScreen());
      // case adminHome:
      //   return MaterialPageRoute(builder: (_) => const AdminHomeScreen());
      // case productManage:
      //   return MaterialPageRoute(builder: (_) => const ProductManageScreen());
      // case orderList:
      //   return MaterialPageRoute(builder: (_) => const OrderListScreen());
      // case uploadBill:
      //   return MaterialPageRoute(builder: (_) => const UploadBillScreen());
      // case reportsDashboard:
      //   return MaterialPageRoute(builder: (_) => const ReportsDashboardScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }
}
