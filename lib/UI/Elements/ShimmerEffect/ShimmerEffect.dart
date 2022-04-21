import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:provider/provider.dart';

import '../../../Providers/ThemeProvider.dart';




class CustomShimmerEffect extends StatelessWidget {
  final Widget? child;
   CustomShimmerEffect({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(seconds: 2),
      baseColor: Provider.of<ThemeProvider>(context).shimmerColor,
      highlightColor: Colors.grey.shade100.withOpacity(0.5),
      child: child!,
    );
    // gradient: LinearGradient(
    //     colors: [Color(0xFFDEDEDE), Color(0xFFFFFFFF), Color(0xFFDEDEDE)]));
  }
}
