import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:task_demo/config/app_router.dart';
import 'package:task_demo/constants/app_colors.dart';
import 'package:task_demo/constants/env.dart';

import 'config/di.dart';

void main() {
  init();
  Env.initEnvFile();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      onGenerateRoute: _appRouter.onGenerateRoute,
      theme: ThemeData(
          primarySwatch: AppColors.primarySwatch,
          hintColor: Colors.grey,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
          iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
          canvasColor: AppColors.primarySwatch[700]),
    );
  }
}
