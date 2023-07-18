part of 'home_bloc.dart';

enum HomeVideoThumnailStatus { loading, loaded, failure }

class HomeState extends Equatable {
  const HomeState({
    this.currentContentIndex = 0,
    this.currentContent,
    this.videoThumbnail,
    this.videoThumbnailStatus = HomeVideoThumnailStatus.loading,
  });

  HomeState copyWith(
      {int? currentContentIndex,
      Content? currentContent,
      Uint8List? videoThumbnail,
      HomeVideoThumnailStatus? videoThumbnailStatus}) {
    return HomeState(
      currentContentIndex: currentContentIndex ?? this.currentContentIndex,
      currentContent: currentContent ?? this.currentContent,
      videoThumbnail: videoThumbnail ?? this.videoThumbnail,
      videoThumbnailStatus: videoThumbnailStatus ?? this.videoThumbnailStatus,
    );
  }

  final int currentContentIndex;
  final Content? currentContent;
  final Uint8List? videoThumbnail;
  final HomeVideoThumnailStatus videoThumbnailStatus;

  @override
  List<Object?> get props => [
        currentContentIndex,
        currentContent,
        videoThumbnail,
        videoThumbnailStatus
      ];
}
