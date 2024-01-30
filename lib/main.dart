import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_store_app/main/app_env.dart';
import 'package:product_store_app/main/observers.dart';

import 'main/app.dart';

void main() => mainCommon(AppEnvironment.DEV);

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  EnvInfo.initialize(environment);

  runApp(
     ProviderScope(
      observers: [
        Observers(),
      ],
      child: MyApp(),
    ),
  );
}
