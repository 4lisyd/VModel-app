import 'package:flutter/material.dart';
import 'package:vmodel/src/core/routing/navigator_1.0.dart';
import 'package:vmodel/src/features/reviews/views/booking_details.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/page_padding/page_padding.dart';
import 'package:vmodel/src/core/utils/utils.dart';

class BookingItems extends StatelessWidget {
  const BookingItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const VWidgetsPagePadding.verticalSymmetric(10),
      child: GestureDetector(
        onTap: () => navigateToRoute(context, const BookingDetailsView()),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(VmodelAssets1.profileImage),
                    fit: BoxFit.cover,
                  )),
            ),
            addHorizontalSpacing(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Georgina Powell",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: VmodelColors.primaryColor),
                ),
                vmSizedH(4),
                Text("Yonkers, New York, USA",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: VmodelColors.primaryColor)),
                Row(
                  children: [
                    Text(
                      "12 Oct 2023 - 16 Oct 2023 ",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: VmodelColors.primaryColor),
                    ),
                    Text(
                      "In 5 weeks",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: VmodelColors.text3),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
