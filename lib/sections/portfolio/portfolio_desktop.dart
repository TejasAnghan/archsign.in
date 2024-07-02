
import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/sections/portfolio/project_detail.dart';
import 'package:folio/utils/project_utils.dart';
import 'package:folio/widget/custom_text_heading.dart';
import 'package:folio/widget/project_card.dart';

class PortfolioDesktop extends StatefulWidget {
  const PortfolioDesktop({Key? key}) : super(key: key);

  @override
  State<PortfolioDesktop> createState() => _PortfolioDesktopState();
}

class _PortfolioDesktopState extends State<PortfolioDesktop> {
  int? selectedIndex;
  onTap(int i) {
    setState(() {
      if (selectedIndex == i) {
        selectedIndex = null;
      } else {
        selectedIndex = i;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.h!,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: "\nPortfolio",
          ),
          const CustomSectionSubHeading(
            text: "Here are few samples of my previous work :)\n\n",
          ),
          if (selectedIndex != null &&
              ProjectUtils.imageLinks[selectedIndex!].isNotEmpty)
            ProjectDetail(
              index: selectedIndex!,
              onBackPressed: () {
                setState(() {
                  selectedIndex = null;
                });
              },
            ),
          // if (selectedIndex == null)
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: AppDimensions.normalize(10),
            children: ProjectUtils.titles
                .asMap()
                .entries
                .map(
                  (e) => ProjectCard(
                    index: e.key,
                    banner: ProjectUtils.imageLinks[e.key][0],
                    projectIcon: ProjectUtils.icons[e.key],
                    projectLink: "",
                    projectTitle: ProjectUtils.titles[e.key],
                    projectDescription: ProjectUtils.headline[e.key],
                    onTap: onTap,
                  ),
                )
                .toList(),
          ),
          // Space.y2!,
          // SizedBox(
          //   height: AppDimensions.normalize(14),
          //   width: AppDimensions.normalize(50),
          //   child: OutlinedButton(
          //     onPressed: () => openURL(StaticUtils.gitHub),
          //     child: Text(
          //       'See More',
          //       style: AppText.l1b,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
