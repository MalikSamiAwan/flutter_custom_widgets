
part of custom_widgets;

//general custom text
Widget CText({required String title, TextStyle? style, TextOverflow? textOverflow}){
  if(textOverflow!=null){
    return Text(
      title,
      style: style==null?AppStyle.cTextStyle:style,
      overflow: textOverflow,
    );
  }
  return Text(
    title,
    style: style==null?AppStyle.cTextStyle:style,
  );
}

//heading general widget and style
Widget CHeadingText({required String title, TextStyle? style}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Text(
      title,
      style: style==null?AppStyle.mainHeadingPageTop:style,
    ),
  );
}

