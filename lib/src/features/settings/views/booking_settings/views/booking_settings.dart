import 'package:vmodel/src/features/settings/views/booking_settings/views/availability_view.dart';
import 'package:vmodel/src/features/settings/views/booking_settings/views/booking_prices_settings.dart';
import 'package:vmodel/src/features/settings/views/booking_settings/views/job_types_settings.dart';
import 'package:vmodel/src/features/settings/views/booking_settings/widgets/booking_settings_card.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/vmodel.dart';



class BookingSettingsPage extends StatelessWidget {
  const BookingSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const VWidgetsAppBar(
        leadingIcon:  VWidgetsBackButton(),
        appbarTitle: "Booking Settings",

      ),
      body: SingleChildScrollView(
          padding: const VWidgetsPagePadding.horizontalSymmetric(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpacing(25),
              VWidgetsBookingSettingsCard(
                title: "Job Types",
                onTap: (){
                  navigateAndReplaceRoute(context, const JobTypesSettingPage());
                },
              ),

             
              VWidgetsBookingSettingsCard(
                title: "Prices",
                onTap: (){
                   navigateAndReplaceRoute(context, const BookingPricesSettingsPage());
                },
              ),

              VWidgetsBookingSettingsCard(
                title: "Availability",
                onTap: (){
                  navigateToRoute(context, const AvailabilityView());
                },
              ),
            ],
          ),
        ),
      
    );
  }
}