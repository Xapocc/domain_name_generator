import 'package:domain_name_generator/app/app_root.dart';
import 'package:domain_name_generator/app/di.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';

late FirebaseDatabase database; // TODO: move to DI

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  DependencyInjection.setupGetIt();

  runApp(const AppRoot());
}
