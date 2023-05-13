import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';

class VWidgetsBusinessMyJobsCard extends StatelessWidget {
  final String? profileImage;
  final String? profileName;
  final String? jobDescription;
  final String? location;
  final String? time;
  final String? appliedCandidateCount;
  final String? jobBudget;
  final String? candidateType;
  final VoidCallback? shareJobOnPressed;

  const VWidgetsBusinessMyJobsCard(
      {required this.profileImage,
      required this.profileName,
      required this.jobDescription,
      required this.location,
      required this.time,
      required this.appliedCandidateCount,
      required this.jobBudget,
      required this.candidateType,
      required this.shareJobOnPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
          
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                        color: VmodelColors.appBarBackgroundColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            profileImage!,
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                addHorizontalSpacing(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          profileName!, // e.msg.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                color: VmodelColors.primaryColor,
                              ),
                        ),
                        addHorizontalSpacing(90),
                         GestureDetector(
                          onTap: shareJobOnPressed,
                           child: const  RenderSvg(
                                svgPath: VIcons.shareIcon,
                                svgHeight: 20,
                                svgWidth: 20,
                              ),
                         )
                            
                      ],
                    ),
                    addVerticalSpacing(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///location Icon
                        Row(
                          children: [
                            const NormalRenderSvg(
                              svgPath: VIcons.locationIcon,
                            ),
                            addHorizontalSpacing(5),
                            Text(
                              location!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ],
                        ),
                        addHorizontalSpacing(4),

                        ///time Icon
                        Row(
                          children: [
                            const RenderSvg(
                              svgPath: VIcons.clockIcon,
                              svgHeight: 14,
                              svgWidth: 14,
                              color: VmodelColors.primaryColor,
                            ),
                            addHorizontalSpacing(5),
                            Text(
                              time!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ],
                        ),
                        addHorizontalSpacing(4),
                        Row(
                          children: [
                            const NormalRenderSvg(
                              svgPath: VIcons.walletIcon,
                            ),
                            addHorizontalSpacing(5),
                            Text(
                              "£ $jobBudget",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ],
                        ),
                        addHorizontalSpacing(4),
                        Row(
                          children: [
                            const NormalRenderSvg(
                              svgPath: VIcons.humanIcon,
                            ),
                            addHorizontalSpacing(5),
                            Text(
                              candidateType!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            addVerticalSpacing(12),
            Flexible(
              child: Text(
                jobDescription!, // e.msg.toString(),
                maxLines: 500,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: VmodelColors.primaryColor,
                    ),
              ),
            ),
            addVerticalSpacing(2),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "$appliedCandidateCount offers sent",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
