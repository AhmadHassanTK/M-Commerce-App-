import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Backend/AuthenticationRepository.dart';
import 'package:shoes_app/firebase_options.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_app/utils/Bindings/GeneralBinding.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/theme/theme.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: CAppTheme.lightTheme,
      darkTheme: CAppTheme.darkTheme,
      initialBinding: GeneralBinding(),
      home: const Scaffold(
        backgroundColor: CColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: CColors.white,
          ),
        ),
      ),
    );
  }
}
