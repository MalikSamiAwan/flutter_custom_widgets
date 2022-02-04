part of custom_widgets;

class CDivider extends StatelessWidget {
  double? height,thickness;
   CDivider({Key? key,this.height,this.thickness}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height!=null?height:50,
      thickness: thickness!=null?thickness:4,
    );
  }
}
