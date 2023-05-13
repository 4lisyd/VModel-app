import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/utils/enum/profile_types.dart';
import '../../../../core/utils/share.dart';
import '../../../../res/icons.dart';
import '../../../../res/res.dart';
import '../../../../res/typography/textstyle.dart';
import '../../../../shared/cupertino_modal_pop_up/cupertino_action_sheet.dart';
import '../../../../shared/rend_paint/render_svg.dart';
import '../../../../vmodel.dart';
import '../../profile/view/profile_main_view.dart';
import '../controller/feed_controller.dart';
import '../data/field_mock_data.dart';
import 'feed_row_icons.dart';
import 'send.dart';
import 'share.dart';
import 'user_small_image.dart';

class UserPost extends StatefulWidget {
  const UserPost(
      {Key? key,
      required this.username,
      required this.homeCtrl,
      required this.imageList,
      required this.smallImageAsset})
      : super(key: key);

  final String username;
  final HomeController homeCtrl;
  final List imageList;
  final String smallImageAsset;

  @override
  _UserPostState createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  bool readMore = false;
  void showMore() {
    setState(() {
      readMore = !readMore;
    });
  }

  bool likeBool = false;
  void likePost() {
    setState(() {
      likeBool = !likeBool;
    });
  }

  bool saveBool = false;
  void savePost() {
    setState(() {
      saveBool = !saveBool;
    });
  }

