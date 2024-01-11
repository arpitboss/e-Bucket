import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent=236,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: TSizes.gridViewSpacing,
          crossAxisSpacing: TSizes.gridViewSpacing,
          mainAxisExtent: mainAxisExtent),
      itemBuilder: itemBuilder,
    );
  }
}
