
part of custom_widgets;


//Three button styles used globally in app
//1:CButton
//2:CNewButton
//3:CMenuButton

//used for different custom button styles
enum CButtonType {
  text,
  primary,
  home,
}
//1:CButton
class CButton extends StatelessWidget {
  final String title;
  final void Function()? onClick;
  final CButtonType type;

  const CButton({
    Key? key,
    required this.title,
    this.onClick,
    this.type = CButtonType.primary,
  }) : super(key: key);

  Color _getBackgroundColor() {
    if (type == CButtonType.primary) {
      return AppStyle.maroon;
    } else if (type == CButtonType.text) {
      return Colors.black12.withOpacity(0.06);
    } else {
      return Colors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  CustomOnHoverMouseRegion(
      customWidget: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: _getBackgroundColor(),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: onClick,
          child: Padding(
            padding: AppStyle.buttonPadding,
            child: Text(
              title,
              style: _getTextColor(),
            ),
          ),
        ),
      ),
    );
  }

  _getTextColor() {
    if (type == CButtonType.primary) {
      return TextStyle(color: Colors.white);
    } else {
      return TextStyle(color: Colors.black87);
    }
  }
}

//2:CNewButton
class CNewButton extends StatelessWidget {
  final String title;
  final void Function()? onClick;
  final CButtonType type;

  const CNewButton({
    Key? key,
    required this.title,
    this.onClick,
    this.type = CButtonType.primary,
  }) : super(key: key);

  Color _getBackgroundColor() {
    if (type == CButtonType.primary) {
      return AppStyle.maroon;
    } else if (type == CButtonType.text) {
      return Colors.black12.withOpacity(0.06);
    }else if (type == CButtonType.home) {
      if(onClick==null){
        return Colors.black54;
      }
      return Colors.black87;
    } else {
      // This should never be returned
      return Colors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomOnHoverMouseRegion(
      customWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: _getBackgroundColor(),
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: onClick,
            child: Padding(
              padding: AppStyle.buttonPadding,
              child: Text(
                title,
                style: _getTextColor(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _getTextColor() {
    if (type == CButtonType.primary) {
      return TextStyle(color: Colors.white);
    }else if(type==CButtonType.home){
      return AppStyle.customerButtonHead;
    } else {
      return TextStyle(color: Colors.black87);
    }
  }
}

//3:CMenuButton
class CMenuButton extends StatelessWidget {
  // final String title;
  final void Function()? onPressed;
  Widget child;
  ButtonStyle? style;
  bool? isSeleted;

  CMenuButton({
    Key? key,
    this.onPressed,
    required this.child,
      this.style=null,
    this.isSeleted=false,
  }) : super(key: key);
   ButtonStyle generalStyle=ElevatedButton.styleFrom(
     primary: AppStyle.navBarMenuButtonBg,
     padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
   );

  @override
  Widget build(BuildContext context) {
    if(isSeleted==true)  {
       generalStyle=ElevatedButton.styleFrom(

         textStyle: TextStyle(color: Colors.white),
        primary: AppStyle.customLightAccentColorShade,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      );
    }
    return TextButton(
      onPressed: onPressed,
      style: style??generalStyle,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: child,
      ),
    );
  }
}
