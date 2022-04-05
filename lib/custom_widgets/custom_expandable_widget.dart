
part of custom_widgets;

class CustomExpandableWidget extends StatefulWidget {
  final Widget parent;
  final Widget child;

  const CustomExpandableWidget(
      {Key? key,
        required this.parent,
        required this.child,
      })
      : super(key: key);

  @override
  _CustomExpandableWidgetState createState() => _CustomExpandableWidgetState();
}

class _CustomExpandableWidgetState extends State<CustomExpandableWidget> {
  bool isOpened = false;
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: MouseRegion(
          onEnter: (p) {
            setState(() => isHover = true);
          },
          onExit: (p) {
            setState(() => isHover = false);
          },
          child: Card(
            elevation: isHover ? 2.5 : 0.5,
            child: AnimatedContainer(
              // color: isHover?Colors.red:Colors.black,
              duration: const Duration(milliseconds: 200),
              // curve: Curves.bounceIn,
              // transform: isHover
              //     ? (Matrix4.identity()..scale(1.01))
              //     : Matrix4.identity(),
              //above two remove because of removing scale in feature
              child: Column(
                children: [
                  // widget.parent,
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {

                      setState(() {
                        isOpened = !isOpened;
                      });
                    },
                    child: widget.parent,
                  ),
                  if (isOpened) ...[widget.child],
                ],
              ),
            ),
          )),
    );
  }
}