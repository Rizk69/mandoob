import 'package:flutter/material.dart';
import 'package:mandoob/features/trafiic_lines/presentation/traffic_lines/widget/event_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTitle extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  const MyTimeLineTitle(
      {required this.isFirst, required this.isLast, required this.isPast});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle:
          LineStyle(color: isPast ? const Color(0XFF020736) : const Color(0XFFD9D9D9)),
      indicatorStyle: IndicatorStyle(
          width: 40,
          color: isPast ? const Color(0XFF020736) : const Color(0XFFD9D9D9),
          iconStyle: IconStyle(
              iconData: Icons.done,
              color: isPast ? Colors.white : const Color(0XFFD9D9D9))),
      endChild:
          EventCard(isPast: isPast, address: 'جيزة', traderName: 'تاجر محمد '),
    );
  }
}
