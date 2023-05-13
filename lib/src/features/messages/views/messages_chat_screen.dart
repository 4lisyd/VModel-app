import 'package:flutter/cupertino.dart';
import 'package:vmodel/src/features/dashboard/dash/controller.dart';
import 'package:vmodel/src/features/messages/views/create_offer.dart';
import 'package:vmodel/src/features/messages/widgets/message_chat_screen_bottom_navigationbar.dart';
import 'package:vmodel/src/features/messages/widgets/receiver_text_message_card.dart';
import 'package:vmodel/src/features/messages/widgets/sender_text_message_card.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/res/typography/textstyle.dart';
import 'package:vmodel/src/shared/appbar/appbar_title_text.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';

class MessagesChatScreen extends StatefulWidget {
  const MessagesChatScreen({super.key});

  @override
  State<MessagesChatScreen> createState() => _MessagesChatScreenState();
}

class _MessagesChatScreenState extends State<MessagesChatScreen> {
  TextEditingController message = TextEditingController();
  bool isTyping = false;

  //to detect the user is typing
  void detectUserIsTyping(String value) {
    setState(() {
      if (value.isNotEmpty) {
        isTyping = true;
      } else {
        isTyping = false;
      }
    });
  }

  String selectedChip = "Model";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: VmodelColors.white,
          leading: const VWidgetsBackButton(),
          centerTitle: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: VModelBoxDecoration.avatarDecoration.copyWith(
                    borderRadius: BorderRadius.circular(100),
                    color: VmodelColors.appBarBackgroundColor,
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/models/listTile_3.png',
                      ),
                      fit: BoxFit.cover,
                    )),
                width: 44,
                height: 44,
              ),
              addHorizontalSpacing(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VWidgetsAppBarTitleText(titleText: 'Messages'),
                  Text(
                    isTyping == true ? "Typing..." : "Active 25m ago",
                    style: VModelTypography1.normalTextStyle.copyWith(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // const ListTile(
          //   minVerticalPadding: 0,

          //   selectedTileColor: Colors.transparent,
          //   dense: false,
          //   contentPadding:  EdgeInsets.all(0),
          //   leading: VWidgetsPictureAvataStyle(
          //     imageHeight: 40,
          //     imageWidth: 40,
          //     imagePath: 'assets/images/models/listTile_3.png',),
          //   title: Text("Temp Messages"),
          //   subtitle: Text("Temp Messages"),

          // ),

          actions: [
            IconButton(
                onPressed: () {},
                icon: const RenderSvg(svgPath: VIcons.exclamation)),
          ],
        ),
        //make textfield come up with keyboard
        // bottomNavigationBar: Padding(
        //   padding: const VWidgetsPagePadding.horizontalSymmetric(18),
        //   child: SizedBox(
        //     height: 68,
        //     child: VWidgetsTextFieldWithMultipleIcons(
        //       hintText: 'Messsage...',
        //       onPressedSuffixFirst: () {},
        //       onPressedSuffixSecond: () {},
        //       onPressedSuffixThird: () {},

        //     ),
        //   ),
        // ),
        body: Stack(
          children: [
            GestureDetector(
                onTap: () {
                  dismissKeyboard();
                },
                child: Padding(
                  padding: const VWidgetsPagePadding.horizontalSymmetric(18),
                  child: ListView(
                    children: [
                      addVerticalSpacing(20),
                      const VWidgetsReceiverTextCard(
                          receiverMessage: "Hello There"),
                      const VWidgetsReceiverTextCard(
                          receiverMessage: "How are you doing today ?"),
                      const VWidgetsSenderTextCard(
                          senderMessage: "Hi, I'm great and you ?",
                          senderImage:
                              'assets/images/jobs_market_images/img.png'),
                      const VWidgetsReceiverTextCard(
                          receiverMessage: "I’m very fine thank you"),
                      const VWidgetsReceiverTextCard(
                          receiverMessage:
                              "I was wondering if you were available to be hired on sunday, we have a job for you…"),
                      const VWidgetsSenderTextCard(
                          senderMessage: "Thanks for getting in touch",
                          senderImage:
                              'assets/images/jobs_market_images/img.png'),
                      const VWidgetsSenderTextCard(
                          senderMessage: "Unfortunately I’m not available",
                          senderImage:
                              'assets/images/jobs_market_images/img.png'),
                    ],
                  ),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 65,
                  color: VmodelColors.white,
                  child: Padding(
                    padding: const VWidgetsPagePadding.horizontalSymmetric(18),
                    child: SizedBox(
                      height: 60,
                      child: VWidgetsTextFieldWithMultipleIcons(
                        isTyping: isTyping,
                        isTypingWidget: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Send",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                            )),
                        controller: message,
                        onChanged: (value) {
                          detectUserIsTyping(value!);
                        },
                        hintText: 'Messsage...',
                        onPressedSuffixFirst: () {},
                        onPressedSuffixSecond: () {},
                        onPressedSuffixThird: () {
                          _modalBuilder(context);

                          // navigateToRoute(context, const BookingSettings());
                          // showCupertinoModalPopup(
                          //   context: context,
                          //   builder: (BuildContext context) => Container(
                          //     margin: const EdgeInsets.only(
                          //       bottom: 10,
                          //     ),
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.end,
                          //       children: [
                          //         ...createBookingOptions(context).map((e) {
                          //           return Container(
                          //             decoration: BoxDecoration(
                          //               color: VmodelColors.white,
                          //               borderRadius: const BorderRadius.all(
                          //                 Radius.circular(10),
                          //               ),
                          //             ),
                          //             width: double.infinity,
                          //             margin: const EdgeInsets.only(
                          //                 left: 12, right: 12, bottom: 4),
                          //             height: 50,
                          //             child: MaterialButton(
                          //               shape: const RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.all(
                          //                   Radius.circular(10),
                          //                 ),
                          //               ),
                          //               onPressed: () {
                          //                 showModalBottomSheet(
                          //                   isScrollControlled: true,
                          //                   isDismissible: false,
                          //                   backgroundColor: Colors.white,
                          //                   context: context,
                          //                   builder: (context) =>
                          //                       DraggableScrollableSheet(
                          //                     expand: false,
                          //                     key: UniqueKey(),
                          //                     initialChildSize: 0.9,
                          //                     maxChildSize: 0.9,
                          //                     minChildSize: .5,
                          //                     builder: (context, controller) =>
                          //                         const CreateOffer(),
                          //                   ),
                          //                 );
                          //               },
                          //               child: GestureDetector(
                          //                 onTap: () {
                          //                   popSheet(context);
                          //                 },
                          //                 child: Column(
                          //                   crossAxisAlignment:
                          //                       CrossAxisAlignment.center,
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.center,
                          //                   children: [
                          //                     Text(
                          //                       e.label.toString(),
                          //                       style: e.label == 'Cancel'
                          //                           ? Theme.of(context)
                          //                               .textTheme
                          //                               .displayMedium!
                          //                               .copyWith(
                          //                                   color: Colors.blue)
                          //                           : Theme.of(context)
                          //                               .textTheme
                          //                               .displayMedium,
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //           );
                          //         }),
                          //       ],
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                    ),
                  ),
                ),
                addVerticalSpacing(15)
              ],
            ),
          ],
        ));
  }
}

List<UploadOptions> createBookingOptions(BuildContext context) {
  return [
    UploadOptions(label: "Create an offer", onTap: () {}),
    UploadOptions(
        label: "Cancel",
        onTap: () {
          popSheet(context);
        }),
  ];
}

void _modalBuilder(BuildContext context) {
  showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text('Create an Offer',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: VmodelColors.primaryColor
                    ),
                    ),
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    isDismissible: false,
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) => DraggableScrollableSheet(
                      expand: false,
                      key: UniqueKey(),
                      initialChildSize: 0.9,
                      maxChildSize: 0.9,
                      minChildSize: .5,
                      builder: (context, controller) => const CreateOffer(),
                    ),
                  );
                },
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text(
                'Cancel', 
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: VmodelColors.primaryColor
                    ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          
          ));
}
