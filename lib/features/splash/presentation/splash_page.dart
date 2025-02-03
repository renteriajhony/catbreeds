import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:async';

import '../../cats/presentation/pages/cat_list_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    _loadResourcesAndNavigate();
  }

  Future<void> _loadResourcesAndNavigate() async {
    _opacity = 1.0;
    await Future.delayed(Duration(milliseconds: 1500));
    if (mounted) {
      await dotenv.load(fileName: 'assets/.env');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => CatListPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 1000),
          opacity: _opacity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
              Text(
                "catbreeds",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              SizedBox(height: 250),
              Image.asset(
                'assets/images/cat-lame.gif',
                width: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
