import 'package:flutter/material.dart';
import 'package:hyll_test/domain/entities/entities.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class MainContentCard extends StatelessWidget {
  const MainContentCard({
    super.key,
    required this.adventure,
  });

  final Adventure adventure;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Iconsax.location,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  adventure.startingLocation!.name!,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            adventure.title!,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          ReadMoreText(
            adventure.primaryDescription!,
            trimLines: 2,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                ),
            lessStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                ),
            moreStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
