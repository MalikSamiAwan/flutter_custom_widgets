
part of custom_widgets;

//used for Meals# in meal planner
class CCircleAvatar extends StatelessWidget {
  String title;
  Color? color;
  TextStyle? style;
   CCircleAvatar({Key? key,required this.title,this.color,this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color??AppStyle.customLightAccentColorShade,
      child: CText(title: '${title}',style: style??AppStyle.customCircleAvatar,textOverflow: TextOverflow.ellipsis,),
    );
  }
}
