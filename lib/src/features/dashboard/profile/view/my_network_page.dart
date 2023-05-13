import 'package:vmodel/src/core/utils/enum/profile_types.dart';
import 'package:vmodel/src/features/dashboard/profile/view/profile_main_view.dart';
import 'package:vmodel/src/shared/popup_dialogs/confirmation_popup.dart';
import 'package:vmodel/src/features/messages/views/messages_homepage.dart';
import 'package:vmodel/src/features/settings/widgets/my_network_card.dart';
import 'package:vmodel/src/res/assets/app_asset.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/buttons/text_button.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/shared/text_fields/primary_text_field.dart';
import 'package:vmodel/src/vmodel.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VWidgetsAppBar(
        leadingIcon: const VWidgetsBackButton(),
        appbarTitle: "My Network",
        trailingIcon: [
          SizedBox(
            width: 90,
            height: 30,
            child: Row(
              children: [
                Flexible(
                    child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          navigateToRoute(context, const MessagingHomePage());
                        },
                        icon: const RenderSvg(
                          svgPath: VIcons.sendWitoutNot,
                          svgHeight: 24,
                          svgWidth: 24,
                        ))),
                Flexible(
                    child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          openVModelMenu(context, isNotTabScreen: true);
                        },
                        icon: circleIcon)),
                addHorizontalSpacing(5),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const VWidgetsPagePadding.horizontalSymmetric(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    child: VWidgetsPrimaryTextFieldWithTitle(
                  hintText: "Search",
                  controller: searchController,
                  suffixIcon: IconButton(
                      onPressed: () {
                        searchController.clear();
                      },
                      icon: const RenderSvg(
                        svgPath: VIcons.roundedCloseIcon,
                        svgHeight: 20,
                        svgWidth: 20,
                      )),
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: VWidgetsTextButton(
                    onPressed: () {},
                    text: "Cancel",
                  ),
                ),
              ],
            ),
          ),
          addVerticalSpacing(20),
          Expanded(
            child: ListView(
              padding: const VWidgetsPagePadding.horizontalSymmetric(18),
              children: [
                VWidgetsNetworkPageCard(
                  onPressedRemove: () {
                    showDialog(
                        context: context,
                        builder: ((context) => VWidgetsConfirmationPopUp(
                            popupTitle: "Remove Connection",
                            popupDescription:
                                "Are you sure you want to remove this connection?",
                            onPressedYes: () {},
                            onPressedNo: () {
                              Navigator.pop(context);
                            })
                            ));
                  },
                  onPressedProfile: () {
                    navigateToRoute(
                        context,
                        const ProfileMainView(
                            profileTypeEnumConstructor:
                                ProfileTypeEnum.personal));
                  },
                  userImage: "assets/images/models/listTile_3.png",
                  userName: 'Georgina_powell',
                  userNickName: 'Georginal Powell',
                ),
                VWidgetsNetworkPageCard(
                  onPressedRemove: () {
                    showDialog(
                        context: context,
                        builder: ((context) => VWidgetsConfirmationPopUp(
                            popupTitle: "Remove Connection",
                            popupDescription:
                                "Are you sure you want to remove this connection?",
                            onPressedYes: () {},
                            onPressedNo: () {
                              Navigator.pop(context);
                            })
                            ));
                  },
                  onPressedProfile: () {
                    navigateToRoute(
                        context,
                        const ProfileMainView(
                            profileTypeEnumConstructor:
                                ProfileTypeEnum.personal));
                  },
                  userImage: "assets/images/models/listTile_3.png",
                  userName: 'Georgina_powell',
                  userNickName: 'Georginal Powell',
                ),
                VWidgetsNetworkPageCard(
                  onPressedRemove: () {
                    showDialog(
                        context: context,
                        builder: ((context) => VWidgetsConfirmationPopUp(
                            popupTitle: "Remove Connection",
                            popupDescription:
                                "Are you sure you want to remove this connection?",
                            onPressedYes: () {},
                            onPressedNo: () {
                              Navigator.pop(context);
                            })
                            ));
                  },
                  onPressedProfile: () {
                    navigateToRoute(
                        context,
                        const ProfileMainView(
                            profileTypeEnumConstructor:
                                ProfileTypeEnum.personal));
                  },
                  userImage: "assets/images/models/listTile_3.png",
                  userName: 'Georgina_powell',
                  userNickName: 'Georginal Powell',
                ),
                VWidgetsNetworkPageCard(
                  onPressedRemove: () {
                    showDialog(
                        context: context,
                        builder: ((context) => VWidgetsConfirmationPopUp(
                            popupTitle: "Remove Connection",
                            popupDescription:
                                "Are you sure you want to remove this connection?",
                            onPressedYes: () {},
                            onPressedNo: () {
                              Navigator.pop(context);
                            })
                            ));
                  },
                  onPressedProfile: () {
                    navigateToRoute(
                        context,
                        const ProfileMainView(
                            profileTypeEnumConstructor:
                                ProfileTypeEnum.personal));
                  },
                  userImage: "assets/images/models/listTile_3.png",
                  userName: 'Georgina_powell',
                  userNickName: 'Georginal Powell',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
