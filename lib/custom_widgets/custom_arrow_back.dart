part of custom_widgets;

class CustomBackArrow extends StatelessWidget {
  VoidCallback? onPressed;

  CustomBackArrow({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Go Back",
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: onPressed??() {
          Navigator.of(context).pop();
        },
      )
    );
  }
}
