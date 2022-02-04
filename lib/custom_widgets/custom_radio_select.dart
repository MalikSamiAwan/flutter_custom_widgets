
part of custom_widgets;

class CRadioSelect extends StatelessWidget {
  final String title;
  final Iterable<String> options;
  final Function(String? value)? onChanged;
  final String? value;
  final bool autoFocus;
  final double order;
  const CRadioSelect({
    Key? key,
    required this.title,
    required this.options,
    this.onChanged,
    required this.value,
    this.autoFocus=false,
    this.order=0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyle.fieldPaddingGlobal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppStyle.fieldTitlePadding,
            child: Text(
              title,
              style: AppStyle.fieldTitleTextStyle,
            ),
          ),
          Wrap( alignment: WrapAlignment.start,
            children: options
                .mapIndexed(
                  (index,e) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FocusTraversalOrder(
                        order: NumericFocusOrder(order),
                        child: Radio(
                         splashRadius: 10,
                          value: e,
                          groupValue: value,
                          onChanged: onChanged,
                        ),
                      ),
                      Text(e,overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
