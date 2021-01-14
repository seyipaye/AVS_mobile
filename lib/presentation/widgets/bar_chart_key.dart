import 'package:flutter/material.dart';

class BarChartKey extends StatelessWidget {
  final List<KeyItem> keys;
  final Widget space = SizedBox(
    width: 10,
  );

  BarChartKey({@required this.keys});

  List<Widget> getList() {
    List<Widget> list = [];
    for (int i = 0; i < keys.length; i++) {
      list.add(keys[i]);
      i < (keys.length - 1) ? list.add(space) : Container();
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: getList(),
    );
  }
}

class KeyItem extends StatelessWidget {
  final Color color;
  final String title;

  const KeyItem({this.color, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
