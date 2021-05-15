import 'package:amor/presentation/routes/router.gr.dart';
import 'package:amor/values/values.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: StringConst.APP_NAME,
      theme: AppTheme.lightThemeData,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
