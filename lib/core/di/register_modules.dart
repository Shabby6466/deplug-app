// coverage: false
// coverage:ignore-file

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

// Injectable is a convenient code generator for get_it.
// All you have to do now is annotate your injectable classes with @injectable and let the generator do the work.
// This class is use to generate code to register objects on app start
@module
abstract class RegisterModule {
  // same thing works for instances that's gotten asynchronous.
  // all you need to do is wrap your instance with a future and tell injectable how
  // to initialize it

  @LazySingleton()
  ImagePicker get imagePicker => ImagePicker();

// Also, make sure you await for your configure function before running the App.
  @LazySingleton()
  Logger get logger => Logger(level: Level.all, filter: ProductionFilter());

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @LazySingleton()
  FlutterSecureStorage get flutterSecureStorage => FlutterSecureStorage(aOptions: _getAndroidOptions());
}
