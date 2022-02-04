part of custom_widgets;

//selectable button
//are used to select day's the meal should be deliver
//and to choose diet restrictions
class CSelectableButton extends StatelessWidget {
  final String text;
  final bool? isSelected;
  final Function(bool selected)? onChanged;
  const CSelectableButton(
      {Key? key, required this.text, this.isSelected, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomOnHoverMouseRegion(
      customWidget: Container(
        child: Material(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black45),
            borderRadius: BorderRadius.circular(5)
          ),
          color: (isSelected ?? false) ? AppStyle.green : AppStyle.redShade,
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: onChanged != null
                ? () {
                    if (onChanged != null) {
                      onChanged!(!(isSelected ?? false));
                    }
                  }
                : null,
            child: Padding(
              padding: AppStyle.buttonPadding,
              child: Text(
                text,
                style: TextStyle(
                    color: (isSelected ?? false) ? AppStyle.customW : Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
