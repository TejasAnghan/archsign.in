import 'package:flutter/material.dart';
import 'package:folio/constants.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
      height: height * 0.07,
      width: width,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Developed in 💙 with ",
            ),
            InkWell(
              onTap: () => openURL(
                  "https://flutter.dev/?gad_source=1&gclid=EAIaIQobChMIvJb74pHrhgMVqTQIBR2MawR9EAAYASAAEgLVXfD_BwE&gclsrc=aw.ds"),
              child: const Text(
                "Flutter",
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
