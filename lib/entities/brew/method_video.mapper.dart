// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'method_video.dart';

class MethodVideoMapper extends ClassMapperBase<MethodVideo> {
  MethodVideoMapper._();

  static MethodVideoMapper? _instance;
  static MethodVideoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MethodVideoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MethodVideo';

  static int _$id(MethodVideo v) => v.id;
  static const Field<MethodVideo, int> _f$id = Field('id', _$id);
  static int _$methodId(MethodVideo v) => v.methodId;
  static const Field<MethodVideo, int> _f$methodId =
      Field('methodId', _$methodId, key: 'method_id');
  static String _$url(MethodVideo v) => v.url;
  static const Field<MethodVideo, String> _f$url = Field('url', _$url);

  @override
  final MappableFields<MethodVideo> fields = const {
    #id: _f$id,
    #methodId: _f$methodId,
    #url: _f$url,
  };

  static MethodVideo _instantiate(DecodingData data) {
    return MethodVideo(
        id: data.dec(_f$id),
        methodId: data.dec(_f$methodId),
        url: data.dec(_f$url));
  }

  @override
  final Function instantiate = _instantiate;

  static MethodVideo fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MethodVideo>(map);
  }

  static MethodVideo fromJson(String json) {
    return ensureInitialized().decodeJson<MethodVideo>(json);
  }
}

mixin MethodVideoMappable {
  String toJson() {
    return MethodVideoMapper.ensureInitialized()
        .encodeJson<MethodVideo>(this as MethodVideo);
  }

  Map<String, dynamic> toMap() {
    return MethodVideoMapper.ensureInitialized()
        .encodeMap<MethodVideo>(this as MethodVideo);
  }

  MethodVideoCopyWith<MethodVideo, MethodVideo, MethodVideo> get copyWith =>
      _MethodVideoCopyWithImpl(this as MethodVideo, $identity, $identity);
  @override
  String toString() {
    return MethodVideoMapper.ensureInitialized()
        .stringifyValue(this as MethodVideo);
  }

  @override
  bool operator ==(Object other) {
    return MethodVideoMapper.ensureInitialized()
        .equalsValue(this as MethodVideo, other);
  }

  @override
  int get hashCode {
    return MethodVideoMapper.ensureInitialized().hashValue(this as MethodVideo);
  }
}

extension MethodVideoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MethodVideo, $Out> {
  MethodVideoCopyWith<$R, MethodVideo, $Out> get $asMethodVideo =>
      $base.as((v, t, t2) => _MethodVideoCopyWithImpl(v, t, t2));
}

abstract class MethodVideoCopyWith<$R, $In extends MethodVideo, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, int? methodId, String? url});
  MethodVideoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MethodVideoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MethodVideo, $Out>
    implements MethodVideoCopyWith<$R, MethodVideo, $Out> {
  _MethodVideoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MethodVideo> $mapper =
      MethodVideoMapper.ensureInitialized();
  @override
  $R call({int? id, int? methodId, String? url}) => $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (methodId != null) #methodId: methodId,
        if (url != null) #url: url
      }));
  @override
  MethodVideo $make(CopyWithData data) => MethodVideo(
      id: data.get(#id, or: $value.id),
      methodId: data.get(#methodId, or: $value.methodId),
      url: data.get(#url, or: $value.url));

  @override
  MethodVideoCopyWith<$R2, MethodVideo, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MethodVideoCopyWithImpl($value, $cast, t);
}
