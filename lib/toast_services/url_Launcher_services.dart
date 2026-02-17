import 'package:url_launcher/url_launcher.dart';

class UrlLauncherServices {
  static Future<void>makePhoneCall(String phoneNumber)async{
    final Uri launchUri=Uri(scheme: "Tel",path: phoneNumber);
    await launchUrl(launchUri);
  }
  static Future<void> launcchBrowser(Uri url)async{
    await launchUrl(url,mode: LaunchMode.externalApplication);
  }
  static Future<void> TextMe()async{
    const uri="sms:+998887350200?body=hello Churban sms";
    await launch(uri);
  }
}