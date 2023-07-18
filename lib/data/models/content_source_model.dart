import 'package:hyll_test/domain/domain.dart';

final class ContentSourceModel extends ContentSource {
  ContentSourceModel({
    super.id,
    super.title,
    super.author,
    super.name,
    super.icon,
    super.url,
    super.creator,
  });

  factory ContentSourceModel.fromJson(Map<String, dynamic> json) =>
      ContentSourceModel(
        id: json['id'] as String?,
        title: json['title'] as String?,
        author: json['title'] as String?,
        name: json['name'] as String?,
        icon: json['icon'] as String?,
        url: json['url'] as String?,
        creator: json['creator'] as String?,
      );
}
