import 'package:hyll_test/data/data.dart';

final class AdventureResponse {
  const AdventureResponse({
    this.adventures,
    this.count,
  });

  factory AdventureResponse.fromJson(Map<String, dynamic> json) =>
      AdventureResponse(
        adventures: (json['data'] as List<dynamic>?)
            ?.map((e) => AdventureModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        count: json['count'] as int?,
      );

  AdventureResponse copyWith({
    List<AdventureModel>? adventures,
    int? count,
  }) {
    return AdventureResponse(
      adventures: adventures ?? this.adventures,
      count: count ?? this.count,
    );
  }

  final List<AdventureModel>? adventures;
  final int? count;
}
