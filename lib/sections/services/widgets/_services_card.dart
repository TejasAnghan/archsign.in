part of '../services.dart';

class _ServiceCard extends StatefulWidget {
  final String serviceTitle;
  final int index;

  const _ServiceCard({Key? key, required this.serviceTitle, this.index = 0})
      : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        // cardKey.currentState!.toggleCard();
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
        width: AppDimensions.normalize(200),
        // height: AppDimensions.normalize(20),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: appProvider.isDark ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isHover
              ? [
                  BoxShadow(
                    color: AppTheme.c!.primary!.withAlpha(30),
                    blurRadius: 12.0,
                    offset: const Offset(0.0, 0.0),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withAlpha(30),
                    blurRadius: 12.0,
                    offset: const Offset(0.0, 0.0),
                  )
                ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "${widget.index.toString().padLeft(2, "0")}    ",
                  textAlign: TextAlign.center,
                  style: AppText.h3b!.copyWith(
                      fontSize: AppDimensions.normalize(6),
                      // height: 2,
                      color: Colors.redAccent),
                ),
                Expanded(
                  child: Text(
                    widget.serviceTitle,
                    textAlign: TextAlign.center,
                    style: AppText.h3!.copyWith(
                      fontSize: AppDimensions.normalize(6),
                      // height: 2,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
