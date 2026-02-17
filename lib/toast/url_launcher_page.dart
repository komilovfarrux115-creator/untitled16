import 'package:flutter/material.dart';

import '../toast_services/url_Launcher_services.dart';

class UrlLauncherPage extends StatefulWidget {
  const UrlLauncherPage({super.key});

  @override
  State<UrlLauncherPage> createState() => _UrlLauncherPageState();
}

class _UrlLauncherPageState extends State<UrlLauncherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
           // UrlLauncherServices.makePhoneCall("+998887350200");
          // UrlLauncherServices.launcchBrowser(Uri.parse("https://yandex.uz/"));
          UrlLauncherServices.TextMe();
        }, child: Text("Call")),
      ),
    );
  }
}
