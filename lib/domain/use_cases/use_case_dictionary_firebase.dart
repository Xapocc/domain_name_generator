import 'package:domain_name_generator/domain/i_repositories/i_repository_dictionary_firebase.dart';
import 'package:firebase_database/firebase_database.dart';

class UseCaseDictionaryFirebase {
  UseCaseDictionaryFirebase({required this.repository});

  final IRepositoryDictionaryFirebase repository;

  Future<Map<String, List<dynamic>>> getDictionaryMap(
      FirebaseDatabase database) async {
    return repository.getDictionaryMap(database);
  }
}
