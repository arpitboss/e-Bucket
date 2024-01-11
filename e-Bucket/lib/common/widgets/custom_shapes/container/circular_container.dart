import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';
import '../../../../utils/constants/colors.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.width,
    this.height,
    this.radius=TSizes.cardRadiusLg,
    this.margin,
    this.padding,
    this.child,
    this.backgroundColor = TColors.white,
    this.showBorder = false,
    this.borderColor = TColors.grey,
  });

  final double? width;
  final double? height;
  final double radius;
  final bool showBorder;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: showBorder ? Border.all(color: borderColor) : null,
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
