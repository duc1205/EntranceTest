import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:main_app/routers/app_pages.dart';
import 'package:main_app/storage/local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String initRoute = Routes.singnUp;
  final accessToken = await SPref.instance.getAccessToken();
  if (accessToken != null) {
    final hasExpried = JwtDecoder.isExpired(accessToken);
    if (!hasExpried) {
      initRoute = Routes.categories;
    }
  }

  runApp(MyApp(
    initRouter: initRoute,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initRouter});
  final String initRouter;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.singnUp,
      getPages: AppPages.pages,
    );
  }
}
