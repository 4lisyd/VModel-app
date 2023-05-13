import 'package:vmodel/src/features/dashboard/discover/models/mock_data.dart';
import 'package:vmodel/src/features/jobs/create_jobs/views/create_job_view_second.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/appbar/appbar_title_text.dart';
import 'package:vmodel/src/shared/buttons/primary_button.dart';
import 'package:vmodel/src/shared/buttons/text_button.dart';
import 'package:vmodel/src/shared/category_chips/category_button.dart';
import 'package:vmodel/src/shared/text_fields/description_text_field.dart';
import 'package:vmodel/src/shared/text_fields/primary_text_field.dart';
import 'package:vmodel/src/vmodel.dart';

class CreateJobFirstPage extends StatefulWidget {
  const CreateJobFirstPage({super.key});

  @override
  State<CreateJobFirstPage> createState() => _CreateJobFirstPageState();
}

class _CreateJobFirstPageState extends State<CreateJobFirstPage> {
  String selectedChip = "Model";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VWidgetsAppBar(
          backgroundColor: VmodelColors.white,
          appBarHeight: 50,
          trailingIcon: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: VWidgetsTextButton(
                text: 'Next',
                onPressed: () {
                  navigateToRoute(context, const CreateJobSecondPage());
                },
              ),
            ),
          ],
          leadingIcon: const Padding(
            padding: EdgeInsets.only(top: 12),
            child: VWidgetsBackButton(),
          ),
      appbarTitle: "Create a job",),
      body: ListView(
        children: [
          addVerticalSpacing(20),
          Container(
            padding: const VWidgetsPagePadding.horizontalSymmetric(18),
            child: const VWidgetsPrimaryTextFieldWithTitle(
              label: "Job Title",
              hintText: "Eg. Vmodel",
            ),
          ),
          addVerticalSpacing(25),
          Container(
            padding: const VWidgetsPagePadding.horizontalSymmetric(18),
            child: Text(
              "I'm looking for a",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          addHorizontalSpacing(8),
          SizedBox(
            height: 54,
            child: ListView.builder(
              padding: const VWidgetsPagePadding.horizontalSymmetric(18),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return VWidgetsCategoryButton(
                  isSelected: selectedChip == categories[index],
                  text: categories[index],
                  onPressed: () =>
                      setState(() => selectedChip = categories[index]),
                );
              },
            ),
          ),
          addVerticalSpacing(25),
          Container(
            padding: const VWidgetsPagePadding.horizontalSymmetric(18),
            child: const VWidgetsDescriptionTextFieldWithTitle(
              label: "Add Description",
              hintText: "Write a description...",
              // validator: ValidationsMixin.isNotEmpty(value),
              //controller: ,
              //onSaved: (){},
            ),
          ),
          addVerticalSpacing(25),
          Container(
            padding: const VWidgetsPagePadding.horizontalSymmetric(18),
            child: VWidgetsPrimaryButton(
              onPressed: () {
                navigateToRoute(context, const CreateJobSecondPage());
              },
              enableButton: true,
              buttonTitle: "Continue",
            ),
          ),
          addVerticalSpacing(50),
        ],
      ),
    );
  }
}
