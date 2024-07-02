import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:folio/animations/entrance_fader.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/responsive/responsive.dart';
import 'package:folio/utils/project_utils.dart';
import 'package:folio/utils/utils.dart';

import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ProjectDetail extends StatefulWidget {
  final int index;
  void Function() onBackPressed;
  ProjectDetail({Key? key, required this.index, required this.onBackPressed})
      : super(key: key);

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  final CarouselController _controller = CarouselController();
  // ignore: unused_field
  int _currentIndex = 0;

  Widget getButton(
      {String? text, required IconData icon, required void Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EntranceFader(
          offset: const Offset(0, -10),
          delay: const Duration(milliseconds: 100),
          duration: const Duration(milliseconds: 250),
          child: MaterialButton(
            padding: Space.z!,
            hoverColor: AppTheme.c!.primary!.withAlpha(150),
            shape: Responsive.isDesktop(context)
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(
                      color: AppTheme.c!.primary!,
                    ),
                  )
                : null,
            onPressed: onTap,
            child: Padding(
              padding: Space.all(1.25, 0.45),
              child: Row(children: [
                Icon(icon),
                if (text != null) Space.x1!,
                if (text != null)
                  Text(
                    text,
                    style: AppText.l1b,
                  ),
              ]),
            ),
          ),
        ),
      ],
    );
  }

  Widget getSlider(double height, bool isDesktop) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: ProjectUtils.imageLinks[widget.index].length,
          itemBuilder: (BuildContext context, int itemIndex, int i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Image.network(
                ProjectUtils.imageLinks[widget.index][itemIndex],
                height: height * 0.9, loadingBuilder: (BuildContext context,
                    Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              }
            }, errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
              return Text('Failed to load image');
            }),
          ),
          options: CarouselOptions(
            height: height * (isDesktop ? 0.9 : 0.6),
            autoPlay: true,
            initialPage: 1,
            autoPlayInterval: const Duration(seconds: 5),
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          left: 10,
          top: 0,
          bottom: 0,
          child: getButton(
              icon: Icons.arrow_back_ios_rounded,
              onTap: () {
                setState(() {
                  _controller.previousPage();
                });
              }),
        ),
        Positioned(
          right: 10,
          top: 0,
          bottom: 0,
          child: getButton(
              icon: Icons.arrow_forward_ios_rounded,
              onTap: () {
                setState(() {
                  _controller.nextPage();
                });
              }),
        ),
      ],
    );
  }

  Widget getStoreButton() {
    String playUrl = ProjectUtils.appLinks[widget.index].first;
    String appyUrl = ProjectUtils.appLinks[widget.index][1];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (playUrl.isNotEmpty) ...[
          InkWell(
            onTap: () async {
              if (!await launchUrl(Uri.parse(playUrl))) {
                throw Exception('Could not launch $playUrl');
              }
            },
            child: Image.asset(
              StaticUtils.playstore,
              height: AppDimensions.normalize(20),
            ),
          ),
          Space.x1!
        ],
        if (ProjectUtils.appLinks[widget.index][1].isNotEmpty)
          InkWell(
            onTap: () async {
              if (!await launchUrl(Uri.parse(appyUrl))) {
                throw Exception('Could not launch $appyUrl');
              }
            },
            child: Image.asset(
              StaticUtils.appstore,
              height: AppDimensions.normalize(14),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: Space.h,
      child: Column(
        children: [
          Space.y1!,
          if (!Responsive.isDesktop(context)) ...[
            getSlider(height, Responsive.isDesktop(context)),
          ],
          if (!Responsive.isDesktop(context))
            SizedBox(
              height: height * 0.03,
            ),
          Row(
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  child: Column(children: [
                    getSlider(height, Responsive.isDesktop(context)),
                    Space.y1!,
                    getStoreButton(),
                  ]),
                ),
            ],
          ),
          Space.y2!,
        ],
      ),
    );
  }
}
