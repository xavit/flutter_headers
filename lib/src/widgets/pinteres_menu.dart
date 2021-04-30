import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: _PinterestMenuBackground(
        child: _MenuItems(items),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  _PinterestMenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
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
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent, //si o si añadir esto para iOS
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 35 : 25,
          color: (itemSeleccionado == index) ? Colors.black : Colors.blueGrey,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  int get itemSeleccionado => this._itemSeleccionado;
  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }
}
