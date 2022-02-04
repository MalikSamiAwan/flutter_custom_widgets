part of custom_widgets;



class CustomDownloadableButton extends StatefulWidget {
  Key? customKey;
  String? title;
  CButtonType? buttonType;
  Future Function()? onPressed;
   CustomDownloadableButton({Key? key,this.customKey,this.title,this.buttonType,this.onPressed}) : super(key: key);

  @override
  _CustomDownloadableButtonState createState() => _CustomDownloadableButtonState();
}

class _CustomDownloadableButtonState extends State<CustomDownloadableButton> {
  bool isPressed=false;
  @override
  Widget build(BuildContext context) {
    if(isPressed){
      return CustomProgressIndicator();
    }
    return CNewButton(
      key: widget.customKey,
      title: widget.title??'',
      type: widget.buttonType??CButtonType.home,
      onClick: ()async{
        setState(() {
          isPressed=true;
        });
        await widget.onPressed!();
        setState(() {
          isPressed=false;
        });
      },
    );
  }
}
