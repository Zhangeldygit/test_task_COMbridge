class Person {
  Person({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  final DateTime? created;
  final List<String>? episode;
  final String? gender;
  final int? id;
  final String? image;
  final String? name;
  final String? species;
  final String? status;
  final String? type;
  final String? url;

  factory Person.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Person();
    List<String>? episode = [];
    if (json["episode"] is List) {
      for (var item in json["episode"]) {
        episode.add(item);
      }
    }
    return Person(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      species: json["species"],
      type: json["type"],
      gender: json["gender"],
      image: json["image"],
      episode: episode,
      url: json["url"],
      created: json["created"] == null ? null : DateTime.parse(json["created"]),
    );
  }
}