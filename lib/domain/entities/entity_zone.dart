class EntityZone {
  final bool active, featured;
  final String id, rdapUrl, whoisQuery, whoisServer, zone;
  final int seq;

  EntityZone({
    required this.active,
    required this.featured,
    required this.id,
    required this.rdapUrl,
    required this.whoisQuery,
    required this.whoisServer,
    required this.zone,
    required this.seq,
  });
}
