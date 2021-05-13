import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/widgets/boton_gordo.dart';
import 'package:headers/src/widgets/headers.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: PageHeader(),
      // backgroundColor: Colors.redAccent,
      body: Center(
        child: BotonGordoPage(),
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitulo: "Haz Solicigtado",
      titulo: "Asistencia Médica",
      color1: Color(0xff526bf6),
      color2: Color(0xff67ACF2),
    );
  }
}
