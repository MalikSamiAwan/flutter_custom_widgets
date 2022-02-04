
part of custom_widgets;

class CFloatingActionButton extends StatelessWidget {
  Icon icon;
  VoidCallback onPressed;
  Color? bg;
  Color? hoverColor;
  CFloatingActionButton({Key? key,this.bg,this.hoverColor,required this.icon,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      hoverColor: hoverColor??AppStyle.customAccentColor,
      onPressed: onPressed,
      child: icon,
      backgroundColor: this.bg??AppStyle.customB,
    );
  }
}
