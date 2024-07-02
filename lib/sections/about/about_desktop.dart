import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/constants.dart';
import 'package:folio/responsive/responsive.dart';
import 'package:folio/utils/about_utils.dart';

import 'package:folio/utils/utils.dart';
import 'package:folio/widget/custom_text_heading.dart';
import 'package:folio/widget/tech_widget.dart';

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: Space.h,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: '\nAbout us',
          ),
          // const CustomSectionSubHeading(
          //   text: 'Get to know me :)',
          // ),
          Space.y1!,
          // if (!Responsive.isDesktop(context))
          //   Image.asset(
          //     StaticUtils.logo,
          //     height: height * 0.27,
          //   ),
          if (!Responsive.isDesktop(context))
            SizedBox(
              height: height * 0.03,
            ),
          Row(
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  child: Image.asset(
                    StaticUtils.logo,
                    height: height * 0.7,
                  ),
                ),
              Expanded(
                flex: width < 1230 ? 2 : 1,
                child: Container(
                  padding: EdgeInsets.only(left: width < 1230 ? 25.0 : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Archsign (Interior & Architect)',
                        style: AppText.b1!.copyWith(
                          color: AppTheme.c!.primary,
                        ),
                      ),
                      Space.y1!,
                      Text(
                        AboutUtils.aboutMeHeadline,
                        style: AppText.b1b!.copyWith(
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Space.y!,
                      Text(
                        AboutUtils.aboutMeDetail,
                        style: AppText.b2!.copyWith(
                          height: 2,
                          letterSpacing: 1.1,
                          fontFamily: 'Montserrat',
                          fontSize: AppDimensions.normalize(6),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Space.y!,
                      // Divider(
                      //   color: Colors.grey[800],
                      //   thickness: AppDimensions.normalize(0.5),
                      // ),
                      // Space.y!,
                      // Text(
                      //   'Technologies I have worked with:',
                      //   style: AppText.l1!.copyWith(
                      //     color: AppTheme.c!.primary,
                      //   ),
                      // ),
                      // Space.y!,
                      // Wrap(
                      //   crossAxisAlignment: WrapCrossAlignment.start,
                      //   alignment: WrapAlignment.spaceAround,
                      //   children: kTools
                      //       .map((e) => ToolTechWidget(
                      //             techName: e,
                      //           ))
                      //       .toList(),
                      // ),
                      // Space.y!,
                      Divider(
                        color: Colors.grey[800],
                        thickness: AppDimensions.normalize(0.5),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: width < 1230 ? width * 0.05 : width * 0.1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
