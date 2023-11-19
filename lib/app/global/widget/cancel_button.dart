import 'package:fit_notes/app/global/const/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 24.r,
        width: 24.r,
        decoration: const BoxDecoration(
            color: ColorsApp.darkGrey, shape: BoxShape.circle),
        child:
            Icon(CupertinoIcons.clear, color: ColorsApp.lightGrey, size: 16.r),
      ),
    );
  }
}
