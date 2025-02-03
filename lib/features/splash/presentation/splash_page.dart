import 'package:catbreeds/core/utils/tokens/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:async';

import '../../../generated/l10n.dart';
import '../../cats/presentation/pages/cat_list_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    _loadResourcesAndNavigate();
  }

  Future<void> _loadResourcesAndNavigate() async {
    _opacity = DimensionsOpacity.one;
    await Future.delayed(
        Duration(milliseconds: DimensionsInt.oneThousandFiveHundred));
    if (mounted) {
      await dotenv.load(fileName: 'assets/.env');
      if (context.mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => CatListPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(milliseconds: DimensionsInt.thousand),
          opacity: _opacity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: DimensionsDouble.twoHundred),
              Text(
                localizations?.appName ?? '',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              SizedBox(height: DimensionsDouble.twoHundredFifty),
              Image.asset(
                'assets/images/cat-lame.gif',
                width: DimensionsDouble.oneHundredFifty,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
