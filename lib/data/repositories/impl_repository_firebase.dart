import 'package:domain_name_generator/data/mappers/mapper_keyword.dart';
import 'package:domain_name_generator/data/mappers/mapper_zone.dart';
import 'package:domain_name_generator/data/models/model_keyword.dart';
import 'package:domain_name_generator/data/models/model_zone.dart';
import 'package:domain_name_generator/domain/entities/entity_keyword.dart';
import 'package:domain_name_generator/domain/entities/entity_zone.dart';
import 'package:domain_name_generator/domain/i_repositories/i_repository_dictionary_firebase.dart';
import 'package:domain_name_generator/main.dart';
import 'package:firebase_database/firebase_database.dart';

class ImplRepositoryFirebase implements IRepositoryDictionaryFirebase {
  @override
  Future<Map<String, List<dynamic>>> getDictionaryMap() async {
    DataSnapshot keywords;
    DataSnapshot zones;

    DatabaseReference ref = database.ref();
    var snapshot = await ref.get();

    if (!snapshot.exists) throw Exception("No data received.");

    keywords = snapshot.children
        .firstWhere((element) =>
            element.key == "1Ri9cNEUUN6kTpTZ_fPXo90J9IE_EdQPqPG9oUNeyOu4")
        .children
        .firstWhere((element) => element.key == "keywords");

    zones = snapshot.children
        .firstWhere((element) =>
            element.key == "1Ri9cNEUUN6kTpTZ_fPXo90J9IE_EdQPqPG9oUNeyOu4")
        .children
        .firstWhere((element) => element.key == "zones");

    return {
      "keywords": _parseEntityKeywordsList(keywords),
      "zones": _parseEntityZonesList(zones),
    };
  }

  List<EntityKeyword> _parseEntityKeywordsList(DataSnapshot keywords) {
    List<ModelKeyword> modelKeywordsList = [];
    for (DataSnapshot item in keywords.children) {
      modelKeywordsList.add(
        ModelKeyword(
          active: item.children
              .firstWhere((element) => element.key == "active")
              .value as bool,
          category: item.children
              .firstWhere((element) => element.key == "category")
              .value as String,
          id: item.children.firstWhere((element) => element.key == "id").value
              as String,
          type: item.children
              .firstWhere((element) => element.key == "type")
              .value as String,
          words: item.children
              .firstWhere((element) => element.key == "words")
              .value as String,
          seq: item.children.firstWhere((element) => element.key == "seq").value
              as int,
        ),
      );
    }

    List<EntityKeyword> entityKeywordsList = [];
    for (ModelKeyword model in modelKeywordsList) {
      entityKeywordsList.add(MapperKeyword.mapKeyword(model));
    }

    return entityKeywordsList;
  }

  List<EntityZone> _parseEntityZonesList(DataSnapshot zones) {
    List<ModelZone> modelZonesList = [];
    for (DataSnapshot item in zones.children) {
      modelZonesList.add(
        ModelZone(
          active: item.children
              .firstWhere((element) => element.key == "active")
              .value as bool,
          featured: item.children
              .firstWhere((element) => element.key == "featured")
              .value as bool,
          id: item.children.firstWhere((element) => element.key == "id").value
              as String,
          rdapUrl: item.children
              .firstWhere((element) => element.key == "rdap_url")
              .value as String,
          whoisQuery: item.children
              .firstWhere((element) => element.key == "whois_query")
              .value as String,
          whoisServer: item.children
              .firstWhere((element) => element.key == "whois_server")
              .value as String,
          zone: item.children
              .firstWhere((element) => element.key == "zone")
              .value as String,
          seq: item.children.firstWhere((element) => element.key == "seq").value
              as int,
        ),
      );
    }

    List<EntityZone> entityZonesList = [];
    for (ModelZone model in modelZonesList) {
      entityZonesList.add(MapperZone.mapZone(model));
    }

    return entityZonesList;
  }
}
