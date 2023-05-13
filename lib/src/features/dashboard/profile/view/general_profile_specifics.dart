import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';
import 'package:vmodel/src/core/routing/navigator_1.0.dart';
import 'package:vmodel/src/core/utils/browser_laucher.dart';
import 'package:vmodel/src/core/utils/costants.dart';
import 'package:vmodel/src/core/utils/enum/profile_types.dart';
import 'package:vmodel/src/features/create_contract/views/create_contract_view.dart';
import 'package:vmodel/src/features/dashboard/dash/controller.dart';
import 'package:vmodel/src/features/dashboard/dash/dashboard_ui.dart';
import 'package:vmodel/src/features/booking/views/create_booking/views/create_booking_view.dart';
import 'package:vmodel/src/features/dashboard/profile/data/measurement_mock.dart';
import 'package:vmodel/src/features/dashboard/profile/view/profile_extended_bio.dart';
import 'package:vmodel/src/features/dashboard/profile/view/profile_polaroid_screen.dart';
import 'package:vmodel/src/features/dashboard/profile/widget/user_profile/measurement_tile.dart';
import 'package:vmodel/src/features/dashboard/profile/widget/user_profile/profile_buttons_widget.dart';
import 'package:vmodel/src/features/dashboard/profile/widget/user_profile/profile_sub_info_widget.dart';
import 'package:vmodel/src/features/messages/views/messages_chat_screen.dart';
import 'package:vmodel/src/features/messages/views/messages_homepage.dart';
import 'package:vmodel/src/features/reviews/views/bookings_view.dart';
import 'package:vmodel/src/features/dashboard/profile/view/my_network_page.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/core/utils/shared.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';

import '../../../../core/api/graphql_service.dart';
import '../../../../shared/loader/full_screen.dart';

class GeneralProfileSpecifics extends ConsumerStatefulWidget {
  final ProfileTypeEnum profileTypeEnum;
  const GeneralProfileSpecifics(
      {Key? key,
      required this.imgLink,
      required this.isMainPortfolio,
      required this.profileTypeEnum})
      : super(key: key);
  final String imgLink;
  final bool isMainPortfolio;

  @override
  ConsumerState<GeneralProfileSpecifics> createState() =>
      _GeneralProfileSpecificsState();
}

class _GeneralProfileSpecificsState extends ConsumerState<GeneralProfileSpecifics> {
  double _animatedHeight = 600.0;
  bool isDefaultBio = true;
  bool isConnected = false;
  bool isUserPrivate = false;
  bool longPressProfile = false;
  bool isBioVisible = true;

  userConnectionState() {
    setState(() {});
  }

  privateUserBookingState() {
    setState(() {
      isUserPrivate = !isUserPrivate;
    });
  }

  changeConnectionState() {
    setState(() {
      isConnected = !isConnected;
    });
  }


//
  String get mainBio => widget.profileTypeEnum == ProfileTypeEnum.business
      ? "At Afrogarm, we are focused on building a platform that changes the narrative of presentation in Black and African brands world.."
      : "Hi, I’m a model with ABC Model Agency in San Francisco, CA who is interested in building a good portfolio for my model work";

  //
  bool shouldShowUSerMeasurement = false;

  changeMeasurementState() {
    setState(() {
      shouldShowUSerMeasurement = !shouldShowUSerMeasurement;
    });
  }

