import 'package:flutter/material.dart';
import 'package:hyll_test/presentation/home/home.dart';
import 'package:shimmer/shimmer.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 2000),
      () => Navigator.of(context).pushReplacement(HomePage.route()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Theme.of(context).primaryColor,
          child: Text(
            'HYLL',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
          ),
        ),
      ),
    );
  }
}
