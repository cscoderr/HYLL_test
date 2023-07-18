import 'package:equatable/equatable.dart';
import 'package:hyll_test/domain/domain.dart';

class Content extends Equatable {
  const Content({
    this.id,
    this.contentType,
    this.contentMode,
    this.contentUrl,
    this.contentSource,
    this.isHeaderForThePlan,
    this.isPrivate,
  });

  final String? id;
  final String? contentType;
  final String? contentMode;
  final String? contentUrl;
  final ContentSource? contentSource;
  final bool? isHeaderForThePlan;
  final bool? isPrivate;

  @override
  List<Object?> get props => [
        id,
        contentType,
        contentMode,
        contentUrl,
        contentSource,
        isHeaderForThePlan,
        isPrivate,
      ];
}
