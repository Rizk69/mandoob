import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/trafiic_lines/presentation/cubit/trafficlines_cubit.dart';
import 'package:mandoob/features/trafiic_lines/presentation/traffic_lines/widget/event_card.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTitle extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final int traderId;
  final String traderName;
  final String address;
  TrafficLinesCubit cubit;
   MyTimeLineTitle({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.traderName,
    required this.traderId,
    required this.address,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TimelineTile(
          isFirst: isFirst,
          isLast: isLast,
          beforeLineStyle: LineStyle(color: isPast ? const Color(0XFF020736) : const Color(0XFFD9D9D9)),
          indicatorStyle: IndicatorStyle(
            width: 40,
            color: isPast ? const Color(0XFF020736) : const Color(0XFFD9D9D9),
            iconStyle: IconStyle(
              iconData: Icons.done,
              color: isPast ? Colors.white : const Color(0XFFD9D9D9),
            ),
          ),
          endChild: EventCard(isPast: isPast, address: address, traderName: traderName),
        ),
        if (!isPast)
        Positioned(
          top: AppSize.s2.w,
          left: AppSize.s2.w,
          child: Container(
            padding: EdgeInsets.all(AppPadding.p1.pt),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: SizedBox(
              width: 24,
              height: 24,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title:  Text(LocaleKeys.ConfirmRemove.tr()),
                        content:  Text(LocaleKeys.ConfirmRemoveContent.tr()),
                        actions: <Widget>[
                          TextButton(
                            child:  Text(LocaleKeys.skip.tr()),
                            onPressed: () {
                              Navigator.of(context).pop();
                              cubit.closeTrafficLine(traderId);

                            },
                          ),
                          TextButton(
                            child:  Text(LocaleKeys.Remove.tr()),
                            onPressed: () {
                              Navigator.of(context).pop();
                              cubit.deleteTrafficLine(traderId);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                iconSize: 20,
              ),

            ),
          ),
        ),
      ],
    );
  }
}
