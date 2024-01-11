import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.bgColor = TColors.light,
    this.fit = BoxFit.fitWidth,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = TSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? bgColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: THelperFunctions.isDarkMode(context) ? TColors.dark : bgColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Image(
              fit: fit,
              width: 300,
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider,
            )),
      ),
    );
  }
}
