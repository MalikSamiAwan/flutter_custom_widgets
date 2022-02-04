part of custom_widgets;

//there are two types

//type1
class CSelectField<T> extends StatelessWidget {
  final String title;
  final List<T> options;
  final BoxConstraints constraints;
  final T? value;
  final Function(T? value)? onChanged;
  final FormFieldValidator<T>? validator;
  final Widget Function(T value)? builder;
  final bool autoFocus;
  final double order;

  const CSelectField({Key? key,
    required this.title,
    this.onChanged,
    required this.options,
    required this.value,
    this.builder,
    this.constraints = const BoxConstraints.tightFor(),
    this.validator,
    this.autoFocus = false,
    this.order = 0,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      padding: AppStyle.fieldPaddingGlobal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppStyle.fieldTitlePadding,
            child: Text(
              title,
              style: AppStyle.fieldTitleTextStyle,
            ),
          ),
          FocusTraversalOrder(
            order: NumericFocusOrder(order),
            child: DropdownButtonFormField(
                autofocus: autoFocus,
                validator: validator,
                onChanged: (T? x) {
                  if (onChanged != null) {
                    onChanged!(x);
                  }
                  // UIHelper.looseFocus();
                },
                value: value,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  errorStyle: AppStyle.errorTextStyle,
                  counterStyle: AppStyle.counterTextStyle,
                  counterText: 'Counter Text',
                  errorBorder: AppStyle.errorFieldBorder,
                  isDense: true,
                  // contentPadding: EdgeInsets.zero,
                  contentPadding: AppStyle.fieldContentPadding,
                ),
                items: options
                    .map(
                      (e) =>
                      DropdownMenuItem(
                        child: builder != null
                            ? builder!(e)
                            : Text(
                          e.toString(),
                        ),
                        value: e,
                      ),
                )
                    .toList()),
          ),
        ],
      ),
    );
  }
}

//type2
class CSelectFieldNew<T> extends StatelessWidget {
  final String title;
  final List<T> options;
  final BoxConstraints constraints;
  final T? value;
  final Function(T? value)? onChanged;
  final FormFieldValidator<T>? validator;
  final Widget Function(T value)? builder;
  final bool autoFocus;
  final double order;
  final bool hasTitle;

  const CSelectFieldNew(
      {Key? key,
        required this.title,
        this.onChanged,
        required this.options,
        required this.value,
        this.builder,
        this.constraints = const BoxConstraints.tightFor(),
        this.validator,
        this.autoFocus=false,
        this.order=0,
        this.hasTitle=true,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      padding: AppStyle.fieldPaddingGlobal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(hasTitle)...[
            Padding(
              padding: AppStyle.fieldTitlePadding,
              child: Text(
                title,
                style: AppStyle.fieldTitleTextStyle,
              ),
            ),
          ],
          FocusTraversalOrder(
            order: NumericFocusOrder(order),
            child: DropdownButtonFormField(
              isExpanded: true,
                autofocus: autoFocus,
                validator: validator,
                onChanged: (T? x) {
                  if (onChanged != null) {
                    onChanged!(x);
                  }
                  // UIHelper.looseFocus();
                },
                value: value,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  errorStyle: AppStyle.errorTextStyle,
                  counterStyle: AppStyle.counterTextStyle,
                  counterText: 'Counter Text',
                  errorBorder: AppStyle.errorFieldBorder,
                  isDense: true,
                  // contentPadding: EdgeInsets.zero,
                  contentPadding: AppStyle.fieldContentPadding,
                ),
                items: options
                    .map(
                      (e) => DropdownMenuItem(
                    child: builder != null
                        ? builder!(e)
                        : Text(
                      e.toString(),
                    ),
                    value: e,
                  ),
                )
                    .toList()),
          ),
        ],
      ),
    );
  }
}
