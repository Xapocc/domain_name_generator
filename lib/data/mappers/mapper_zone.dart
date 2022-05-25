import 'package:domain_name_generator/data/models/model_zone.dart';
import 'package:domain_name_generator/domain/entities/entity_zone.dart';

abstract class MapperZone {
  static EntityZone mapZone(ModelZone model) => EntityZone(
        active: model.active,
        featured: model.featured,
        id: model.id,
        rdapUrl: model.rdapUrl,
        whoisQuery: model.whoisQuery,
        whoisServer: model.whoisServer,
        zone: model.zone,
        seq: model.seq,
      );
}
