import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vmodel/src/core/routing/navigator_1.0.dart';
import 'package:vmodel/src/core/utils/shared.dart';
import 'package:vmodel/src/features/settings/views/booking_settings/widgets/unavailable_dates.dart';
import 'package:vmodel/src/res/colors.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';


class AllDates extends StatefulWidget {
  const AllDates({Key? key, required this.selectedDays}) : super(key: key);

  final Set <DateTime>  selectedDays;
  @override
  State<AllDates> createState() => _AllDatesState();
}

class _AllDatesState extends State<AllDates> {

  final List months = [
    "September", "October", "November", "December", "January", "February",
    "March", "April", "May", "June", "July", "August",
  ];

  Set selectedDays = {};

  @override
  void initState() {
    setState(() {
      selectedDays = widget.selectedDays;
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VWidgetsAppBar(
        appbarTitle: "Availability",
        appBarHeight: 50,
        leadingIcon:  Padding(
          padding: const EdgeInsets.only(top: 12, left: 8),
          child: GestureDetector(
              onTap: () => goBack(context),
              child: const Icon(Icons.arrow_back_ios, color: VmodelColors.primaryColor,)),
        ),
        trailingIcon: [
          Padding(
            padding:  const EdgeInsets.only(top: 12, right: 0),
            child: SizedBox(
                height: 30,
                width: 90,
                child: Center(
                  child: Text("Save", style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 16, color: VmodelColors.primaryColor.withOpacity(0.2)
                  ),),
                )
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const VWidgetsPagePadding.horizontalSymmetric(20),
        child: Column(
          children: [

            vmSizedH(20),

            SizedBox(
              height: 38,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: months.length,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(months[index], style: index == 0 ?
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 14, color: VmodelColors.primaryColor):
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 14, color: VmodelColors.primaryColor.withOpacity(0.2)),),
                        );
                      },
                    ),
                  ),

                  const Divider(),

                ],
              ),
            ),

            vmSizedH(20),

            Text("Dates unavailable",
              textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w500, fontSize: 14, color: VmodelColors.primaryColor),
            ),

            vmSizedH(30),

            Expanded(
              child:   ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: selectedDays.length,
                  itemBuilder: (context, index){
                    final date = DateFormat("MMMM dd, yyy").format(selectedDays.toList()[index]);
                    final day = DateFormat("EEEE").format(selectedDays.toList()[index]);

                    return UnavailableDates(date: date, day:day,
                      removeFunc: (){
                        },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
