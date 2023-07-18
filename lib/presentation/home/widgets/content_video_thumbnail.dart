import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyll_test/domain/domain.dart';
import 'package:hyll_test/presentation/presentation.dart';
import 'package:shimmer/shimmer.dart';

class ContentVideoThumbNail extends StatefulWidget {
  const ContentVideoThumbNail({
    super.key,
    required this.content,
    this.isActive = false,
    this.onTap,
  });

  final Content content;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  State<ContentVideoThumbNail> createState() => _ContentVideoThumbNailState();
}

class _ContentVideoThumbNailState extends State<ContentVideoThumbNail> {
  @override
  void initState() {
    super.initState();

    context
        .read<HomeBloc>()
        .add(HomeVideoThumbNailUpdated(widget.content.contentUrl!));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.videoThumbnailStatus != current.videoThumbnailStatus,
      builder: (context, state) {
        if (state.videoThumbnailStatus == HomeVideoThumnailStatus.loaded) {
          return ContentCard(
            content: state.currentContent!,
            isActive: widget.isActive,
            onTap: widget.onTap,
            videoThumbnail: state.videoThumbnail,
          );
        }
        return Shimmer.fromColors(
          baseColor: Colors.black12,
          highlightColor: Colors.white,
          child: Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      },
    );
  }
}
