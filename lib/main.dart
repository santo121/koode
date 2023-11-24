import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/config.dart';
import 'global/routes/screen_routes.routes.dart';
import 'global/styles/colors.styles.dart';

void main() {
  runApp(const MyApp());
}
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      child: 

          MaterialApp(
              navigatorKey: navigatorKey,
              theme:ThemeData(primaryColor: kBlue),
              routes: routes,
              initialRoute: '/',
              debugShowCheckedModeBanner: false,
              navigatorObservers: [routeObserver],
              title: 'KOODE',

            ),
            
    );
  }
}
