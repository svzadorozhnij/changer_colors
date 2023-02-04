import 'package:changer_color/providers/colors_provider.dart';
import 'package:changer_color/ui/home_page/widgets/deep_neumorphic_slider.dart';
import 'package:changer_color/ui/home_page/widgets/togle_shape.dart';
import 'package:changer_color/utils/l10n.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorsProvider>(
      builder: (_, ColorsProvider colorsProvider, __) {
        return GestureDetector(
          onTap: colorsProvider.getNewColors,
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              systemNavigationBarColor: colorsProvider.backgroundColor,
              statusBarColor: colorsProvider.backgroundColor,
            ),
            child: Scaffold(
              backgroundColor: colorsProvider.backgroundColor,
              body: _body(context: context, colorsProvider: colorsProvider),
            ),
          ),
        );
      },
    );
  }

  Widget _body({
    required BuildContext context,
    required ColorsProvider colorsProvider,
  }) {
    return Container(
      padding: const EdgeInsets.all(30),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ToggleShape(
            activeIndex: colorsProvider.indexShape,
            onChanged: colorsProvider.changeShape,
            colorThumb: colorsProvider.backgroundColor,
            colorItems: colorsProvider.textColor,
          ),
          _textContainer(context, colorsProvider),
          DeepNeumorphicSlider(
            onChanged: colorsProvider.changeDeepText,
            colorThumb: colorsProvider.textColor,
            value: colorsProvider.deepNeumorphicText,
          ),
        ],
      ),
    );
  }

  Widget _textContainer(BuildContext context, ColorsProvider colorsProvider) {
    return Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: [
          const NeumorphicBoxShape.circle(),
          NeumorphicBoxShape.roundRect(
            BorderRadius.circular(15),
          )
        ][colorsProvider.indexShape],
        shadowDarkColor: colorsProvider.textColor,
        shadowLightColor: colorsProvider.textColor,
        depth: colorsProvider.deepNeumorphicText,
        lightSource: LightSource.topLeft,
        color: colorsProvider.backgroundColor,
      ),
      padding: const EdgeInsets.all(80),
      child: Text(
        l10n(context).heyThere,
        textAlign: TextAlign.center,
        textScaleFactor: 1,
        style: TextStyle(color: colorsProvider.textColor, fontSize: 34),
      ),
    );
  }
}
