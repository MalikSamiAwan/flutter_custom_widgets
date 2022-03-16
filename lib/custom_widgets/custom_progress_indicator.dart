part of custom_widgets;

class CustomProgressIndicator extends StatelessWidget {
  double? stroke;
  bool isCircular;
  bool isCupertino;
  Color? color;
   CustomProgressIndicator({Key? key,this.stroke,this.isCircular=false,this.isCupertino=true,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCircular?
    isCupertino?CupertinoActivityIndicator(
      radius: 20,
    ):
      CircularProgressIndicator(
      strokeWidth: stroke??4,
        color: color??AppStyle.customB,
    ):
        LinearProgressIndicator()
    ;
  }
}


class DeleteProgressIndicator extends StatelessWidget {
  const DeleteProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}

