import 'package:flutter_svg/flutter_svg.dart';
import 'package:vmodel/src/features/archived/views/archived_view.dart';
import 'package:vmodel/src/features/saved/controller/saved_controller.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/vmodel.dart';

class SavedView extends GetView<SavedController> {
  const SavedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VmodelColors.background,
      appBar: VWidgetsAppBar(
        leadingIcon: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: VWidgetsBackButton(),
        ),
        appbarTitle: "Saved Posts",
        trailingIcon: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: IconButton(
                onPressed: () {
                  navigateToRoute(context, const ArchivedView());
                },
              icon: SvgPicture.asset(VIcons.archiveIcon),
            ),
          ),
          // const RenderSvg(
          //   svgPath: VIcons.addCircle,
          //   color: VmodelColors.primaryColor,))
        ],
      ),

     
      body: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
         TabBar(
                  //indicatorColor: Colors.transparent,
                  labelColor: VmodelColors.text,
                  unselectedLabelColor: VmodelColors.ligtenedText,
                  labelStyle: labelTextStyle,
                  unselectedLabelStyle: unselectedLabelTextStyle,
                  tabs: const [
                    Tab(
                      text: 'Models',
                    ),
                    Tab(
                      text: 'Photographers',
                    ),
                    Tab(
                      text: 'Pets',
                    )
                  ]),
        
            Flexible(
              flex: 12,
              child: TabBarView(children: [
                _buildGridView(context, 'models'),
                _buildGridView(context, 'photographer'),
                _buildGridView(context, 'pets'),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Future <Null> reloadData() async{}

  _buildGridView(
    BuildContext context,
    String category,
  ) {
    return RefreshIndicator(
      onRefresh: (){
       return reloadData();
      },
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisExtent: 202,
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 2,
              ),
          itemCount: assets[category]!.length,
          itemBuilder: (BuildContext ctx, index) {
            return Image.asset(assets[category]![index], fit: BoxFit.cover);
          }),
    );
  }
}
