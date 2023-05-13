import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vmodel/src/core/utils/shared.dart';
import 'package:vmodel/src/features/settings/views/booking_settings/event_class.dart';
import 'package:vmodel/src/features/settings/views/booking_settings/views/view_all_dates.dart';
import 'package:vmodel/src/features/settings/views/booking_settings/widgets/unavailable_dates.dart';
import 'package:vmodel/src/res/colors.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/buttons/primary_button.dart';
import 'package:vmodel/src/vmodel.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';


class AvailabilityView extends StatefulWidget {
  const AvailabilityView({Key? key}) : super(key: key);

  @override
  _AvailabilityViewState createState() => _AvailabilityViewState();
}

class _AvailabilityViewState extends State<AvailabilityView> {

  DateTime _focusedDay = DateTime.now();

  Set <DateTime> ? _selectedDays;

  ValueNotifier<List<Event>> ? _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedEvents = ValueNotifier(_getEventsForDay(_focusedDay));
    _selectedDays = LinkedHashSet<DateTime>(
      equals: isSameDay,
      hashCode: getHashCode,
    );
  }

  @override
  void dispose() {
    _selectedEvents!.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return [];
  }

  List<Event> _getEventsForDays(Set<DateTime> days) {
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      if (_selectedDays!.contains(selectedDay)) {
        _selectedDays!.remove(selectedDay);
      } else {
        _selectedDays!.add(selectedDay);
      }
    });
    _selectedEvents!.value = _getEventsForDays(_selectedDays!);
    _focusedDay = focusedDay;
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
                  fontWeight: FontWeight.w600, fontSize: 16, color: VmodelColors.primaryColor
                ),),
              )
            ),
          ),
        ],
      ),

    body: SingleChildScrollView(
      child: Column(
          children: [
            vmSizedH(30),
            Padding(
              padding: const VWidgetsPagePadding.horizontalSymmetric(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Flexible(child: Text("Pick your “unavailable” dates below. No one will be able to book you on an unavailable date.",
                  textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.w500, fontSize: 13, color: VmodelColors.primaryColor
                      ),), ),
                  const Icon(Icons.close, color: VmodelColors.primaryColor,)]
              ),
            ),

            const Divider(height: 30,),

            Padding(
              padding: const VWidgetsPagePadding.horizontalSymmetric(20),
              child: TableCalendar(
                startingDayOfWeek: StartingDayOfWeek.monday,
                firstDay: DateTime(1990),
                lastDay: DateTime(2040),
                focusedDay: _focusedDay,

                eventLoader: _getEventsForDay,
                selectedDayPredicate: (day) {
                  return _selectedDays!.contains(day);
                },

                onDaySelected: _onDaySelected,

                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },

                headerStyle: const HeaderStyle(
                  titleTextStyle:
                  TextStyle(color: VmodelColors.primaryColor, fontSize: 16.0, fontWeight: FontWeight.w600),
                  leftChevronIcon: Icon(
                    Icons.arrow_back_ios,
                    color:  VmodelColors.primaryColor,
                    size: 25,
                  ),
                 formatButtonVisible: false,
                  titleCentered: true,
                  rightChevronIcon: Icon(
                    Icons.arrow_forward_ios,
                    color:  VmodelColors.primaryColor,
                    size: 25,
                  ),
                ),

                calendarStyle: const CalendarStyle(
                  isTodayHighlighted: false,

                  selectedDecoration: BoxDecoration(color: VmodelColors.primaryColor, shape: BoxShape.circle)
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: VmodelColors.black),
                  weekendStyle: TextStyle(color: VmodelColors.black),

              ),),
            ),

            const Divider(height: 40,),

             Text("Dates unavailable",
              textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w500, fontSize: 14, color: VmodelColors.primaryColor),
             ),

            vmSizedH(30),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const VWidgetsPagePadding.horizontalSymmetric(20),
                child: Text( _selectedDays!.isNotEmpty ? "This Month" : "", style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w600, fontSize: 12, color: VmodelColors.primaryColor),
                ),
              ),
            ),

            Padding(
              padding: const VWidgetsPagePadding.horizontalSymmetric(20),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemCount: _selectedDays!.length,
                  itemBuilder: (context, index){
                  final date = DateFormat("MMMM dd, yyy").format(_selectedDays!.toList()[index]);
                  final day = DateFormat("EEEE").format(_selectedDays!.toList()[index]);

                 return UnavailableDates(date: date, day:day,
                   removeFunc: (){
                   setState(() {
                     _selectedDays!.remove(_selectedDays!.toList()[index]);});
                   },
                 );
                  }),
            ),


            vmSizedH(30),

            VWidgetsPrimaryButton(
                butttonWidth: 118,
                enableButton: true,
                buttonTitle: "View all dates",
                onPressed: (){
                  navigateToRoute(context,  AllDates(selectedDays: _selectedDays!,));
                },
            ),

            vmSizedH(15),

      ],


          ),
    ),
    );
  }
}

