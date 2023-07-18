import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyll_test/core/core.dart';
import 'package:hyll_test/data/data.dart';
import 'package:hyll_test/presentation/presentation.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAdventureCubit, GetAdventureState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == AppStatus.success) {
          final adventures = state.data?.adventures ?? [];
          if (adventures.isEmpty) return;
          context
              .read<HomeBloc>()
              .add(HomeCurrentContentChanged(adventures.first.contents!.first));
        }
      },
      builder: (context, state) {
        if (state.status == AppStatus.success) {
          final adventures = state.data?.adventures ?? [];

          if (adventures.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("No feed available"),
                ],
              ),
            );
          }

          return HomePageViewContent(data: state.data);
        }
        return const AppLoader();
      },
    );
  }
}

class HomePageViewContent extends StatelessWidget {
  const HomePageViewContent({
    super.key,
    required this.data,
  });

  final AdventureResponse? data;

  @override
  Widget build(BuildContext context) {
    final getAdventurestate = context.watch<GetAdventureCubit>().state;
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.currentContentIndex != current.currentContentIndex ||
          previous.currentContent != current.currentContent,
      builder: (context, state) {
        final adventures = data?.adventures ?? [];
        return PageView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            if (index == adventures.length) {
              if (getAdventurestate.status == AppStatus.failure) {
                return Center(child: Text(getAdventurestate.errorMessage));
              }
              if (!getAdventurestate.hasReachedMax) {
                final page =
                    (adventures.length ~/ AppConstants.appFeedLimit) + 1;
                final offset = page * AppConstants.appFeedLimit;
                log(offset.toString());
                return AppLoader(
                  onLoad: () => context
                      .read<GetAdventureCubit>()
                      .getAdventures(offset: offset),
                );
              }
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('No more feed available'),
                    TextButton(
                      onPressed: () {
                        context
                            .read<GetAdventureCubit>()
                            .getAdventures(isRefresh: true);
                      },
                      child: const Text('Refresh'),
                    ),
                  ],
                ),
              );
            }

            final contents = adventures[index].contents ?? [];

            return Stack(
              children: [
                if (contents[state.currentContentIndex].contentType == 'VIDEO')
                  Positioned.fill(
                    child: AppVideoPlayer(
                      videoUrl: state.currentContent!.contentUrl!,
                    ),
                  )
                else
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl: contents[state.currentContentIndex].contentUrl!,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                Positioned.fill(
                  top: MediaQuery.sizeOf(context).height * 0.4,
                  bottom: 0,
                  right: 10,
                  left: MediaQuery.sizeOf(context).width * 0.78,
                  child: Center(
                    child: ShaderMask(
                      shaderCallback: (rect) => const LinearGradient(
                        colors: [Colors.transparent, Colors.black],
                        stops: [0.0, 0.15],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(rect),
                      blendMode: BlendMode.dstIn,
                      child: ContentSidebarListView(
                        contents: contents,
                        currentIndex: state.currentContentIndex,
                        onSelected: (data, index) {
                          context.read<HomeBloc>()
                            ..add(HomeCurrentContentIndexChanged(index))
                            ..add(HomeCurrentContentChanged(data));
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  right: 90,
                  left: 10,
                  child: MainContentCard(
                    adventure: adventures[index],
                  ),
                ),
              ],
            );
          },
          onPageChanged: (index) {
            context
                .read<HomeBloc>()
                .add(const HomeCurrentContentIndexChanged(0));
            if (index == adventures.length) return;
            context.read<HomeBloc>().add(
                HomeCurrentContentChanged(adventures[index].contents!.first));
          },
          itemCount: (adventures.length + 1),
        );
      },
    );
  }
}
