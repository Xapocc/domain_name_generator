import 'package:firebase_database/firebase_database.dart';

abstract class IRepositoryDictionaryFirebase {
  Future<Map<String, List<dynamic>>> getDictionaryMap(
      FirebaseDatabase database);
}
