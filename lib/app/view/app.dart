import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyll_test/domain/domain.dart';
import 'package:hyll_test/presentation/presentation.dart';

class HyllApp extends StatelessWidget {
  const HyllApp({
    super.key,
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HomeRepository>.value(value: homeRepository),
        RepositoryProvider<GetAdventureUsecase>(
          create: (context) => GetAdventureUsecase(homeRepository),
        ),
      ],
      child: const _App(),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HYLL Test',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        scheme: FlexScheme.deepPurple,
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.deepPurple,
        appBarElevation: 2,
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      themeMode: ThemeMode.dark,
      home: const LandingPage(),
    );
  }
}
