import 'package:amor/app_theme.dart';
import 'package:amor/presentation/routes/router.gr.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

void main() {
  runApp(AmorApp());
}

class AmorApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp.router(
        title: StringConst.APP_NAME,
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
//
//    return MaterialApp(
//      title: StringConst.APP_NAME,
//      theme: AppTheme.lightThemeData,
//      debugShowCheckedModeBanner: false,
//      home: StaggeredExtentExtentPage(),
//    );
  }
}
