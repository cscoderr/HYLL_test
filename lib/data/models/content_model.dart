import 'package:hyll_test/data/data.dart';
import 'package:hyll_test/domain/domain.dart';

final class ContentModel extends Content {
  const ContentModel({
    super.id,
    super.contentType,
    super.contentMode,
    super.contentUrl,
    super.contentSource,
    super.isHeaderForThePlan,
    super.isPrivate,
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
        id: json['id'] as String?,
        contentType: json['content_type'] as String?,
        contentMode: json['content_mode'] as String?,
        contentUrl: json['content_url'] as String?,
        contentSource: json['content_source'] == null
            ? null
            : ContentSourceModel.fromJson(
                json['content_source'] as Map<String, dynamic>),
        isHeaderForThePlan: json['is_header_for_the_plan'] as bool?,
        isPrivate: json['is_private'] as bool?,
      );
}
