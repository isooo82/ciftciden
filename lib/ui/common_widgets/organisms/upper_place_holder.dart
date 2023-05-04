import 'package:ciftciden/ui/constants/paths.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UpperPlaceHolder extends StatelessWidget {
  const UpperPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Image.asset(CiftcidenPaths.ciftcidenLogo),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 0.w),
                child: Image.asset(CiftcidenPaths.sutKovasi, width: 25.w, height: 10.h),
              ),
              const Text(
                'ÇİFTÇİDEN',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 45,
                  fontWeight: FontWeight.w400,
                  height: 1.15,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
