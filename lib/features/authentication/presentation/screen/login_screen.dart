import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_store_app/features/authentication/presentation/providers/auth_provider.dart';
import 'package:product_store_app/features/authentication/presentation/providers/state/auth_state.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  static const routeName = '/loginScreen';

  LoginScreen({super.key});

  final TextEditingController emailController =
      TextEditingController(text: 'john@mail.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'changeme');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authStateNotifierProvider);
    ref.listen(authStateNotifierProvider.select((value) => value),
        (previous, next) {
      if (next is Success) {
        print("Successfully");
      } else if (next is Failure) {
        print("===> ${next.exception.message}");
      }
    });
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  counterText: '',
                  labelText: 'Email address',
                  hintText: 'user@example.com',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  counterText: '',
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  ref.read(authStateNotifierProvider.notifier).loginUser(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                },
                child: Container(
                  width: double.maxFinite,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: state.maybeMap(
                    loading: (_) => const CircularProgressIndicator(
                      strokeWidth: 3.0,
                      color: Colors.white,
                    ),
                    orElse: () => const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
