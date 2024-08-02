// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'brewing_method.dart';

class BrewingMethodMapper extends ClassMapperBase<BrewingMethod> {
  BrewingMethodMapper._();

  static BrewingMethodMapper? _instance;
  static BrewingMethodMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BrewingMethodMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BrewingMethod';

  static int _$id(BrewingMethod v) => v.id;
  static const Field<BrewingMethod, int> _f$id = Field('id', _$id);
  static String _$name(BrewingMethod v) => v.name;
  static const Field<BrewingMethod, String> _f$name = Field('name', _$name);
  static String _$description(BrewingMethod v) => v.description;
  static const Field<BrewingMethod, String> _f$description =
      Field('description', _$description);
  static String _$image(BrewingMethod v) => v.image;
  static const Field<BrewingMethod, String> _f$image = Field('image', _$image);
  static String _$history(BrewingMethod v) => v.history;
  static const Field<BrewingMethod, String> _f$history =
      Field('history', _$history);

  @override
  final MappableFields<BrewingMethod> fields = const {
    #id: _f$id,
    #name: _f$name,
    #description: _f$description,
    #image: _f$image,
    #history: _f$history,
  };

  static BrewingMethod _instantiate(DecodingData data) {
    return BrewingMethod(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        description: data.dec(_f$description),
        image: data.dec(_f$image),
        history: data.dec(_f$history));
  }

  @override
  final Function instantiate = _instantiate;

  static BrewingMethod fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BrewingMethod>(map);
  }

  static BrewingMethod fromJson(String json) {
    return ensureInitialized().decodeJson<BrewingMethod>(json);
  }
}

mixin BrewingMethodMappable {
  String toJson() {
    return BrewingMethodMapper.ensureInitialized()
        .encodeJson<BrewingMethod>(this as BrewingMethod);
  }

  Map<String, dynamic> toMap() {
    return BrewingMethodMapper.ensureInitialized()
        .encodeMap<BrewingMethod>(this as BrewingMethod);
  }

  BrewingMethodCopyWith<BrewingMethod, BrewingMethod, BrewingMethod>
      get copyWith => _BrewingMethodCopyWithImpl(
          this as BrewingMethod, $identity, $identity);
  @override
  String toString() {
    return BrewingMethodMapper.ensureInitialized()
        .stringifyValue(this as BrewingMethod);
  }

  @override
  bool operator ==(Object other) {
    return BrewingMethodMapper.ensureInitialized()
        .equalsValue(this as BrewingMethod, other);
  }

  @override
  int get hashCode {
    return BrewingMethodMapper.ensureInitialized()
        .hashValue(this as BrewingMethod);
  }
}

extension BrewingMethodValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BrewingMethod, $Out> {
  BrewingMethodCopyWith<$R, BrewingMethod, $Out> get $asBrewingMethod =>
      $base.as((v, t, t2) => _BrewingMethodCopyWithImpl(v, t, t2));
}

abstract class BrewingMethodCopyWith<$R, $In extends BrewingMethod, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? name,
      String? description,
      String? image,
      String? history});
  BrewingMethodCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BrewingMethodCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BrewingMethod, $Out>
    implements BrewingMethodCopyWith<$R, BrewingMethod, $Out> {
  _BrewingMethodCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BrewingMethod> $mapper =
      BrewingMethodMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          String? name,
          String? description,
          String? image,
          String? history}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (description != null) #description: description,
        if (image != null) #image: image,
        if (history != null) #history: history
      }));
  @override
  BrewingMethod $make(CopyWithData data) => BrewingMethod(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      description: data.get(#description, or: $value.description),
      image: data.get(#image, or: $value.image),
      history: data.get(#history, or: $value.history));

  @override
  BrewingMethodCopyWith<$R2, BrewingMethod, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BrewingMethodCopyWithImpl($value, $cast, t);
}
