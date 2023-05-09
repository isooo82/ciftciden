import 'package:ciftciden/ui/constants/paths.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UpperPlaceHolderWithHouses extends StatelessWidget {
  const UpperPlaceHolderWithHouses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(right: 0.w),
        child: Image.asset(CiftcidenPaths.osmaneliKonaklari, fit: BoxFit.cover),
      ),
    );
  }
}
