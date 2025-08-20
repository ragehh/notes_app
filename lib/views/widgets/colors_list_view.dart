import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int curreintIndex = 0;
  List<Color> colors = const [
    Color(0xff606c38),
    Color(0xff283618),
    Color(0xffdda15e),
    Color(0xffbc6c25),
    Color(0xff415a77),
    Color(0xff778da9),
    Color(0xffff8fab),
    Color(0xfffb6f92),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                curreintIndex = index;
                setState(() {});
              },
              child: ColorItem(
                isPicked: curreintIndex == index,
                color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isPicked, required this.color});

  final bool isPicked;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isPicked
        ? CircleAvatar(
            radius: 30,
            backgroundColor: kPrimaryColor,
            child: CircleAvatar(radius: 25, backgroundColor: color),
          )
        : CircleAvatar(radius: 30, backgroundColor: color);
  }
}
