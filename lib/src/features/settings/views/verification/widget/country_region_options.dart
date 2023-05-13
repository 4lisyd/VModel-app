import 'package:country_list/country_list.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/vmodel.dart';

class VWidgetsCountryRegions extends StatelessWidget {
   final VoidCallback? onTap;
  const VWidgetsCountryRegions({
    required this.onTap,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VWidgetsAppBar(
        appbarTitle: "ID country or region",
        appBarHeight: 50,
        leadingIcon: VWidgetsBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ListView.builder(
          itemCount: Countries.list.length,
          itemBuilder: (_, index) {
            Country country = Countries.list[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    country.name,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: VmodelColors.primaryColor),
                  ),
                ),
                Divider(
                  height: 3.h,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
