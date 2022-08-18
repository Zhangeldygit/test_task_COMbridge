// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Person _$$_PersonFromJson(Map<String, dynamic> json) => _$_Person(
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      episode:
          (json['episode'] as List<dynamic>?)?.map((e) => e as String).toList(),
      gender: json['gender'] as String?,
      id: json['id'] as int?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      species: json['species'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_PersonToJson(_$_Person instance) => <String, dynamic>{
      'created': instance.created?.toIso8601String(),
      'episode': instance.episode,
      'gender': instance.gender,
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'species': instance.species,
      'status': instance.status,
      'type': instance.type,
      'url': instance.url,
    };
