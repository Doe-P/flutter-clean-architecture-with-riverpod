import 'package:auto_route/auto_route.dart';
import 'package:product_store_app/features/splash/presentation/screen/splash_screen.dart';

import '../features/authentication/presentation/screen/login_screen.dart';

part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
     AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
  ];
}