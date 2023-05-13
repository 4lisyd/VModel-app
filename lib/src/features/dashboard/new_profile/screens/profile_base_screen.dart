

import 'package:vmodel/src/features/dashboard/new_profile/widgets/profile_header_widget.dart';
import 'package:vmodel/src/features/dashboard/new_profile/widgets/tab1_screen.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';

class ProfileBaseScreen extends StatefulWidget {
  const ProfileBaseScreen({super.key});

  @override
  _ProfileBaseScreenState createState() => _ProfileBaseScreenState();
}

class _ProfileBaseScreenState extends State<ProfileBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VWidgetsAppBar(
        leadingIcon: const VWidgetsBackButton(),
        appbarTitle:
          "Samantha Colins",
        elevation: 1,
        trailingIcon: [
           IconButton(
            icon: const RenderSvg(
              svgPath: VIcons.notification,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const RenderSvg(
              svgPath: VIcons.circleMenu,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    profileHeaderWidget(context),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              Material(
                color: Colors.white,
                child: TabBar(
                   labelStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.w600),
                      labelColor: VmodelColors.primaryColor,
                      unselectedLabelColor: VmodelColors.unselectedText,
                      unselectedLabelStyle: Theme.of(context).textTheme.displayMedium
                          ?.copyWith(fontWeight: FontWeight.w500),           
                      indicatorColor: VmodelColors.mainColor,
                      isScrollable: true,
                  tabs: [
                    Tab(text: "Features"),
                    Tab(text: "Favourited"),
                    Tab(text: "Commercial"),
                    Tab(text: "Editorial"),
                    Tab(text: "Underwear"),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
  
                  children: [
                    Gallery(),
                    Gallery(),
                    Gallery(),
                    Gallery(),
                    Gallery(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
