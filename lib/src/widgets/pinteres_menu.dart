import 'package:flutter/material.dart';

class PinteresButton {
  final Function onPressed;
  final IconData icon;

  PinteresButton({
    @required this.onPressed,
    @required this.icon,
  });
}

class PinteresMenu extends StatelessWidget {
  final List<PinteresButton> items = [
    PinteresButton(
        onPressed: () {
          print('Icon pie_chart');
        },
        icon: Icons.pie_chart),
    PinteresButton(
        onPressed: () {
          print('Icon search');
        },
        icon: Icons.search),
    PinteresButton(
        onPressed: () {
          print('Icon notifications');
        },
        icon: Icons.notifications),
    PinteresButton(
        onPressed: () {
          print('Icon supervised_user_circle');
        },
        icon: Icons.supervised_user_circle),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: _MenuItems(items),
        width: 250,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                spreadRadius: -5,
              ),
            ]),
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinteresButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        menuItems.length,
        (i) => _PinteresMenuButton(
          index: i,
          item: menuItems[i],
        ),
      ),
    );
  }
}

class _PinteresMenuButton extends StatelessWidget {
  final int index;
  final PinteresButton item;

  _PinteresMenuButton({this.index, this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        item.icon,
      ),
    );
  }
}
