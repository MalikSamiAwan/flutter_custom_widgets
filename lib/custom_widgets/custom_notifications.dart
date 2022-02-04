part of custom_widgets;

//below is the structure of notification file
// NotificationTypeEnum //types of notifcations
// NotificationModal // general notification modal
// ImageGlobalModal // image in notification
// CustomNotificaton // design1
// CustomNotificationNewUiWidget // design2
// CustomNotificationNewUiWidgetFinalized // design3
// CustomNotificationWidget // design widget

//types of notifcations
enum NotificationTypeEnum {
  simpleNotification,
  customDesingOneNotification,
  customDesingTwoNotification,
}

// general notification modal
class NotificationModal {
  NotificationTypeEnum? notificationType;
  String title;
  String subtitle;
  Function? action;
  bool? autoDissmiss;
  Icon? icon;
  Duration? duration;
  ImageGlobalModal? image;
  Widget? actionWidgets; //only used in new design widget

  NotificationModal({
    this.notificationType = NotificationTypeEnum.simpleNotification,
    required this.title,
    required this.subtitle,
    this.action,
    this.autoDissmiss = true,
    this.duration = Duration.zero,
    this.icon = const Icon(Icons.cancel),
    this.image,
    this.actionWidgets,
  });
}

// image in notification
class ImageGlobalModal {
  bool isAsset;
  String url;

  ImageGlobalModal({required this.isAsset, required this.url});
}

// design1
class CustomNotificaton {
  //simple notification
  static dynamic showNotification(NotificationModal notificationModal) {
    showOverlay((context, t) {
      return Container(
        color: Color.lerp(Colors.transparent, Colors.black54, t),
        child: FractionalTranslation(
          translation: Offset.lerp(const Offset(0, -1), const Offset(0, 0), t)!,
          child: Column(
            children: <Widget>[
              if (notificationModal.notificationType ==
                  NotificationTypeEnum.simpleNotification) ...[
                CustomNotificationWidget(
                  notificationModal: notificationModal,
                ),
              ]else if(notificationModal.notificationType ==
                  NotificationTypeEnum.customDesingTwoNotification)...[
                CustomNotificationNewUiWidgetFinalized(notificationModal: notificationModal,),
              ] else ...[
                CustomNotificationNewUiWidget(
                  notificationModal: notificationModal,
                ),
              ],
            ],
          ),
        ),
      );
    },
        duration: (notificationModal.autoDissmiss! &&
            notificationModal.duration == Duration.zero)
            ? null
            : notificationModal.duration);
  }
  //multiple notification
  static dynamic showMultipleNotification(
      List<NotificationModal> notificationModalList) {
    List<Widget> customWidgets = notificationModalList
        .map((e) {
          return CustomNotificationWidget(
            notificationModal: e,
          );
        })
        .cast<Widget>()
        .toList();

    showOverlay((context, t) {
      return Container(
        color: Color.lerp(Colors.transparent, Colors.black54, t),
        child: FractionalTranslation(
          translation: Offset.lerp(const Offset(0, -1), const Offset(0, 0), t)!,
          child: Column(
            children: customWidgets,
          ),
        ),
      );
    }, duration: Duration.zero);
  }
  //multiple notification one after other
  static dynamic showMultipleNotificationIndependently(
      List<NotificationModal> notificationModalList) async {
    final random = Random();
    for (int i = 0; i < notificationModalList.length; i++) {
      await Future.delayed(Duration(milliseconds: 200 + random.nextInt(200)));
      showOverlay((context, t) {
        return Container(
          color: Color.lerp(Colors.transparent, Colors.black54, t),
          child: FractionalTranslation(
            translation:
                Offset.lerp(const Offset(0, -1), const Offset(0, 0), t)!,
            child: Column(
              children: <Widget>[
                if (notificationModalList[i].notificationType ==
                    NotificationTypeEnum.simpleNotification) ...[
                  CustomNotificationWidget(
                    notificationModal: notificationModalList[i],
                  ),
                ] else ...[
                  CustomNotificationNewUiWidget(
                    notificationModal: notificationModalList[i],
                  ),
                ],
              ],
            ),
          ),
        );
      },
          duration: (notificationModalList[i].autoDissmiss! &&
                  notificationModalList[i].duration == Duration.zero)
              ? null
              : notificationModalList[i].duration);
    }
  }
}

// design2
class CustomNotificationNewUiWidget extends StatelessWidget {
  NotificationModal notificationModal;

  CustomNotificationNewUiWidget({Key? key, required this.notificationModal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Card(
        // color: AppStyle.customAccentColor,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: ClipOval(
                      child: notificationModal.image != null
                          ? notificationModal.image!.isAsset
                          ? SizedBox.fromSize(
                          size: const Size(80, 80),
                          child: Image.asset(
                              '${notificationModal.image!.url}'))
                          : SizedBox.fromSize(
                          size: const Size(80, 80),
                          child: Image.network(
                              '${notificationModal.image!.url}'))
                          : Image.asset('images/logo.png'))),
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                                notificationModal.title,
                                style: AppStyle.mainHeadingPageTop,
                                overflow: TextOverflow.ellipsis,
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            child: IconButton(
                                icon: notificationModal.icon!,
                                onPressed: () {
                                  OverlaySupportEntry.of(context)!.dismiss();
                                  if (notificationModal.action != null) {
                                    notificationModal.action!();
                                  }
                                }),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 4, top: 2, bottom: 8),
                              child: Text(
                                notificationModal.subtitle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (notificationModal.actionWidgets != null) ...[
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              notificationModal.actionWidgets!,
                            ],
                          ),
                        )
                      ],
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

// design3
class CustomNotificationNewUiWidgetFinalized extends StatelessWidget {
  NotificationModal notificationModal;

  CustomNotificationNewUiWidgetFinalized({Key? key, required this.notificationModal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Card(
        // color: AppStyle.customAccentColor,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
            child: Row(
              children: [

                Expanded(
                    // flex: 4,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              notificationModal.title,
                              style: AppStyle.mainHeadingPageTop,
                              overflow: TextOverflow.ellipsis,
                            )),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: IconButton(
                                  icon: notificationModal.icon!,
                                  onPressed: () {
                                    OverlaySupportEntry.of(context)!.dismiss();
                                    if (notificationModal.action != null) {
                                      notificationModal.action!();
                                    }
                                  }),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 4, top: 2, bottom: 8),
                                child: Text(
                                  notificationModal.subtitle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (notificationModal.actionWidgets != null) ...[
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                notificationModal.actionWidgets!,
                              ],
                            ),
                          )
                        ],
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// design widget
class CustomNotificationWidget extends StatelessWidget {
  NotificationModal notificationModal;

  CustomNotificationWidget({Key? key, required this.notificationModal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: SafeArea(
        child: ListTile(
          leading: SizedBox.fromSize(
              size: const Size(40, 40),
              child: ClipOval(
                  child: notificationModal.image != null
                      ? notificationModal.image!.isAsset
                          ? Image.asset('${notificationModal.image!.url}')
                          : Image.network('${notificationModal.image!.url}')
                      : Image.asset('images/logo.png'))),
          title: Text(
            notificationModal.title,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            notificationModal.subtitle,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
              icon: notificationModal.icon!,
              onPressed: () {
                OverlaySupportEntry.of(context)!.dismiss();
                if (notificationModal.action != null) {
                  notificationModal.action!();
                }
              }),
        ),
      ),
    );
  }
}
