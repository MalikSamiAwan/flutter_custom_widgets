

part of custom_widgets;

//custom date input field
class CDateField extends StatelessWidget {
  final String title;
  final Function(DateTime? date)? onChanged;
  final DateTime? value;
  final FormFieldValidator<String>? validator;
  final bool autoFocus;
  final double order;
  Key? testingKey;
  final DateTime? firstDate;
  final bool justSameFormattingRequired;

  CDateField({Key? key,testingKey, required this.title, this.onChanged, this.value,this.validator,
    this.autoFocus=false,
    this.order=0,
    this.firstDate,
    this.justSameFormattingRequired=false,
    })
      : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = value.formattedData;
    if(justSameFormattingRequired){
      return Container(
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
              child: TextFormField(
                controller: controller,
                readOnly: true,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(

                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorStyle: AppStyle.errorTextStyle,
                  counterStyle: AppStyle.counterTextStyle,
                  counterText: 'Counter Text',
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.transparent,
                    size: 15,
                  ),
                  isDense: true,
                ),
              ),
            )
          ],
        ),
      );
    }
    return Container(
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
            child: TextFormField(
              key: testingKey!=null?testingKey:Key("test"),
              autofocus: autoFocus,
              validator: validator,
              controller: controller,
              onTap: () async {
                var p = await showDatePicker(
                  context: context,
                  initialDate:firstDate!=null?firstDate!.add(Duration(days: 1)): DateTime.now(),
                  firstDate: firstDate??DateTime.parse("2000-01-01 00:00:00"),//DateTime.now(),
                  lastDate: DateTime.now().add(
                    Duration(
                      days: 500,
                    ),
                  ),
                );
                UIHelper.looseFocus();
                if (onChanged != null) {
                  onChanged!(p);
                }
              },
              readOnly: true,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                errorStyle: AppStyle.errorTextStyle,
                counterStyle: AppStyle.counterTextStyle,
                counterText: 'Counter Text',
                errorBorder: AppStyle.errorFieldBorder,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.zero,
                prefixIcon: Icon(
                  Icons.calendar_today_outlined,
                  size: 15,
                ),
                isDense: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
