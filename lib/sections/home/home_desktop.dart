import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:folio/animations/entrance_fader.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/sections/home/home.dart';

import 'package:folio/utils/utils.dart';
import 'package:folio/widget/social_links.dart';

// ignore: must_be_immutable
class HomeDesktop extends StatelessWidget {
  HomeDesktop({Key? key, required this.type}) : super(key: key);

  device type;

  double _getContainerHeight() {
    return type == device.isDesktop ? 0.95 : 0.9;
  }

  _getFadedImage(Size size) {
    return type == device.isMobile
        ? Opacity(
            opacity: 0.9,
            child: Image.asset(
              StaticUtils.logoArchitect,
              height: AppDimensions.normalize(150),
            ),
          )
        : Opacity(
            opacity: 1,
            child: EntranceFader(
              offset: const Offset(0, 0),
              delay: const Duration(seconds: 1),
              duration: const Duration(milliseconds: 800),
              child: Image.asset(
                StaticUtils.logoArchitect,
                height: size.width < 1200
                    ? size.height * (type == device.isDesktop ? 0.8 : 0.75)
                    : size.height * 1,
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * _getContainerHeight(),
      padding: type == device.isDesktop ? Space.h : const EdgeInsets.all(0),
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              right: type == device.isMobile ? -AppDimensions.normalize(0) : 0,
              child: _getFadedImage(size)),
          Container(
            margin: EdgeInsets.fromLTRB(
              AppDimensions.normalize(type == device.isMobile ? 10 : 30),
              AppDimensions.normalize(type == device.isMobile
                  ? 30
                  : type == device.istablate
                      ? 50
                      : 80),
              0,
              0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      type == device.isMobile
                          ? 'HEY THERE! '
                          : 'WE BUILD THE FUTURE! ',
                      style: AppText.b1!.copyWith(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    type == device.isMobile
                        ? Row(
                            children: [
                              Space.x!,
                              Image.asset(
                                StaticUtils.hi,
                                height: AppDimensions.normalize(10),
                              )
                            ],
                          )
                        : EntranceFader(
                            offset: const Offset(0, 0),
                            delay: const Duration(seconds: 2),
                            duration: const Duration(milliseconds: 800),
                            child: Image.asset(
                              StaticUtils.hi,
                              height: AppDimensions.normalize(12),
                            ),
                          ),
                  ],
                ),
                Space.y1!,
                Text(
                  "Our passion is",
                  style: AppText.h1b!.copyWith(
                    fontSize: AppDimensions.normalize(15),
                    height: 2,
                  ),
                ),
                Text(
                  "to draw structures",
                  style: AppText.h1b!.copyWith(
                    fontSize: AppDimensions.normalize(15),
                    height: 1,
                  ),
                ),
                SizedBox(
                  height: AppDimensions.normalize(10),
                ),
                EntranceFader(
                  offset: const Offset(-10, 0),
                  delay: const Duration(seconds: 1),
                  duration: const Duration(milliseconds: 800),
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: AppTheme.c!.primary!,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            ' We take your projects seriously.',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1,
                          ),
                          TyperAnimatedText(
                            ' We put smile on people face :)',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1,
                          ),
                          TyperAnimatedText(
                            ' We are the best for your project.',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1,
                          ),
                        ],
                        isRepeatingAnimation: true,
                      ),
                    ],
                  ),
                ),
                type == device.isMobile ? Space.y! : Space.y2!,
                const SocialLinks(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
