// coverage: false
// coverage:ignore-file

import 'package:deplug/app/my_app.dart';
import 'package:deplug/core/di/di.dart';
import 'package:deplug/core/utils/base_env.dart';
import 'package:deplug/core/utils/bloc_observer/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// this used to initialize all required parameters and start running the app
void initMainCore({required String enviormentPath}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: enviormentPath);
  Bloc.observer = BlocObservers();


  BaseEnv.instance.setEnv();
  configureDependencies();

  runApp(const MyApp());
}

// void setUpNotifications(RemoteNotificationsService remoteNotificationsService) async {
//   var remoteNotificationService = remoteNotificationsService; //sl<RemoteNotificationsService>();
//   await remoteNotificationService.getNotificationsPermission();
//   remoteNotificationService.listenToNotification();
// }
