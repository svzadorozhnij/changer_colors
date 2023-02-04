import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ToggleShape extends StatelessWidget {
  final int activeIndex;
  final void Function(int)? onChanged;
  final Color? colorThumb;
  final Color colorItems;

  ToggleShape({
    Key? key,
    required this.activeIndex,
    this.onChanged,
    this.colorThumb,
    required this.colorItems,
  }) : super(key: key);

  final List<IconData> items = [
    Icons.circle_outlined,
    Icons.rectangle_outlined
  ];

  @override
  Widget build(BuildContext context) {
    return NeumorphicToggle(
      style: NeumorphicToggleStyle(backgroundColor: colorThumb),
      selectedIndex: activeIndex,
      onChanged: onChanged,
      thumb: items
          .map(
            (item) => Container(
              color: colorThumb,
              alignment: Alignment.center,
              child: Icon(item, color: colorItems, size: 30),
            ),
          )
          .toList()[activeIndex],
      children: items
          .map(
            (item) => ToggleElement(
              background: Center(
                child: Icon(item, color: colorItems, size: 30),
              ),
            ),
          )
          .toList(),
    );
  }
}