  File? _image;

  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authProvider.notifier);

    TextTheme theme = Theme.of(context).textTheme;
    List<MeasurementObjectModel> measurementModelList() => [
      MeasurementObjectModel(title: authNotifier.state.height, label: "Height"),
      MeasurementObjectModel(title: authNotifier.state.chest, label: "Chest"),
      MeasurementObjectModel(title: authNotifier.state.weight, label: "Weight"),
      MeasurementObjectModel(title: authNotifier.state.hair, label: "Hair"),
      MeasurementObjectModel(title: authNotifier.state.eyes, label: "Eyes")
    ];


    return ProgressHUD(
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: 52),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 1, color: VmodelColors.borderColor),
                      bottom: BorderSide(width: 1, color: VmodelColors.borderColor))),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: SizeConfig.screenHeight * 0.52,
                        width: SizeConfig.screenWidth,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        margin: const EdgeInsets.only(bottom: 52),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            vmSizedH(18),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Visibility(
                                  visible : isDefaultBio,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3, color: VmodelColors.primaryColor),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: GestureDetector(
                                        onLongPress: () {
                                          setState(() {
                                            // isDefaultBio = false;
                                            longPressProfile = !longPressProfile;
                                            isBioVisible = !isBioVisible;
                                          });
                                          print('hello');
                                        },
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: VmodelColors.primaryColor),
                                              image:
                                              (authNotifier.state.profilePicture != null) ?DecorationImage(
                                                  image:  NetworkImage(VMstring.pictureCall + authNotifier.state.profilePicture!),
                                                  fit: BoxFit.cover) : (_image != null) ? DecorationImage(
                                                  image:  FileImage(_image!),
                                                  fit: BoxFit.cover) : DecorationImage(image: AssetImage(VmodelAssets1.logo), fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                vmSizedW(12),
                                Visibility(
                                  visible: isBioVisible,
                                  child: Flexible(
                                    child: Row(
                                      // alignment: Alignment.bottomCenter,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Flexible(
                                          child: Text(
                                    authNotifier.state.bio.toString(),
                                            style: theme.displayMedium!.copyWith(
                                              fontSize: 11.sp,
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Visibility(
                                  visible: longPressProfile,
                                  child: Flexible(
                                  child: Column(
                                    // alignment: Alignment.bottomCenter,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 33,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: VmodelColors.primaryColor ,
                                            border: Border.all(width: 1.5, color: VmodelColors.primaryColor)
                                        ),
                                        child: GestureDetector(
                                          onTap: () async{
                                            final progress = ProgressHUD.of(context);
                                            await _openImagePicker();
                                            // if(_image != null) {
                                            progress?.show();
                                            final bytes = await _image!.readAsBytes();
                                            String base64Image = base64Encode(bytes);
                                            // progress?.show();
                                            await authNotifier.pictureUpdate(authNotifier.state.pk!, base64Image, 'profilePicture');
                                            progress?.dismiss();
                                          },
                                          child: Center(
                                            child: Text( "Change Photo",
                                              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                              ),),
                                          ),
                                        ),
                                      ),
                                      vmSizedH(10),
                                      Container(
                                        width: 120,
                                        height: 33,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: VmodelColors.primaryColor ,
                                            border: Border.all(width: 1.5, color: VmodelColors.primaryColor)
                                        ),
                                        child: Center(
                                          child: Text( "Delete Photo",
                                            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),),
                                        ),
                                      ),
                                      // Flexible(
                                      //   child: Text(
                                      //     authNotifier.state.bio.toString(),
                                      //     style: theme.displayMedium!.copyWith(
                                      //       fontSize: 11.sp,
                                      //       color: Theme.of(context).primaryColor,
                                      //       fontWeight: FontWeight.w500,
                                      //     ),
                                      //     overflow: TextOverflow.ellipsis,
                                      //     maxLines: 4,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),),

                              ],
                            ),
                            addVerticalSpacing(35),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /// profile type name here
                                Text(
                                  returnLabelBasedOnUser(widget.profileTypeEnum),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.4),
                                      ),
                                ),

                                ///Expand bio icon logic
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    child: GestureDetector(
                                        onTap: (() {
                                          setState(() {
                                            isDefaultBio = false;
                                            _animatedHeight != 0.0
                                                ? _animatedHeight = 0.0
                                                : _animatedHeight = 600.0;
                                          });
                                        }),
                                        child: const NormalRenderSvgWithColor(
                                          svgPath: VIcons.expandBioIcon,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            addVerticalSpacing(10),

                            /// For Sub info of profile
                            VWidgetsProfileSubInfoDetails(
                              stars: "4.9",
                              profileTypeEnum: widget.profileTypeEnum,
                              address: "Los Angeles, USA",
                              companyUrl: "www.afrogarm.com",
                              budget: "450",
                              onPressedCompanyURL: () {
                                VUtilsBrowserLaucher.lauchWebBrowserWithUrl(
                                    "www.afrogarm.com");
                              },
                              userName: '${authNotifier.state.firstName} ' ' ${authNotifier.state.lastName}',
                            ),

                            addVerticalSpacing(15),
                            VWidgetsProfileButtons(
                              largeButtonTitle:
                                  widget.profileTypeEnum == ProfileTypeEnum.personal
                                      ? "Bookings"
                                      : "Book Now",
                              connectTitle:
                                  widget.profileTypeEnum == ProfileTypeEnum.personal
                                      ? "Network"
                                      : isConnected
                                          ? "Remove"
                                          : "Connect",
                              connected:
                                  widget.profileTypeEnum == ProfileTypeEnum.personal
                                      ? true
                                      : isConnected,
                              connectOnPressed: () {
                                //! Temporary change do not delete

                                widget.profileTypeEnum == ProfileTypeEnum.personal
                                    ? navigateToRoute(context, const NetworkPage())
                                    : changeConnectionState();
                              },
                              smallButtonOneTitle: (widget.profileTypeEnum ==
                                          ProfileTypeEnum.business ||
                                      widget.profileTypeEnum ==
                                          ProfileTypeEnum.photographer)
                                  ? "Top Picks"
                                  : widget.isMainPortfolio
                                      ? 'Polaroid'
                                      : 'Portfolio',
                              smallButtonTwoTitle: (widget.profileTypeEnum ==
                                          ProfileTypeEnum.business ||
                                      widget.profileTypeEnum ==
                                          ProfileTypeEnum.photographer)
                                  ? "Message"
                                  : "Messages",
                              polaroidOrTopPicksOnPressed: () {
                                if (widget.profileTypeEnum ==
                                        ProfileTypeEnum.business ||
                                    widget.profileTypeEnum ==
                                        ProfileTypeEnum.photographer) {
                                } else {
                                  widget.isMainPortfolio
                                      ? navigateToRoute(
                                          context, const PolaroidPortfolioView())
                                      : navigateAndReplaceRoute(
                                          context, const DashBoardView());
                                }
                              },
                              messagesOnPressed: () {
                                if (widget.profileTypeEnum ==
                                        ProfileTypeEnum.business ||
                                    widget.profileTypeEnum ==
                                        ProfileTypeEnum.photographer) {
                                  navigateToRoute(
                                      context, const MessagesChatScreen());
                                } else {
                                  navigateToRoute(
                                      context, const MessagingHomePage());
                                }
                              },
                              instagramOnPressed: () {
                                VUtilsBrowserLaucher.lauchWebBrowserWithUrl(
                                    widget.profileTypeEnum ==
                                            ProfileTypeEnum.business
                                        ? "www.afrogarm.com"
                                        : "www.instagram.com/vmodelapp");
                              },
                              instaLineOnPressed: () {
                                changeMeasurementState();

                                if (shouldShowUSerMeasurement) {
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(
                                        SnackBar(
                                          duration: const Duration(days: 5),
                                          padding: const EdgeInsets.all(0),
                                          backgroundColor: Colors.transparent,
                                          content: SizedBox(
                                              height: 90,
                                              child: Container(
                                                decoration: BoxDecoration(color: VmodelColors.white, boxShadow: [
                                                  BoxShadow(
                                                    color: VmodelColors.blackColor.withOpacity(0.1),
                                                    spreadRadius: 0,
                                                    blurRadius: 9,
                                                    offset: const Offset(0, 3),
                                                  )
                                                ]),
                                                child: Row(
                                                  children: [
                                                    for (int i = 0; i < measurementModelList().length; i++)
                                                      Expanded(
                                                        child: MeasusementTile(
                                                          title: measurementModelList()[i].title,
                                                          label: measurementModelList()[i].label,
                                                        ),
                                                      )
                                                  ],
                                                ),
                                              )),
                                        ),
                                    );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                }
                              },
                              bookNowOnPressed: () {
                                // navigateToRoute(context, const BookingsView());
                                //! Temporary change do not delete
                                if (widget.profileTypeEnum ==
                                    ProfileTypeEnum.personal) {
                                  navigateToRoute(
                                      context, const BookingsMenuView());
                                } else {
                                  privateUserBookingState();
                                  bookNowFunction(context);
                                }
                              },
                            ),
                            addVerticalSpacing(15),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Visibility(
                  //   visible: !isDefaultBio,
                  //   child: AnimatedContainer(
                  //       duration: const Duration(milliseconds: 500),
                  //       height: SizeConfig.screenHeight * 0.60,
                  //       width: SizeConfig.screenWidth,
                  //       curve: Curves.fastOutSlowIn,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20),
                  //         color: VmodelColors.white,
                  //       ),
                  //       child: ProfileExpandedBio(
                  //         imgLink: authNotifier.state.profilePicture.toString(),
                  //         mainBio: authNotifier.state.bio.toString(),
                  //         onPortfolioCheck: () {
                  //           setState(() {
                  //             isDefaultBio = true;
                  //             _animatedHeight != 0.0
                  //                 ? _animatedHeight = 0.0
                  //                 : _animatedHeight = 600.0;
                  //           });
                  //         },
                  //       )),
                  // ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  bookNowFunction(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => Container(
        margin: const EdgeInsets.only(
          bottom: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ...createBookingOptions(context).map((e) {
              return Container(
                decoration: BoxDecoration(
                  color: VmodelColors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                width: double.infinity,
                margin: const EdgeInsets.only(left: 12, right: 12, bottom: 4),
                height: 50,
                child: MaterialButton(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  onPressed: e.onTap,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        e.label.toString(),
                        style: e.label == 'Cancel'
                            ? Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: VmodelColors.primaryColor)
                            : Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  List<UploadOptions> createBookingOptions(BuildContext context) {
    return [
      UploadOptions(
          label: "Create a booking",
          onTap: () {
            navigateToRoute(context, const BookingView());
          }),
      UploadOptions(
          label: "Create a smart contract",
          onTap: () {
            navigateToRoute(context, const CreateContractView());
          }),
      UploadOptions(
          label: "Cancel",
          onTap: () {
            Navigator.pop(context);
          }),
    ];
  }
}

String returnLabelBasedOnUser(ProfileTypeEnum profileTypeEnum) {
  if (profileTypeEnum == ProfileTypeEnum.business) {
    return "BUSINESS";
  } else if (profileTypeEnum == ProfileTypeEnum.photographer) {
    return "PHOTOGRAPHER";
  } else {
    return "MODEL";
  }
}

// measurementSnackbar() {
//   return SnackBar(
//     duration: const Duration(days: 5),
//     padding: const EdgeInsets.all(0),
//     backgroundColor: Colors.transparent,
//     content: SizedBox(
//         height: 90,
//         child: Container(
//           decoration: BoxDecoration(color: VmodelColors.white, boxShadow: [
//             BoxShadow(
//               color: VmodelColors.blackColor.withOpacity(0.1),
//               spreadRadius: 0,
//               blurRadius: 9,
//               offset: const Offset(0, 3),
//             )
//           ]),
//           child: Row(
//             children: [
//               for (int i = 0; i < measurementModelList().length; i++)
//                 Expanded(
//                   child: MeasusementTile(
//                     title: measurementModelList()[i].title,
//                     label: measurementModelList()[i].label,
//                   ),
//                 )
//             ],
//           ),
//         )),
//   );
// }
