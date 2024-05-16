import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/NoticeLogic.dart';
import 'package:flutter_app/constans.dart';
import 'package:flutter_app/pages/HomePage.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/*class NoticePage extends StatefulWidget {
  const NoticePage({super.key});

  @override
  State<NoticePage> createState() => _NoticePageState();
}


class _NoticePageState extends State<NoticePage> {
  late String textOne;
  late String textTwo;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Создать уведомление',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          TextField(
            onChanged: (String valueOne) {
              textOne = valueOne;
            },
            decoration: InputDecoration(
              labelText: 'Название уведомления',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              filled: true,
              fillColor: whiteColor,
            ),
          ),
          TextField(
            onChanged: (String valueTwo) {
              textTwo = valueTwo;
            },
            decoration: InputDecoration(
                labelText: 'Описание уведомления',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                filled: true,
                fillColor: whiteColor),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                //NoticeLogic().showNotification(title: 'Увед', body: 'Го на треню');
                setState(() {
                  notificationList.add([textOne, textTwo]);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Создать'),
            ),
          )
        ],
      ),
    );
  }
}
*/