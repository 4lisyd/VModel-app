import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:vmodel/src/features/reviews/widgets/booking_item.dart';
import 'package:vmodel/src/features/reviews/widgets/my_booking_filter.dart';
import 'package:vmodel/src/res/assets/app_asset.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';

class BookingsMenuView extends StatefulWidget {
  const BookingsMenuView({super.key});

  @override
  State<BookingsMenuView> createState() => _BookingsMenuViewState();
}

enum Fruit { apple, banana }

class _BookingsMenuViewState extends State<BookingsMenuView> {
  Fruit? _fruit = Fruit.apple;
  bool _isAllRadioSelected = false;
  bool _isCompletedRadioSelected = false;
  bool _isCancelledRadioSelected = false;
  bool _isOrderDate = false;
  bool _isDeliveryDate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VWidgetsAppBar(
        appBarHeight: 50,
        leadingIcon: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: VWidgetsBackButton(),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appbarTitle: "My Bookings",
        trailingIcon: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: PopupMenuButton<int>(
              tooltip: "Filter",
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              icon: const RenderSvg(
                svgPath: VIcons.setting,
                svgHeight: 24,
                svgWidth: 24,
              ),
              itemBuilder: (context) => [
                // PopupMenuItem 1
                PopupMenuItem(
                  value: 1,
                  onTap: () {
                    setState(() {
                      _isOrderDate = !_isOrderDate;
                      _isDeliveryDate = false;
                    });
                  },
                  // row with 2 children
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Date",
                        style:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      _isOrderDate != false
                          ? const Icon(
                              Icons.radio_button_checked_rounded,
                              color: VmodelColors.primaryColor,
                            )
                          : const Icon(
                              Icons.radio_button_off_rounded,
                              color: VmodelColors.primaryColor,
                            ),
                    ],
                  ),
                ),
                // PopupMenuItem 2
                PopupMenuItem(
                  value: 2,
                  onTap: () {
                    setState(() {
                      _isDeliveryDate = !_isDeliveryDate;
                      _isOrderDate = false;
                    });
                  },
                  // row with two children
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Date",
                        style:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      _isDeliveryDate != false
                          ? const Icon(
                              Icons.radio_button_checked_rounded,
                              color: VmodelColors.primaryColor,
                            )
                          : const Icon(
                              Icons.radio_button_off_rounded,
                              color: VmodelColors.primaryColor,
                            ),
                    ],
                  ),
                ),
              ],
              offset: const Offset(0, 40),
              color: VmodelColors.white,
              elevation: 1,
              // on selected we show the dialog box
              onSelected: (value) {
                // if value 1 show dialog
                if (value == 1) {
                  // if value 2 show dialog
                } else if (value == 2) {}
              },
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                addVerticalSpacing(20),
                Padding(
                  padding: const VWidgetsPagePadding.horizontalSymmetric(18),
                  child: Text(
                    "Upcoming bookings",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: VmodelColors.primaryColor),
                  ),
                ),
                addVerticalSpacing(15),
                const UpcomingBookingsInfo(),
                addVerticalSpacing(20),
                Padding(
                  padding: const VWidgetsPagePadding.horizontalSymmetric(18),
                  child: Text(
                    "6 Bookings",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: VmodelColors.primaryColor),
                  ),
                ),
                addVerticalSpacing(15),
                Padding(
                  padding: const VWidgetsPagePadding.horizontalSymmetric(18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabeledRadio(
                        label: 'All',
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        value: true,
                        groupValue: _isAllRadioSelected,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isAllRadioSelected = newValue;
                            _isCancelledRadioSelected = false;
                            _isCompletedRadioSelected = false;
                          });
                        },
                      ),
                      LabeledRadio(
                        label: 'Completed',
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        value: true,
                        groupValue: _isCompletedRadioSelected,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isCompletedRadioSelected = newValue;
                            _isAllRadioSelected = false;
                            _isCancelledRadioSelected = false;
                          });
                        },
                      ),
                      LabeledRadio(
                        label: 'Cancelled',
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        value: true,
                        groupValue: _isCancelledRadioSelected,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isCancelledRadioSelected = newValue;
                            _isCompletedRadioSelected = false;
                            _isAllRadioSelected = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                addVerticalSpacing(5),
                Padding(
                  padding: const VWidgetsPagePadding.horizontalSymmetric(18),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: const [
                      BookingItems(),
                      BookingItems(),
                      BookingItems(),
                      BookingItems(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UpcomingBookingsInfo extends StatelessWidget {
  const UpcomingBookingsInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const VWidgetsPagePadding.horizontalSymmetric(18),
      child: Container(
          height: 264,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: VmodelColors.contractBackgroundColor,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                blurRadius: 8,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(VmodelAssets2.bookingBgImage),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 26,
                            width: 83,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: VmodelColors.white),
                            child: Center(
                              child: Text(
                                "in 1 week",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: VmodelColors.primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Christopher M. Davies",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: VmodelColors.white),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const VWidgetsPagePadding.horizontalSymmetric(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    vmSizedH(15),
                    Text(
                      "London, Uk",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: VmodelColors.primaryColor),
                    ),
                    vmSizedH(6),
                    Text(
                      "12 Oct 2023 - 16 Oct 2023",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: VmodelColors.primaryColor),
                    ),
                    vmSizedH(15),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            height: 37,
                            decoration: BoxDecoration(
                                color: VmodelColors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 1, color: VmodelColors.mainColor)),
                            child: Center(
                              child: Text(
                                "Send message",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: VmodelColors.primaryColor),
                              ),
                            ),
                          ),
                        ),
                        vmSizedW(10),
                        Flexible(
                          child: Container(
                            height: 37,
                            decoration: BoxDecoration(
                                color: VmodelColors.primaryColor,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 1, color: VmodelColors.mainColor)),
                            child: Center(
                              child: Text(
                                "Route",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: VmodelColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
  });

  final String? label;
  final EdgeInsets? padding;
  final bool? groupValue;
  final bool? value;
  final Function? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged!(value);
        }
      },
      child: Padding(
        padding: padding!,
        child: Row(
          children: <Widget>[
            Radio<bool>(
              groupValue: groupValue,
              value: value!,
              onChanged: (bool? newValue) {
                onChanged!(newValue);
              },
            ),
            Text(label!),
          ],
        ),
      ),
    );
  }
}
