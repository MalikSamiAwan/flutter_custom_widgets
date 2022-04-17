part of custom_widgets;

//custom widget for selection multiple items from drop/any menu
class CustomMultiSelect extends StatelessWidget {
  final String title;
  final String buttonText;
  TextStyle? buttonTextStyle;
  List<MultiSelectItem<MultiSelectModal?>> items;
  List<MultiSelectModal> selected;
  Function(List)? onSelectionChanged;
  Function(List)? onConfirm;
  MultiSelectChipDisplay? chipDisplay;
  MultiSelectListType? listType;
  bool? searchable;
  String? Function (List<dynamic>? data )? validator;
  Icon? icon;
  CustomMultiSelect({Key? key,required this.title,required this.buttonText,this.buttonTextStyle,required this.items,required this.selected,this.onSelectionChanged,this.chipDisplay,this.listType,this.searchable,this.onConfirm,this.validator,this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiSelectDialogField(
      validator: validator,
      listType: listType??MultiSelectListType.CHIP,
      searchable: searchable??true,
      buttonText: Text(buttonText,style: buttonTextStyle,),
      title: Text(title,),
      items: items.cast(),
      initialValue: selected,
      onConfirm: onConfirm??(values) {},
      onSelectionChanged: onSelectionChanged,
      chipDisplay: chipDisplay??MultiSelectChipDisplay.none(),
      buttonIcon: icon??Icon(Icons.arrow_drop_down_outlined),
      decoration: BoxDecoration(
        color: AppStyle.customW,
        border: Border.all(
          color: Colors.grey,
          width: 0.25,
        ),
      ),
    );
  }
}
//modal for above widget
class MultiSelectModal {
  final int? id;
  final String? name;

  //this was the issue in plugin to solve initial value error
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MultiSelectModal &&
              runtimeType == other.runtimeType &&
              name == other.name;

  int get getId {
    return this.id ?? -1;
  }

  String get getName {
    return this.name ?? '';
  }

  MultiSelectModal({
    this.id,
    this.name,
  });
}

