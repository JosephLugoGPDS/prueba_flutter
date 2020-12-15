import 'package:flutter/material.dart';
import 'package:prueba_flutter/core/theme/theme.dart';
import 'package:prueba_flutter/src/screens/need/widget/text_field_or_area.dart';
import 'package:prueba_flutter/src/widgets/circle_times_linear_progress.dart';
import 'package:prueba_flutter/src/widgets/conector_times_linear_progress.dart';

import 'widget/button_nedd.dart';

class NeedNextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Yo necesito"),
          elevation: 0,
        ),
        body: Column(
            children: <Widget>[
              Text(
                "Paso 2 de 2",
                style: theme.accentTextTheme.headline6.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleTimesLinearProgress(active: true),
                    ConectorTimesLinearProgress(active: true),
                    ConectorTimesLinearProgress(active: true),
                    CircleTimesLinearProgress(active: true),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "¡Publica tu necesidad",
                style: theme.accentTextTheme.headline6.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "    Completa los campos como lo indica la pantalla anterior para publicar lo que necesitas",
                  style: theme.textTheme.subtitle1.copyWith(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              TextFieldOrArea(
                hintText: "Qué necesitas?",
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldOrArea(
                      hintText: "Producto",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: TestFlutterColors.blue,
                      child: Icon(
                        Icons.share,
                        color: TestFlutterColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              TextFieldOrArea(
                hintText: "Descripción de lo que necesitas?",
                textArea: true,
              ),
              Expanded(child: Container()),
              ButtonNeed(
              text: "Publicar",
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            ],
          ),
        ),
    );
  }
}