  int tapCount = 0;

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 11,
            right: 8,
            bottom: 8,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  UserSmallImage(imageAsset: widget.smallImageAsset),
                  addHorizontalSpacing(3),
                  Text(
                    widget.username,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                  )
                ],
              ),
              IconButton(
                onPressed: () {
                  _modalBuilder(context, widget.username);
                },
                icon: const RenderSvg(
                  svgPath: VIcons.threeDotsIconVertical,
                  svgWidth: 5,
                  svgHeight: 5,
                ),
              ),
            ],
          ),
        ),
        RawGestureDetector(
          gestures: {
            SerialTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<
                    SerialTapGestureRecognizer>(
                () => SerialTapGestureRecognizer(),
                (SerialTapGestureRecognizer instance) {
              instance.onSerialTapDown = (SerialTapDownDetails details) {
                if (details.count == 3) {
                  savePost();
                }
                if (details.count == 2) {
                  setState(() {
                    likeBool = true;
                  });
                }
              };
            })
          },
          child: GestureDetector(
            onLongPress: () {
              VUtilsShare.onShare(
                  context,
                  imagesList,
                  "VModel \nMy first shoot with Afrogarm. I’m so excited for the future to come! I never actually believed I would be picked when I applied, but I got in! I’m sooooooooo happy!",
                  "My first shoot with Afrogarm. I’m so excited for the future to come! I never actually believed I would be picked when I applied, but I got in! I’m sooooooooo happy!t");
            },
            child: CarouselSlider(
              items: List.generate(
                widget.imageList.length,
                (index) => Image.asset(
                  widget.imageList[index],
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              options: CarouselOptions(
                viewportFraction: 1,
                aspectRatio: 0,
                initialPage: 0,
                enableInfiniteScroll: true,
                onPageChanged: (value, reason) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                height: 470,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20.65, right: 23.47),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: FeedFirstRowIcons(
                    imageList: imagesList,
                    saved: () {
                      Fluttertoast.showToast(
                          msg: saveBool ? "Unsaved" : "Saved",
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: VmodelColors.black.withOpacity(0.6),
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      savePost();
                    },
                    shareFunction: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        isDismissible: true,
                        useRootNavigator: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => const ShareWidget(
                          shareLabel: 'Share Post',
                          shareTitle: 'Samantha\'s Post',
                          shareImage: 'assets/images/doc/main-model.png',
                          shareURL: 'Vmodel.app/post/samantha-post',
                        ),
                      );
                    },
                    saveAmount: "300",
                    savedBool: saveBool,
                  )),
              if (widget.imageList.length > 1)
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.imageList.asMap().entries.map((entry) {
                      return GestureDetector(
                        child: Container(
                          width: 5.92,
                          height: 5.95,
                          margin: const EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 2.525),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor.withOpacity(
                                currentIndex == entry.key ? 1 : 0.2),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              FeedSecondRowIcons(
                send: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    isDismissible: true,
                    useRootNavigator: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => const SendWidget(),
                  );
                },
                like: () {
                  likePost();
                },
                likeAmount: "50.3k",
                likedBool: likeBool,
              ),
            ],
          ),
        ),

        vmSizedH(5),
        Padding(
          padding: const VWidgetsPagePadding.horizontalSymmetric(12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AutoSizeText.rich(TextSpan(children: [
              //
              // TextSpan(
              //   text: "Afrogarm",
              //   recognizer: TapGestureRecognizer()
              //     ..onTap = () {
              //       navigateToRoute(
              //           context,
              //           const ProfileMainView(
              //             profileTypeEnumConstructor: ProfileTypeEnum.business,
              //           ));
              //     },
              //   style: Theme.of(context).textTheme.displayMedium!.copyWith(
              //       color: VmodelColors.text2,
              //       fontWeight: FontWeight.w500,
              //       fontSize: 14),
              // ),

              // TextSpan(
              //   text: "My first shoot with ",
              //   style: Theme.of(context).textTheme.displayMedium!.copyWith(
              //       color: VmodelColors.text,
              //       fontWeight: FontWeight.w500,
              //       fontSize: 14),
              // ),
              TextSpan(
                text: "${widget.username}  ",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: VmodelColors.text,
                      fontWeight: FontWeight.w600,
                    ),
              ),

              TextSpan(
                text: "My first shoot with ",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: VmodelColors.text,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              TextSpan(
                text: "Afrogarm",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    navigateToRoute(
                        context,
                        const ProfileMainView(
                          profileTypeEnumConstructor: ProfileTypeEnum.business,
                        ));
                  },
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: VmodelColors.text2,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              TextSpan(
                text:
                    ". I’m so excited for the future to come! I never actually believed I would be picked when",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: VmodelColors.text,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              if (readMore == true)
                TextSpan(
                  text: "  I applied, but I got in! I’m sooooooooo happy!",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: VmodelColors.text,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              TextSpan(
                text: readMore == false ? " ..more" : " ..show less",
                recognizer: TapGestureRecognizer()..onTap = () => showMore(),
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: VmodelColors.text2,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ])),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 18),
        //   child: ReadMoreText(
        //       'My first shoot with Jd Official. I’m so excited for the future to come! I never actually believed I would be picked when I applied, but I got in! I’m sooooooooo happy!',
        //       trimLines: 2,
        //       // colorClickableText: Colors.pink,
        //       trimMode: TrimMode.Line,
        //       trimCollapsedText: 'more',
        //       trimExpandedText: '',
        //       style: Theme.of(context).textTheme.displayMedium!.copyWith(
        //           color: VmodelColors.text,
        //           fontWeight: FontWeight.w500,
        //           fontSize: 14),
        //       lessStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
        //           color: VmodelColors.text2,
        //           fontWeight: FontWeight.w500,
        //           fontSize: 14),
        //       moreStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
        //           color: VmodelColors.text2,
        //           fontWeight: FontWeight.w500,
        //           fontSize: 14)),
        // ),
      ],
    );
  }

  void _modalBuilder(BuildContext context, String text) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
              // title: Text(''),
              // message: Text(''),
              actions: <Widget>[
                if (text == "Samanthas")
                  VCupertinoActionSheet(
                      color: VmodelColors.white,
                      text: 'Edit',
                      onPressed: () {
                        popSheet(context);
                        _showActionSheet(context, "Samanths");
                      }),
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'Share',
                ),
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'Save',
                ),
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'Send',
                ),
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'Copy Link',
                ),
                if (text == "Samanthas")
                  VCupertinoActionSheet(
                    color: VmodelColors.white,
                    text: 'Archive',
                  ),
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'Add to favourites',
                ),
                if (text == "Samanthas")
                  VCupertinoActionSheet(
                    color: VmodelColors.white,
                    text: 'Make portfolio main photo',
                  ),
                if (text == "Samanthas")
                  VCupertinoActionSheet(
                    color: VmodelColors.white,
                    text: 'Make polaroid main photo',
                  ),
                if (text == "Samanthas")
                  VCupertinoActionSheet(
                    color: VmodelColors.white,
                    text: 'Delete photo',
                    style: VmodelTypography2.kTitleRedStyle,
                  ),
              ],

              cancelButton: const VCupertinoActionSheet(
                text: 'Cancel',
              ),
            ));
  }

  void _showActionSheet(BuildContext context, String text) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
              actions: <Widget>[
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'follow user',
                  onPressed: () {
                    popSheet(context);
                    _showActionSheet2(context);
                  },
                ),
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'Share',
                ),
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'Save',
                ),
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'Send',
                ),
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'Message model',
                ),
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'Book model',
                ),
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'Report photo',
                  style: VmodelTypography2.kTitleRedStyle,
                ),
              ],
              cancelButton: const VCupertinoActionSheet(
                text: 'Cancel',
              ),
            ));
  }

  void _showActionSheet2(BuildContext context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
              actions: <Widget>[
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'unfollow user',
                ),
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'Share',
                ),
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'Save',
                ),
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'Send',
                ),
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'Message model',
                ),
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'Book model',
                ),
                VCupertinoActionSheet(
                  color: VmodelColors.white,
                  text: 'Report photo',
                  style: VmodelTypography2.kTitleRedStyle,
                ),
              ],
              cancelButton: const VCupertinoActionSheet(
                text: 'cancel',
              ),
            ));
  }
}
