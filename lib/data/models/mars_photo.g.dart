// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mars_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarsPhoto _$MarsPhotoFromJson(Map<String, dynamic> json) => MarsPhoto(
      id: json['id'] as int,
      sol: json['sol'] as int,
      camera: Camera.fromJson(json['camera'] as Map<String, dynamic>),
      imgSrc: json['img_src'] as String,
      earthDate: json['earth_date'] as String,
    );

Camera _$CameraFromJson(Map<String, dynamic> json) => Camera(
      id: json['id'] as int,
      name: json['name'] as String,
      fullName: json['full_name'] as String,
    );
