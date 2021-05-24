import 'package:amor/presentation/routes/router.gr.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

void main() {
  runApp(AmorApp());
}

class AmorApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: StringConst.APP_NAME,
      theme: AppTheme.lightThemeData,
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
