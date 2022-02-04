
part of custom_widgets;

//custom clickable image
class CustomClickableImage extends StatelessWidget {
  VoidCallback? onClick;
  double? width, height;
  String? assetImage;

  CustomClickableImage(
      {Key? key, this.onClick, this.width, this.height, this.assetImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String image = "assets/images/logo.png";
    if (assetImage != null) {
      image = assetImage!;
    }
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Image.asset(
          image,
          width: width != null ? width : 150,
          height: height != null ? height : 120,
        ),
      ),
      onTap: onClick == null
          ? () {
             //navigate to no where
            }
          : onClick,
    );
  }
}
