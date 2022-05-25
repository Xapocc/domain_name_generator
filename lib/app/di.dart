import 'package:domain_name_generator/data/repositories/impl_repository_firebase.dart';
import 'package:domain_name_generator/domain/use_cases/use_case_dictionary_firebase.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';

class DependencyInjection {
  static void setupGetIt() {
    GetIt.I.registerSingleton<FirebaseDatabase>(FirebaseDatabase.instance);
    GetIt.I.registerSingleton<UseCaseDictionaryFirebase>(
        UseCaseDictionaryFirebase(repository: ImplRepositoryFirebase()));
  }
}
