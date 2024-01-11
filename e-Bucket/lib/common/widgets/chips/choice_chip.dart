import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../utils/constants/colors.dart';

class ReusableChoiceChip extends StatelessWidget {
  const ReusableChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        onSelected: onSelected,
        avatar: isColor
            ? CircularContainer(
                width: 50,
                height: 50,
                backgroundColor: THelperFunctions.getColor(text)!,
              )
            : null,
        shape: isColor ? const CircleBorder() : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        backgroundColor: isColor ? Colors.green : null,
      ),
    );
  }
}
