part of custom_widgets;

//text field input
class CTextField extends StatefulWidget {
  final String title;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool expands;
  final int minLines;
  final String? initialValue;
  final String? value;
  final bool numbersOnly;
  final bool? readOnly;
  final FormFieldValidator<String>? validator;
  final bool autoFocus;
  double order;
  bool hasTitle;
  bool obscureText;
  bool showError;
  CTextField({
    Key? key,
    required this.title,
    this.onChanged,
    this.onFieldSubmitted,
    this.expands = false,
    this.minLines = 1,
    this.value,
    this.initialValue,
    this.numbersOnly = false,
    this.validator,
    this.autoFocus=false,
    this.order=0,
    this.readOnly,
    this.hasTitle=true,
    this.obscureText=false,
    this.showError=false
  }) : super(key: key);

  @override
  State<CTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.value==null||widget.value!.isEmpty||widget.value=="null"){
      controller.text = "";
    }else{
      controller.text = widget.value!;
    }
    return Container(
      padding: AppStyle.fieldPaddingGlobal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.hasTitle)...[
            Padding(
              padding: AppStyle.fieldTitlePadding,
              child: Text(
                widget.title,
                style: AppStyle.fieldTitleTextStyle,
              ),
            ),
          ],

          FocusTraversalOrder(
            order: NumericFocusOrder(widget.order),
            child: TextFormField(
              obscureText: widget.obscureText,
              onFieldSubmitted: widget.onFieldSubmitted,
              readOnly: widget.readOnly??false,
              controller: controller,
              autofocus: widget.autoFocus,
              validator: widget.validator,
              // initialValue: initialValue!,
              expands: widget.expands,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: widget.onChanged,
              maxLines: widget.expands ? null : widget.minLines,
              minLines: widget.expands ? null : widget.minLines,
              inputFormatters: [if (widget.numbersOnly) FilteringTextInputFormatter.digitsOnly],
              decoration: widget.showError?
              InputDecoration(
                isDense: true,
                border: OutlineInputBorder(),
                errorBorder: AppStyle.errorFieldBorder,
                contentPadding: AppStyle.fieldContentPadding,
              ):
              InputDecoration(
                errorStyle:  AppStyle.errorTextStyle,
                counterStyle: AppStyle.counterTextStyle,
                counterText: 'Counter Text',
                isDense: true,
                border: OutlineInputBorder(),
                errorBorder: AppStyle.errorFieldBorder,
                contentPadding: AppStyle.fieldContentPadding,
              ),
            ),
          )
        ],
      ),
    );
  }
}