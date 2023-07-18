part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class HomeCurrentContentChanged extends HomeEvent {
  const HomeCurrentContentChanged(this.content);

  final Content content;

  @override
  List<Object> get props => [content];
}

final class HomeCurrentContentIndexChanged extends HomeEvent {
  const HomeCurrentContentIndexChanged(this.index);

  final int index;
  @override
  List<Object> get props => [index];
}

final class HomeVideoThumbNailUpdated extends HomeEvent {
  const HomeVideoThumbNailUpdated(this.videoUrl);

  final String videoUrl;

  @override
  List<Object> get props => [videoUrl];
}
