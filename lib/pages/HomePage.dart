import 'dart:ui';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/constans.dart';
import 'package:flutter_app/pages/NoticePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DateTime dateTimeChoose = DateTime.now();
  TimeOfDay timeOfDayChoose = TimeOfDay.now();
  List notificationList = [];
  late String textOne;
  late String textTwo;
  late int indexRemove;

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if(!isAllowed){
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
    notificationList.addAll([]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('УВЕДОМЛЕНИЯ'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _noticePage(context);
        },
        backgroundColor: indigoColor,
        shape: const CircleBorder(side: BorderSide.none),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: notificationList.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 80,
            child: Card(
              color: greyColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.only(left: 14.0,right: 8.0),
                  child: Row(
                    children: <Widget>[
                      _title(),
                      IconButton(
                          onPressed: (){
                            _redactOrDeletePage(context);
                          },
                          icon: const Icon(Icons.chevron_right),
                        iconSize: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _noticePage(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled:true,
        builder: (BuildContext bc) {
          return FractionallySizedBox(
            heightFactor: 0.8,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Создать уведомление',
                      style: TextStyle(fontSize: 20, fontWeight: fontWeight500)),
                  TextField(
                    onChanged: (String valueOne) {
                      textOne = valueOne;
                    },
                    decoration: InputDecoration(
                      labelText: 'Название уведомления',
                      border: OutlineInputBorder(
                        borderRadius: borderRadius15,
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
                          borderRadius: borderRadius15,
                        ),
                        filled: true,
                        fillColor: whiteColor,),
                  ),
                  TextField(
                    onChanged: (String valueTree) {
                      dateTimeChoose = valueTree as DateTime;
                    },
                    decoration: InputDecoration(
                        labelText: 'Дата',
                        prefixIcon: IconButton(onPressed: () {
                          _showDatePicker();
                        }, icon: const Icon(Icons.calendar_month),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: borderRadius15,
                        ),
                        filled: true,
                        fillColor: whiteColor
                    ),

                  ),
                  TextField(
                    onChanged: (String valueFour) {
                      timeOfDayChoose = valueFour as TimeOfDay;
                    },
                    decoration: InputDecoration(
                        labelText: 'Время',
                        border: OutlineInputBorder(
                          borderRadius: borderRadius15,
                        ),
                        prefixIcon: IconButton(onPressed: () {
                          _showTimePicker();
                        }, icon: const Icon(Icons.calendar_month),
                        ),
                        filled: true,
                        fillColor: whiteColor),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          activateNotification();
                          notificationList.add([textOne, textTwo]);
                        });
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(350, 50),
                        backgroundColor: indigoColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: borderRadius15
                        ),
                      ),
                      child: const Text('Создать'),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void _redactOrDeletePage(context){
    showDialog(context: context, builder: (BuildContext bc){
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        contentPadding: const EdgeInsets.only(top: 10.0),
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text('Выберите действие:',style: TextStyle(fontSize: 20, fontWeight: fontWeight500),),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      notificationList.removeAt(indexRemove);
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('Удалить')),
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: const Text('Редактировать')),
            ],
          ),
        ),
      );
    });
  }

  Widget _title(){
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textOne,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)
            ,),
          Text(textTwo,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: greyColorWeight)),
        ],
      ),
    );
  }

  activateNotification(){
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 10,
            channelKey: 'basic_channel',
            title: textOne,
          body: textTwo,
        ));
  }

  void _showDatePicker(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100)
    ).then((value) {
      setState(() {
        dateTimeChoose = value!;
      });
    });
  }

  void _showTimePicker(){
    showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()).then((value){
          setState(() {
            timeOfDayChoose = value!;
          });
    });
  }

}
