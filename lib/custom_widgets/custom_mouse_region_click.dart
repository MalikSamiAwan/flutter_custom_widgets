
part of custom_widgets;

class CChangeMouseAsHand extends StatelessWidget {
  final Widget child;
  const CChangeMouseAsHand({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: child,
    );
  }
}
