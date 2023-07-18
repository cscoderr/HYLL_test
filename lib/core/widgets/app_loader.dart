import 'package:flutter/material.dart';

class AppLoader extends StatefulWidget {
  const AppLoader({super.key, this.onLoad});

  final VoidCallback? onLoad;

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onLoad?.call();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox.square(
        dimension: 20,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
