import 'package:flutter/material.dart';
import 'package:hyll_test/domain/domain.dart';
import 'package:hyll_test/presentation/presentation.dart';

class ContentSidebarListView extends StatelessWidget {
  const ContentSidebarListView({
    super.key,
    required this.contents,
    this.currentIndex = 0,
    this.onSelected,
  });

  final List<Content> contents;
  final int currentIndex;
  final Function(Content, int)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 40),
      itemBuilder: (context, index) {
        if (contents[index].contentType == 'IMAGE') {
          return ContentCard(
            content: contents[index],
            isActive: currentIndex == index,
            onTap: () => onSelected?.call(
              contents[index],
              index,
            ),
          );
        } else if (contents[index].contentType == 'VIDEO') {
          return ContentVideoThumbNail(
            content: contents[index],
            isActive: currentIndex == index,
            onTap: () => onSelected?.call(
              contents[index],
              index,
            ),
          );
        }
        return const SizedBox.shrink();
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: contents.length,
    );
  }
}
