// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brew _$BrewFromJson(Map<String, dynamic> json) => Brew(
      id: json['id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      methodId: json['method_id'] as int,
      ratio: json['ratio'] as int,
      water: json['water'] as int,
      coffeeGrams: json['coffee_grams'] as int,
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$BrewToJson(Brew instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'method_id': instance.methodId,
      'ratio': instance.ratio,
      'water': instance.water,
      'coffee_grams': instance.coffeeGrams,
      'user_id': instance.userId,
    };
