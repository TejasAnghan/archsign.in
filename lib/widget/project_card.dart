import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';

import 'package:folio/provider/app_provider.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProjectCard extends StatefulWidget {
  final String? banner;
  final String? projectLink;
  final String? projectIcon;
  final String projectTitle;
  final String projectDescription;
  final IconData? projectIconData;
  final int index;
  void Function(int)? onTap;

  ProjectCard({
    Key? key,
    this.index = 1,
    this.banner,
    this.onTap,
    this.projectIcon,
    this.projectLink,
    this.projectIconData,
    required this.projectTitle,
    required this.projectDescription,
  }) : super(key: key);
  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        if (widget.onTap != null) widget.onTap!(widget.index);
      },
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            isHover = true;
          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: Container(
        margin: Space.h,
        padding: Space.all(),
        width: AppDimensions.normalize(150),
        height: AppDimensions.normalize(90),
        decoration: BoxDecoration(
          color: appProvider.isDark ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: isHover
              ? [
                  BoxShadow(
                    color: AppTheme.c!.primary!.withAlpha(100),
                    blurRadius: 12.0,
                    offset: const Offset(0.0, 0.0),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    blurRadius: 12.0,
                    offset: const Offset(0.0, 0.0),
                  )
                ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.projectIcon != null
                    ? (width > 1135 || width < 950)
                        ? Image.asset(
                            widget.projectIcon!,
                            height: height * 0.05,
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                widget.projectIcon!,
                                height: height * 0.03,
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Text(
                                widget.projectTitle,
                                style: AppText.b2b,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                    : Container(),
                widget.projectIconData != null
                    ? Icon(
                        widget.projectIconData,
                        color: AppTheme.c!.primary!,
                        size: height * 0.1,
                      )
                    : Container(),
                (width > 1135 || width < 950)
                    ? SizedBox(
                        height: height * 0.02,
                      )
                    : const SizedBox(),
                (width > 1135 || width < 950)
                    ? Text(
                        widget.projectTitle,
                        style: AppText.b2b,
                        textAlign: TextAlign.center,
                      )
                    : Container(),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  widget.projectDescription,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
              ],
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: isHover ? 0.0 : 1.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: widget.banner != null
                      ? Image.network(
                          widget.banner!,

                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            }
                          },
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            print(stackTrace.toString());
                            return const Text('Failed to load image');
                          },
                          // fit: BoxFit.contain,
                        )
                      : Container(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
