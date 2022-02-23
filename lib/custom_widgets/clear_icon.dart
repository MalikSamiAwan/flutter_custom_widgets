part of custom_widgets;

Icon clearIcon(){
  return Icon(Icons.clear,color: Colors.red,size: 8,);
}
class ClearIcon extends StatelessWidget {
  const ClearIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.clear,color: Colors.red,size: 8,);
  }
}
