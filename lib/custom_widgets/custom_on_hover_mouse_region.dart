part of custom_widgets;

class CustomOnHoverMouseRegion extends StatefulWidget {
  Widget customWidget;
  Color? onHoverInColor;
  Color? onHoverOutColor;
   CustomOnHoverMouseRegion({Key? key,required this.customWidget,this.onHoverInColor,this.onHoverOutColor}) : super(key: key);

  @override
  _CustomOnHoverMouseRegionState createState() => _CustomOnHoverMouseRegionState();
}

class _CustomOnHoverMouseRegionState extends State<CustomOnHoverMouseRegion> {
  bool isHovering=false;
  Color color=Colors.transparent;
  @override
  Widget build(BuildContext context) {
    if(isHovering){
      color=widget.onHoverInColor??Colors.transparent;
    }else{
      color=widget.onHoverOutColor??Colors.transparent;
    }
    final hoverdTransform = Matrix4.identity()..scale(1.01);
    final transform=isHovering? hoverdTransform:Matrix4.identity();

    return MouseRegion(
      onEnter: (p){
        setState(() => isHovering = true);
      },
      onExit: (p){
        setState(() => isHovering = false);
      },
      child: AnimatedContainer(
        color: color,
          duration: const Duration(milliseconds: 200),
          curve: Curves.bounceIn,
          transform: transform,
          child: widget.customWidget,
      ),
    );
  }
}
