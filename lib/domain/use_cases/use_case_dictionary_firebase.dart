import 'package:domain_name_generator/domain/i_repositories/i_repository_dictionary_firebase.dart';

class UseCaseDictionaryFirebase {
  UseCaseDictionaryFirebase({required this.repository});

  final IRepositoryDictionaryFirebase repository;

  Future<Map<String, List<dynamic>>> getDictionaryMap() async {
    return repository.getDictionaryMap();
  }
}