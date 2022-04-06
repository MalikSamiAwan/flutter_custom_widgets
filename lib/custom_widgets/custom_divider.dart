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

class CustomDivider extends StatelessWidget {
  double? padding;
  double? thickness;
  double? height;
  CustomDivider({Key? key,this.padding=10,this.thickness=3,this.height=5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding!),
      child: Divider(height: height,thickness: thickness,),
    );
  }
}
