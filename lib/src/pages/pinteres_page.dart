import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:headers/src/widgets/pinteres_menu.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        // body: PinteresMenu(),
        // body: PinteresGrid(),
        body: Stack(
          children: [
            PinteresGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    return Positioned(
      child: Container(
        width: size.width,
        child: Align(
          child: PinteresMenu(
            mostrar: mostrar,
            // backgroundColor: Colors.red,
            // activeColor: Colors.green,
            // inactiveColor: Colors.yellow,
            items: [
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
            ],
          ),
        ),
      ),
      bottom: 30,
    );
  }
}

class PinteresGrid extends StatefulWidget {
  @override
  _PinteresGridState createState() => _PinteresGridState();
}

class _PinteresGridState extends State<PinteresGrid> {
  final List<int> items = List.generate(200, (i) => i);

  ScrollController controller = new ScrollController();
  double scroollAnterior = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      // print('Scroll-Listener ${controller.offset}');
      if (controller.offset > scroollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }

      scroollAnterior = controller.offset;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinteresItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinteresItem extends StatelessWidget {
  final int index;

  _PinteresItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
      // color: Colors.blue,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar(bool valor) {
    this._mostrar = valor;
    notifyListeners();
  }
}
