import 'package:hyll_test/domain/domain.dart';

final class GridInfoModel extends GridInfo {
  const GridInfoModel({
    super.name,
    super.value,
    super.iconUrl,
    super.schema,
  });

  factory GridInfoModel.fromJson(Map<String, dynamic> json) => GridInfoModel(
        name: json['name'] as String?,
        value: json['value'] as String?,
        iconUrl: json['icon_url'] as String?,
        schema: json['schema'] as String?,
      );
}
