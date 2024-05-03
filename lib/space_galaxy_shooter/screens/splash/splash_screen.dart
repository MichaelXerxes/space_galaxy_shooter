import 'package:flutter/material.dart';
import 'package:space_galaxy_shooter/space_galaxy_shooter/game_utils/game_config/game_configuration.dart';
import 'package:space_galaxy_shooter/space_galaxy_shooter/screens/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoginViewVisible = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoginViewVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        // extended used to create custom Floating Action Button
        Container(
          width: Config.gameScreenSize,
          height: Config.gameScreenSize,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/splash.png"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              const SizedBox(
                height: 500.0,
              ),
              if (isLoginViewVisible)
                FloatingActionButton.extended(
                  onPressed: () => _navigateToPlayGame(context),
                  label: Container(
                    alignment: Alignment.center,
                    height: 300.0,
                    width: 300.0,
                    child: const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0)),
                  elevation: 10.0,
                ),
            ],
          ),
        )
      ],
    ));
  }

  void _navigateToPlayGame(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
