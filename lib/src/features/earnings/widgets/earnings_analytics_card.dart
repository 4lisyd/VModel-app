import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/vmodel.dart';

class VWidgetsEarningsAnalyticsCard extends StatelessWidget {
  final String? earningsInCurrentMonth;
  final String? averageSellingPrice;
  final String? activeOrders;
  final String? availableForWithdrawal;
  final String? completedOrders;

  const VWidgetsEarningsAnalyticsCard(
      {required this.earningsInCurrentMonth,
      required this.averageSellingPrice,
      required this.completedOrders,
      required this.availableForWithdrawal,
      required this.activeOrders,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Earnings in january",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: VmodelColors.primaryColor,
                  ),
            ),
            Text(
              "£$earningsInCurrentMonth",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: VmodelColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
            )
          ],
        ),
        addVerticalSpacing(15),
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Avg. Selling Price",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: VmodelColors.primaryColor,
                  ),
            ),
            Text(
              "£$averageSellingPrice",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: VmodelColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
            )
          ],
        ),
        addVerticalSpacing(15),
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Active Orders",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: VmodelColors.primaryColor,
                  ),
            ),
            Text(
              "$activeOrders(£0)",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: VmodelColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
            )
          ],
        ),
        addVerticalSpacing(15),
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Available for withdrawal",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: VmodelColors.primaryColor,
                  ),
            ),
            Text(
              "£$availableForWithdrawal",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: VmodelColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
            )
          ],
        ),
        addVerticalSpacing(15),
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Completed orders",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: VmodelColors.primaryColor,
                  ),
            ),
            Text(
              "$completedOrders(£0)",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.w600,
                    color: VmodelColors.primaryColor,
                  ),
            )
          ],
        ),
      ],
    );
  }
}
