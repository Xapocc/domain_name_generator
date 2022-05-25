import 'package:domain_name_generator/app/app_root.dart';
import 'package:domain_name_generator/app/di.dart';
import 'package:domain_name_generator/domain/entities/entity_zone.dart';
import 'package:domain_name_generator/domain/use_cases/use_case_dictionary_firebase.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
import 'firebase_options.dart';

late FirebaseDatabase database; // TODO: move to DI

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjection.setupGetIt();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  database = FirebaseDatabase.instance;

  runApp(const AppRoot());
}
