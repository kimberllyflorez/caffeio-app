// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'brew.dart';

class BrewMapper extends ClassMapperBase<Brew> {
  BrewMapper._();

  static BrewMapper? _instance;
  static BrewMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BrewMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Brew';

  static int? _$id(Brew v) => v.id;
  static const Field<Brew, int> _f$id = Field('id', _$id, opt: true);
  static DateTime? _$createdAt(Brew v) => v.createdAt;
  static const Field<Brew, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: 'created_at', opt: true);
  static int _$methodId(Brew v) => v.methodId;
  static const Field<Brew, int> _f$methodId =
      Field('methodId', _$methodId, key: 'method_id');
  static int _$ratio(Brew v) => v.ratio;
  static const Field<Brew, int> _f$ratio = Field('ratio', _$ratio);
  static int _$water(Brew v) => v.water;
  static const Field<Brew, int> _f$water = Field('water', _$water);
  static int _$coffeeGrams(Brew v) => v.coffeeGrams;
  static const Field<Brew, int> _f$coffeeGrams =
      Field('coffeeGrams', _$coffeeGrams, key: 'coffee_grams');
  static String _$userId(Brew v) => v.userId;
  static const Field<Brew, String> _f$userId =
      Field('userId', _$userId, key: 'user_id');

  @override
  final MappableFields<Brew> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #methodId: _f$methodId,
    #ratio: _f$ratio,
    #water: _f$water,
    #coffeeGrams: _f$coffeeGrams,
    #userId: _f$userId,
  };

  static Brew _instantiate(DecodingData data) {
    return Brew(
        id: data.dec(_f$id),
        createdAt: data.dec(_f$createdAt),
        methodId: data.dec(_f$methodId),
        ratio: data.dec(_f$ratio),
        water: data.dec(_f$water),
        coffeeGrams: data.dec(_f$coffeeGrams),
        userId: data.dec(_f$userId));
  }

  @override
  final Function instantiate = _instantiate;

  static Brew fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Brew>(map);
  }

  static Brew fromJson(String json) {
    return ensureInitialized().decodeJson<Brew>(json);
  }
}

mixin BrewMappable {
  String toJson() {
    return BrewMapper.ensureInitialized().encodeJson<Brew>(this as Brew);
  }

  Map<String, dynamic> toMap() {
    return BrewMapper.ensureInitialized().encodeMap<Brew>(this as Brew);
  }

  BrewCopyWith<Brew, Brew, Brew> get copyWith =>
      _BrewCopyWithImpl(this as Brew, $identity, $identity);
  @override
  String toString() {
    return BrewMapper.ensureInitialized().stringifyValue(this as Brew);
  }

  @override
  bool operator ==(Object other) {
    return BrewMapper.ensureInitialized().equalsValue(this as Brew, other);
  }

  @override
  int get hashCode {
    return BrewMapper.ensureInitialized().hashValue(this as Brew);
  }
}

extension BrewValueCopy<$R, $Out> on ObjectCopyWith<$R, Brew, $Out> {
  BrewCopyWith<$R, Brew, $Out> get $asBrew =>
      $base.as((v, t, t2) => _BrewCopyWithImpl(v, t, t2));
}

abstract class BrewCopyWith<$R, $In extends Brew, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      DateTime? createdAt,
      int? methodId,
      int? ratio,
      int? water,
      int? coffeeGrams,
      String? userId});
  BrewCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BrewCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Brew, $Out>
    implements BrewCopyWith<$R, Brew, $Out> {
  _BrewCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Brew> $mapper = BrewMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? createdAt = $none,
          int? methodId,
          int? ratio,
          int? water,
          int? coffeeGrams,
          String? userId}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (createdAt != $none) #createdAt: createdAt,
        if (methodId != null) #methodId: methodId,
        if (ratio != null) #ratio: ratio,
        if (water != null) #water: water,
        if (coffeeGrams != null) #coffeeGrams: coffeeGrams,
        if (userId != null) #userId: userId
      }));
  @override
  Brew $make(CopyWithData data) => Brew(
      id: data.get(#id, or: $value.id),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      methodId: data.get(#methodId, or: $value.methodId),
      ratio: data.get(#ratio, or: $value.ratio),
      water: data.get(#water, or: $value.water),
      coffeeGrams: data.get(#coffeeGrams, or: $value.coffeeGrams),
      userId: data.get(#userId, or: $value.userId));

  @override
  BrewCopyWith<$R2, Brew, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BrewCopyWithImpl($value, $cast, t);
}
