import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Constants/AppColors.dart';


class CustomShimmerEffect extends StatelessWidget {
  final Widget? child;
  const CustomShimmerEffect({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(seconds: 2),
      baseColor: AppColors.shimmerColor,
      highlightColor: Colors.grey.shade100.withOpacity(0.5),
      child: child!,
    );
    // gradient: LinearGradient(
    //     colors: [Color(0xFFDEDEDE), Color(0xFFFFFFFF), Color(0xFFDEDEDE)]));
  }
}
