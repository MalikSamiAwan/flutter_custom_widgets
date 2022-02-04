part of custom_widgets;

class CustomChip extends StatelessWidget {
  final String title;
  Color? cardColor, textColor;
  TextStyle? style;
  double? horizontalPadding, verticalPadding;
  double? elevation;
  bool? isChip;
  CustomChip(
      {Key? key,
      required this.title,
      this.cardColor,
      this.textColor,
      this.style,
      this.horizontalPadding,
      this.verticalPadding,
      this.elevation,
      this.isChip = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isChip ?? false) {
      return Material(
        color: Colors.transparent,
        child: CustomOnHoverMouseRegion(
          customWidget: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Chip(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                elevation: elevation ?? 2,
                padding: EdgeInsets.symmetric(
                    vertical: verticalPadding ?? 0.5,
                    horizontal: horizontalPadding ?? 3),
                backgroundColor: cardColor ?? Colors.black87,
                shadowColor: Colors.black87,
                // avatar: CircleAvatar(
                //   backgroundImage: NetworkImage(
                //       "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"), //NetwordImage
                // ), //CircleAvatar
                label: Text(
                  title,
                  style: style ?? TextStyle(color: textColor ?? Colors.white),
                ) //Text
            ),
          ),
        ),
      );
    }
    return Material(
      color: Colors.transparent,
      child: CustomOnHoverMouseRegion(
          customWidget: Card(
              elevation: elevation ?? 2,
              color: cardColor ?? Colors.black87,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: verticalPadding ?? 0.5,
                      horizontal: horizontalPadding ?? 3),
                  child: Text(
                    title,
                    style: style ?? TextStyle(color: textColor ?? Colors.white),
                  )))),
    );
  }
}
