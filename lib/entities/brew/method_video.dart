import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';

part 'method_video.mapper.dart';

@MappableClass()
class MethodVideo extends Equatable with MethodVideoMappable {
  final int id;
  @MappableField(key: 'method_id')
  final int methodId;
  final String url;

  const MethodVideo({
    required this.id,
    required this.methodId,
    required this.url,
  });

  @override
  List<Object?> get props => [
        id,
        methodId,
        url,
      ];
}
