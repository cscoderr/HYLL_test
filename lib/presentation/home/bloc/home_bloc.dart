import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hyll_test/domain/domain.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeCurrentContentIndexChanged>(_onCurrentContentIndexChanged);
    on<HomeCurrentContentChanged>(_onCurrentContentChanged);
    on<HomeVideoThumbNailUpdated>(_onVideoThumbNailUpdated);
  }

  void _onCurrentContentIndexChanged(
    HomeCurrentContentIndexChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(currentContentIndex: event.index));
  }

  void _onCurrentContentChanged(
    HomeCurrentContentChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(currentContent: event.content));
  }

  Future<void> _onVideoThumbNailUpdated(
    HomeVideoThumbNailUpdated event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(videoThumbnailStatus: HomeVideoThumnailStatus.loading));
    final thumbnailAsByte = await _getVideoThumbNail(event.videoUrl);
    emit(state.copyWith(
      videoThumbnail: thumbnailAsByte,
      videoThumbnailStatus: HomeVideoThumnailStatus.loaded,
    ));
  }

  Future<Uint8List> _getVideoThumbNail(String videoUrl) async {
    final fileName = await VideoThumbnail.thumbnailFile(
      video: videoUrl,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.PNG,
      maxHeight: 100,
      quality: 75,
    );
    final fileAsBytes = File(fileName!).readAsBytes();
    return fileAsBytes;
  }
}
