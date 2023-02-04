import 'package:changer_color/providers/localization_provider.dart';
import 'package:changer_color/services/navigation_service.dart';
import 'package:changer_color/ui/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.microtask(() async {
      await context.read<LocalizationProvider>().init();
      await NavigationService().pushAndRemoveUntil(const HomePage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.white.withOpacity(0.3),
        size: MediaQuery.of(context).size.width * 0.3,
      ),
    );
  }
}
