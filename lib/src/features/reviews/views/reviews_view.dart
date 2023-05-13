import 'package:vmodel/src/features/reviews/views/reviews_listview.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';

class ReviewsUI extends StatefulWidget {
  const ReviewsUI({super.key});

  @override
  State<ReviewsUI> createState() => _ReviewsUIState();
}

enum Fruit { apple, banana }

class _ReviewsUIState extends State<ReviewsUI> {

  bool _isMostRecent = false;
  bool _isBestReview = false;
  bool _isHighestPaid = false;

  Future <void> reloadData() async{}

  @override
  Widget build(BuildContext context) {
    int numOfReviews = 6;
    return Scaffold(
      appBar: VWidgetsAppBar(
        appBarHeight: 50,
        leadingIcon: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: VWidgetsBackButton(),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appbarTitle: "My Reviews",
        // Text('My Reviews', style: VmodelTypography2.kTopTextStyle),
        trailingIcon: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: PopupMenuButton<int>(
              tooltip: "Filter",
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              icon:const RenderSvg(
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
                      _isMostRecent = !_isMostRecent;
                      _isBestReview = false;
                      _isHighestPaid = false;
                    });
                  },
                  // row with 2 children
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Most recent",
                        style:
                        Theme.of(context).textTheme.bodyMedium!.copyWith(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      _isMostRecent != false
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
                    // setState(() {
                    //   _isDeliveryDate = !_isDeliveryDate;
                    //   _isOrderDate = false;
                    // });
                  },
                  // row with two children
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Best review ",
                        style:
                        Theme.of(context).textTheme.bodyMedium!.copyWith(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      _isBestReview != false
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

                PopupMenuItem(
                  value: 3,
                  onTap: () {
                    // setState(() {
                    //   _isDeliveryDate = !_isDeliveryDate;
                    //   _isOrderDate = false;
                    // });
                  },
                  // row with two children
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Highest paid",
                        style:
                        Theme.of(context).textTheme.bodyMedium!.copyWith(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      _isHighestPaid != false
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
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: (){
            return reloadData();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0,bottom: 5),
                child: Column(
                  children: [
                    Text(
                      '$numOfReviews Reviews',
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                
                  ],
                ),
              ),
              
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: DemoListTile(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
