import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DeepNeumorphicSlider extends StatelessWidget {
  final void Function(double)? onChanged;
  final double value;
  final Color? colorThumb;
  final Color? colorSlider;

  const DeepNeumorphicSlider({
    Key? key,
    this.onChanged,
    required this.value,
    this.colorThumb,
    this.colorSlider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicSlider(
      height: 30,
      value: value,
      style: SliderStyle(
        disableDepth: true,
        accent: colorThumb,
        lightSource: LightSource.bottom,
      ),
      min: -20,
      max: 20,
      onChanged: onChanged,
    );
  }
}
