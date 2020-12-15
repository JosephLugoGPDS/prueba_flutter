import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:prueba_flutter/src/widgets/circle_times_linear_progress.dart';
import 'package:prueba_flutter/src/widgets/conector_times_linear_progress.dart';
import 'package:prueba_flutter/src/widgets/rich_text.dart';

import 'widget/button_nedd.dart';

class NeedScreen extends StatelessWidget {
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
            // ProgressTimeline(
            //   states: [
            //     SingleState(stateTitle: "check1"),
            //     SingleState(stateTitle: "check2"),
            //   ],
            //   checkedIcon: Icon(
            //     Icons.check_circle_outline,
            //   ),
            //   currentIcon: Icon(
            //     Icons.check,
            //   ),
            // ),
            Text(
              "Paso 1 de 2",
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
                  ConectorTimesLinearProgress(active: false),
                  CircleTimesLinearProgress(active: false),
                ],
              ),
            ),

            SvgPicture.asset(
              "assets/images/logo.svg",
            ),
            Text(
              "¡Como publicar tu necesidad",
              style: theme.accentTextTheme.headline6.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  CustomRichText(
                    textTitle: 'Que necesitas: ',
                    textContent:
                        'Ingresa título de lo que buscas corto pero descriptivo.',
                  ),
                  const SizedBox(height: 10),
                  CustomRichText(
                    textTitle: 'Categoría: ',
                    textContent:
                        'Elige la categoría donde aguien pueda encontrar tu necesidad.',
                  ),
                  const SizedBox(height: 10),
                  CustomRichText(
                    textTitle: 'Descripción: ',
                    textContent:
                        'Describe tu necesidad y porque estas buscando este producto, así las personas que lo tienen entenderán porque regatearlo.',
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            ButtonNeed(
              text: "Continuar",
              onTap: (){
                Navigator.of(context).pushNamed("/need2");
              },
            ),
          ],
        ),
      ),
    );
  }
}


