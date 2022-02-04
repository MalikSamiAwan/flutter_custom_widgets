
part of custom_widgets;

//custom number is used to choose number of meals
class CNumberPicker extends StatelessWidget {
  final int? value;
  final String title;
  final int max;
  final int min;
  final Function(int value)? onChanged;
  bool hoverEffect;

  CNumberPicker({
    Key? key,
    required this.value,
    required this.title,
    this.max = 99,
    this.min = 0,
    this.onChanged,
    this.hoverEffect = true,
  }) : super(key: key);

  final ValueNotifier<bool> ad = ValueNotifier<bool>(false);
  final ValueNotifier<bool> rm = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: constraints.maxWidth != double.infinity ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
            children: [
              hoverEffect
                  ? ValueListenableBuilder<bool>(
                      builder:
                          (BuildContext context, bool hover, Widget? child) {
                        return Container(
                          decoration: BoxDecoration(
                              color:
                                  hover ? AppStyle.customB : AppStyle.customT,
                              border: Border(
                                top: BorderSide(color: Colors.grey),
                                right: BorderSide(color: Colors.grey),
                              )),
                          child: InkWell(
                            onHover: (hover) {
                              rm.value = hover;
                            },
                            // onTapDown: (x){
                            //     Future.delayed(Duration(seconds: 2)).then((value) {
                            //       ppprint("LOOONG");
                            //     });
                            // },
                            onTap: (value ?? 0) > min
                                ? () {
                                    if (onChanged != null) {
                                      onChanged!((value ?? 0) - 1);
                                    }
                                  }
                                : null,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color:
                                    hover ? AppStyle.customW : AppStyle.customB,
                              ),
                            ),
                          ),
                        );
                      },
                      valueListenable: rm,
                    )
                  : Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                        ),
                      ),
                      child: InkWell(
                        onHover: (hover) {},
                        onTap: (value ?? 0) > min
                            ? () {
                                if (onChanged != null) {
                                  onChanged!((value ?? 0) - 1);
                                }
                              }
                            : null,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            Icons.remove,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
              Container(
                width: 60,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  (value ?? 0).toString(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              hoverEffect
                  ? ValueListenableBuilder<bool>(
                      builder:
                          (BuildContext context, bool hover, Widget? child) {
                        return Container(
                          decoration: BoxDecoration(
                              color:
                                  hover ? AppStyle.customB : AppStyle.customT,
                              border: Border(
                                top: BorderSide(color: Colors.grey),
                                left: BorderSide(color: Colors.grey),
                              )),
                          child: HoldDetector(
                            holdTimeout: Duration(seconds: 1),
                            onHold: () {
                              if (onChanged != null) {
                                onChanged!((value ?? 0) + 1);
                              }
                            },
                            child: InkWell(
                              onHover: (hover) {
                                ad.value = hover;
                              },

                              onTap: (value ?? 0) < max
                                  ? () {
                                      if (onChanged != null) {
                                        onChanged!((value ?? 0) + 1);
                                      }
                                    }
                                  : null,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Icon(
                                  Icons.add,
                                  size: 18,
                                  color: hover
                                      ? AppStyle.customW
                                      : AppStyle.customB,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      valueListenable: ad,
                    )
                  : Container(
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(color: Colors.grey),
                        left: BorderSide(color: Colors.grey),
                      )),
                      child: HoldDetector(
                        holdTimeout: Duration(seconds: 1),
                        onHold: () {
                          if (onChanged != null) {
                            onChanged!((value ?? 0) + 1);
                          }
                        },
                        child: InkWell(

                          onTap: (value ?? 0) < max
                              ? () {
                                  if (onChanged != null) {
                                    onChanged!((value ?? 0) + 1);
                                  }
                                }
                              : null,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(
                              Icons.add,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
