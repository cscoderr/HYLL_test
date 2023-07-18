import 'package:hyll_test/domain/domain.dart';

final class LocationModel extends Location {
  LocationModel({
    super.name,
    super.subtitle,
    super.distance,
    super.imageUrl,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        name: json['name'] as String?,
        subtitle: json['subtitle'] as String?,
        distance: json['distance'] as dynamic,
        imageUrl: json['image_url'] as String?,
      );
}
