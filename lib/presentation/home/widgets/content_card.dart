import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hyll_test/domain/domain.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    super.key,
    required this.content,
    this.isActive = false,
    this.onTap,
    this.videoThumbnail,
  });

  final Content content;
  final bool isActive;
  final VoidCallback? onTap;
  final Uint8List? videoThumbnail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: isActive
              ? Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 3,
                )
              : const Border(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: videoThumbnail != null
              ? Stack(
                  children: [
                    Positioned.fill(
                      child: Image.memory(
                        videoThumbnail!,
                        gaplessPlayback: true,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Icon(
                        Iconsax.play_circle,
                        size: 25,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              : CachedNetworkImage(
                  imageUrl: content.contentUrl!,
                  fit: BoxFit.cover,
                  errorWidget: (context, _, __) => Shimmer.fromColors(
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
                  ),
                  progressIndicatorBuilder: (context, _, __) =>
                      Shimmer.fromColors(
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
                  ),
                ),
        ),
      ),
    );
  }
}
