part of custom_widgets;

class CustomDownloadableButton extends StatefulWidget {
  Key? customKey;
  String? title;
  Future Function()? onPressed;
  Color? color;
  CustomDownloadableButton(
      {Key? key, this.customKey, this.title, this.onPressed, this.color})
      : super(key: key);

  @override
  _CustomDownloadableButtonState createState() =>
      _CustomDownloadableButtonState();
}

class _CustomDownloadableButtonState extends State<CustomDownloadableButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    // if (isPressed) {
    //   return CustomProgressIndicator();
    // }
    return CustomOnHoverMouseRegion(
      customWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: widget.color ?? AppStyle.customGreyColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () async {
              setState(() {
                isPressed = true;
              });
              await widget.onPressed!();
              setState(() {
                isPressed = false;
              });
            },
            child: Padding(
                padding: AppStyle.buttonPadding,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '${widget.title}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                          )),
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: SizedBox(
                            width: 5,
                          )),
                      if (isPressed) ...[
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: CupertinoActivityIndicator(
                              radius: 10,color: Colors.white,)),
                      ] else ...[
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(
                              Icons.cloud_download_outlined,
                              color: Colors.white,
                              size: 12,
                            )),
                      ]
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
    //   CNewButton(
    //   key: widget.customKey,
    //   title: widget.title??'',
    //   type: widget.buttonType??CButtonType.home,
    //   onClick: ()async{
    //     setState(() {
    //       isPressed=true;
    //     });
    //     await widget.onPressed!();
    //     setState(() {
    //       isPressed=false;
    //     });
    //   },
    // );
  }
}
