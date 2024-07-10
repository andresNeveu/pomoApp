import 'package:flutter/material.dart';
import 'package:pomo_app/pages/settings.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  void showDialogPage(BuildContext context, Widget widget) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return widget;
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 15,
      padding: EdgeInsets.symmetric(horizontal: size.width / 3, vertical: 0),
      color: Theme.of(context).colorScheme.inversePrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Pomo App',
            style: TextStyle(fontSize: size.height / 40),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  showDialogPage(context, const Settings());
                },
                icon: Icon(
                  Icons.settings,
                  size: size.height / 35,
                ),
                tooltip: 'Settings',
              )
            ],
          )
        ],
      ),
    );
  }
}
