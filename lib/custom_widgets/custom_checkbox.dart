

part of custom_widgets;

//custom checkbox
class CCheckbox extends StatelessWidget {
  final String title;
  final bool? isChecked;
  final Function(bool? isChecked)? onChanged;
  final double order;
  final bool autoFocus;
  Key? testingKey;

  CCheckbox({
    Key? key,
    testingKey,
    required this.title,
    this.isChecked,
    this.onChanged,
    this.autoFocus = false,
    this.order = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        FocusTraversalOrder(
            order: NumericFocusOrder(order),
            child: Checkbox(
              value: isChecked,
              onChanged: onChanged,
              autofocus: autoFocus,
            )),
        Flexible(
          fit: FlexFit.loose,
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ));
  }
}
