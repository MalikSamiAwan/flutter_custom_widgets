part of custom_widgets;

//dialog modal
class DialogModal{
  String title;
  BuildContext context;
  String? description;
  String? text;
  Function? onPressed;
  DialogModal({required this.title,required this.context, this.description,this.text,this.onPressed});
}

class CustomDialogs{
  static void simpleDialogBox(DialogModal dialogModal){
    showDialog(context: dialogModal.context,
        builder: (BuildContext context){
          return CustomSimpleDialogBox(
            dialogModal: dialogModal,
          );
        }
    );
  }
  static void customDialogBox(Widget widget,BuildContext context){
    showDialog(context: context,
        builder: (BuildContext context){
          return widget;
        }
    );
  }
}

//dialog style globall
class CustomSimpleDialogBox extends StatefulWidget {
  final DialogModal dialogModal;

   CustomSimpleDialogBox({Key? key, required this.dialogModal,}) : super(key: key);

  @override
  _CustomSimpleDialogBoxState createState() => _CustomSimpleDialogBoxState();
}

class _CustomSimpleDialogBoxState extends State<CustomSimpleDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: Constants.padding,top: Constants.avatarRadius
              + Constants.padding, right: Constants.padding,bottom: Constants.padding
          ),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(widget.dialogModal.title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
              SizedBox(height: 15,),
              Text(widget.dialogModal.description==null?"":widget.dialogModal.description!,style: TextStyle(fontSize: 14),textAlign: TextAlign.center,maxLines: 15,overflow: TextOverflow.fade,),
              SizedBox(height: 22,),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      if(widget.dialogModal.onPressed!=null){
                        widget.dialogModal.onPressed;
                      }
                    },
                    child: Text(widget.dialogModal.text==null?"Exit":widget.dialogModal.text!,style: TextStyle(fontSize: 18,color: Colors.black),)),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: Image.asset("assets/images/alert.png",width: 75,height: 100,)
            ),
          ),
        ),
      ],
    );
  }
}
//used for file level styling
class Constants{
  Constants._();
  static const double padding =20;
  static const double avatarRadius =55;
}

//custom dialog with input fields
