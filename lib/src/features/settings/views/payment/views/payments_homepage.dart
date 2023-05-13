import 'package:vmodel/src/features/settings/views/payment/views/currency_page.dart';
import 'package:vmodel/src/features/settings/views/payment/views/payment_methods_page.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/vmodel.dart';

class PaymentSettingsHomepage extends StatelessWidget {
  const PaymentSettingsHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VWidgetsAppBar(
        leadingIcon: VWidgetsBackButton(),
        appbarTitle: "Payments",
      ),
      body: SingleChildScrollView(
        padding: const VWidgetsPagePadding.horizontalSymmetric(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpacing(25),
            GestureDetector(
              onTap: () {
                navigateToRoute(context, const CurrencyPage());
              },
              child: Text(
                "Currency",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: VmodelColors.primaryColor),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            addVerticalSpacing(12),
            GestureDetector(
              onTap: () {
                navigateToRoute(context, const PaymentSettingsPage());
              },
              child: Text(
                "Payment Methods",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: VmodelColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
