import 'package:vmodel/src/features/earnings/widgets/earnings_analytics_card.dart';
import 'package:vmodel/src/features/earnings/widgets/earnings_revenues_card.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/vmodel.dart';

class EarningsPage extends StatelessWidget {
  const EarningsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VWidgetsAppBar(
        leadingIcon: VWidgetsBackButton(),
        appbarTitle: "Earnings",
      ),
      body: SingleChildScrollView(
          padding: const VWidgetsPagePadding.horizontalSymmetric(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpacing(25),
              Center(
                  child: Column(
                children: [
                  Text(
                    "£550.00",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 25.sp,
                        color: VmodelColors.primaryColor),
                  ),
                  addVerticalSpacing(5),
                  Text(
                    "Available for withdrawal",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: VmodelColors.primaryColor.withOpacity(0.5)),
                  ),
                ],
              )),
              const Divider(
                thickness: 1,
                height: 50,
              ),
              addVerticalSpacing(10),
              Text(
                "Analytics",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: VmodelColors.primaryColor,
                     fontWeight: FontWeight.w600),
              ),
              addVerticalSpacing(20),
              const VWidgetsEarningsAnalyticsCard(
                  earningsInCurrentMonth: "0",
                  averageSellingPrice: "100",
                  completedOrders: "0",
                  availableForWithdrawal: "0",
                  activeOrders: "0"),
              const Divider(
                thickness: 1,
                height: 50,
              ),
              addVerticalSpacing(10),
              Text(
                "Revenues",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: VmodelColors.primaryColor,
                    fontWeight: FontWeight.w600),
              ),
              addVerticalSpacing(20),
              VWidgetsEarningsRevenuesCard(
                  paymentsCleared: "0",
                  earningsToDate: "185",
                  expensesToDate: "55",
                  withdrawnToDate: "185",
                  onTapPaymentsCleared: () {},
                  onTapEarningsToDate: () {},
                  onTapExpensesToDate: () {},
                  onTapWithdrawnToDate: () {}),
            ],
          )),
    );
  }
}
