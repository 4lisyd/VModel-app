import 'package:flutter/material.dart';
import 'package:vmodel/src/core/utils/shared.dart';
import 'package:vmodel/src/res/colors.dart';

class UnavailableDates extends StatelessWidget {
  const UnavailableDates({Key? key, required this.date, required this.day, required this.removeFunc}) : super(key: key);

  final String date;
  final String day;
  final Function () removeFunc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(date, style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w600, fontSize: 14, color: VmodelColors.primaryColor),
              ),
              vmSizedH(4),
              Text(day, style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w500, fontSize: 12, color: VmodelColors.primaryColor.withOpacity(0.3)),
              ),
            ],
          ),
          GestureDetector(
              onTap: removeFunc,
              child: const Icon(Icons.close, color: VmodelColors.primaryColor,))
        ],
      ),
    );
  }
}