import 'package:coba_coba/components/config/app_route_config.dart';
import 'package:coba_coba/features/pie_chart/view/rt_rw_screen.dart';
// import 'package:coba_coba/pie_chart_sample.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRouteConfig.defaultRoute,
      routes: {
        AppRouteConfig.defaultRoute: (context) => RtRwScreen(),
      },
    );
  }
}