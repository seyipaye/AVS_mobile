import 'package:avs/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingIndicator(
          radius: 40,
        ),
      ),
    );
  }
}
