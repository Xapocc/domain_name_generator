import 'package:domain_name_generator/data/models/model_keyword.dart';
import 'package:domain_name_generator/domain/entities/entity_keyword.dart';

abstract class MapperKeyword {
  static EntityKeyword mapKeyword(ModelKeyword model) => EntityKeyword(
        active: model.active,
        category: model.category,
        id: model.id,
        type: model.type,
        words: model.words,
        seq: model.seq,
      );
}
