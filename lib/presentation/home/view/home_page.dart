import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyll_test/domain/domain.dart';
import 'package:hyll_test/presentation/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static PageRoute route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetAdventureCubit(
            getAdventureUsecase: context.read<GetAdventureUsecase>(),
          )..getAdventures(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ],
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: HomePageView(),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              padding: const EdgeInsets.only(
                top: kToolbarHeight - 20,
                left: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              alignment: Alignment.centerLeft,
              child: _buildHomeTitlebar(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeTitlebar(BuildContext context) {
    return Text(
      'HYLL',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
    );
  }
}
