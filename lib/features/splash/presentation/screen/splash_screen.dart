import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_store_app/features/splash/presentation/providers/splash_provider.dart';
import 'package:product_store_app/features/splash/presentation/providers/state/splash_state.dart';
import 'package:product_store_app/routes/app_route.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  static const String routeName = '/splashScreen';

  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(splashStateNotifierProvider);
    ref.listen(splashStateNotifierProvider.select((value) => value), (previous, next) {
      if(next is Unauthenticated){
        AutoRouter.of(context).pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
      }else if(next is Authenticated){
        
      }
    });
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            state.maybeMap(
              checking: (_) => const CircularProgressIndicator(),
              noInternet: (_) => const Text(
                "No Internet!!",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              orElse: () => const SizedBox(height: 0),
            ),
          ],
        ),
      ),
    );
  }
}
