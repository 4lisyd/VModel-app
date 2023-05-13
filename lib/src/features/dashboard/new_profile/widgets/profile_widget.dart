import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/vmodel.dart';

class VWidgetsProfileCard extends StatelessWidget {
  final String? profileImage;
  final String? mainBio;
  const VWidgetsProfileCard({
    super.key,
    required this.profileImage,
    required this.mainBio,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 3, color: VmodelColors.primaryColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(width: 1, color: VmodelColors.primaryColor),
                  image: DecorationImage(
                      image: AssetImage(profileImage!), fit: BoxFit.cover)),
            ),
          ),
        ),
        addHorizontalSpacing(12),
        Flexible(
          child: Row(
            // alignment: Alignment.bottomCenter,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  mainBio!,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
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
      ],
    );
  }
}
