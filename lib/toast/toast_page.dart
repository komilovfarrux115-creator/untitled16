import 'package:flutter/material.dart';
import 'package:untitled16/toast_services/toast_services_page.dart';


class ToastPage extends StatefulWidget {
  const ToastPage({super.key});

  @override
  State<ToastPage> createState() => _ToastPageState();
}

class _ToastPageState extends State<ToastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ToastServicesPage.showToast("Accauntga kirdingiz");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: Text("Toast", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
