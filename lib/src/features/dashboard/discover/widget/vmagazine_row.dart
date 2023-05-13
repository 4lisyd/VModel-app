import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/vmodel.dart';

class VMagazineRow extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  const VMagazineRow({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10, right: 18, left: 18),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 9,
                spreadRadius: 0,
                offset: Offset(3, 3))
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image),
          ),
          vmSizedW(20),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.displayMedium
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 11.5.sp),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              addVerticalSpacing(5),
              Text(
                subTitle,
                style: textTheme.displaySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            ],
          ))
        ],
      ),
    );
  }
}
