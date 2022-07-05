

part of custom_widgets;

class CustomUrlLauncher{
  //simple string url launcher
  static Future customLaunchUrl(String url) async {
    final Uri uri=Uri.parse(url);
    if (!await launchUrl(uri,)){
      pprint('Can not launch file $uri',1);
    }
  }
  static Future customLaunchInBrowser(String url) async {
    final Uri uri=Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName:  '_blank',
    )) {
      throw 'Could not launch $url';
    }
  }
  //email launcher
  static Future customLaunchEmail(String email,String subject) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: '$email',
      query: encodeQueryParameters(<String, String>{
        'subject': '$subject'
      }),
    );
    if (!await launchUrl(uri)){
      pprint('Can not mail $uri',1);
    }
  }
  //phone launcher
  static Future customMakePhoneCall(String phoneNumber,) async {
    final Uri uri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    canLaunchUrl(uri).then((bool result) async{
      if(result){
        if (!await launchUrl(uri)){
          pprint('Can not call $uri',1);
        }
      }else{
        pprint('Platform do not support call',1);
      }
    });

  }
  //query encoder
  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}

class StorageHelper{
  static store(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, "${value.toString()}");
  }
  static fetch(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
  static delete(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}


// 3 = Verbose
// 2 = Warnings/Info
// 1 = Errors Only
var globalLogLevel = 3;

void pprint(dynamic data, [int logLevel = 3]) {
  var logger = Logger();
  if (foundation.kDebugMode) {
    try {
      if(logLevel==1){
        logger.e("$data");
      }else if(logLevel==2){
        logger.w("$data");
      }else{
        logger.v("${data}");
      }
      // if (foundation.kIsWeb) {
      //   print(data);
      // } else {
      //   var s = StackTrace.current.toString().split('\n');
      //   var res = (data ?? 'null').toString() + '  ' + s[1].split('(')[1];
      //   print(res);
      // }
    } catch (e) {
      print('Error printing info: see helpers.dart');
      print(e);
    }
  }
}