import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'method_video.g.dart';

@JsonSerializable(createToJson: false)
class MethodVideo extends Equatable {
  final int id;
  @JsonKey(name: 'method_id')
  final int methodId;
  final String url;

  const MethodVideo({
    required this.id,
    required this.methodId,
    required this.url,
  });

  factory MethodVideo.fromJson(Map<String, dynamic> json) =>
      _$MethodVideoFromJson(json);

  @override
  List<Object?> get props => [id, methodId, url];
}
