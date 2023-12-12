import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class DateTime_FractionallySized_Fitted_UriLuncherBoxScreen extends StatefulWidget {
  const DateTime_FractionallySized_Fitted_UriLuncherBoxScreen({super.key});

  @override
  State<DateTime_FractionallySized_Fitted_UriLuncherBoxScreen> createState() => _DateTime_FractionallySized_Fitted_UriLuncherBoxScreenState();
}

class _DateTime_FractionallySized_Fitted_UriLuncherBoxScreenState extends State<DateTime_FractionallySized_Fitted_UriLuncherBoxScreen> {
  DateTime? _dateTime;
  TimeOfDay? _timeOfDay;

  getData() async {
    DateTime? _date = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year + 20),
    );
    setState(() {
      _dateTime = _date;
    });
  }

  getTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      _timeOfDay = time;
    });
  }

  static const number = "+351 939 353 982";
  static const massage = "01619-552646";
  static const mail = "mrfahad26531@gmail.com";
  static const _uri = "https://flutter.dev/";
  @override
  Widget build(BuildContext context) {
    var weaight=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Date AnD Time

              SizedBox(
                height: 30,
              ),
              _dateTime == null
                  ? Center(child: Text("Press  Get Date"))
                  : Center(
                      child: Text(
                          "Date: ${_dateTime?.day}/${_dateTime?.month}/${_dateTime?.year}")),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      getData();
                    },
                    child: Text("Get Date")),
              ),
              SizedBox(
                height: 30,
              ),
              _timeOfDay == null
                  ? Center(child: Text("Press  Get Time"))
                  : Center(
                      child: Text(
                          "Time : ${_timeOfDay?.hour} - ${_timeOfDay?.minute}")),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      getTime();
                    },
                    child: Text("Get Time")),
              ),

              SizedBox(
                height: 30,
              ),

                   // uri luncher

              lunchButton(tittle: "Lunch Phone", icon: Icons.call, onpresseds: () {
                Uri uri=Uri.parse("tel:$number");
                 launcher.launchUrl(uri);
              }),
              SizedBox(
                height: 10,
              ),
              lunchButton(tittle: "Lunch Massage", icon: Icons.mail_sharp, onpresseds: () {
                Uri uri=Uri.parse("sms:$massage",);
                launcher.launchUrl(uri);
              }),
              SizedBox(
                height: 10,
              ),
              lunchButton(tittle: "Lunch Uri", icon: Icons.network_check_outlined, onpresseds: () {

                launcher.launchUrl(Uri.parse(_uri),
                mode:  launcher.LaunchMode.inAppWebView
                );
              }),
              SizedBox(
                height: 10,
              ),

              lunchButton(tittle: "Lunch Email", icon: Icons.alternate_email, onpresseds: () {
        Uri uri=Uri.parse("mailto:$mail");
                launcher.launchUrl(uri);
              }),

              SizedBox(
                height: 50,
              ),
                      //fitted box
FittedBox(
  child: Row(
    children: [
      Container(
        height: 150,
        width: weaight/2,
        color: Colors.blue,
      ),
      Container(
        height: 150,
        width: weaight/3,
        color: Colors.red,
      ),
      Container(
        height: 150,
        width: weaight/3,
        color: Colors.yellow,
      ),

    ],
  ),
),

             //frectionnaly  size box
              Container(
                height: 300,
                width: 300,
                color: Colors.black,
                child: FractionallySizedBox(
                  heightFactor: 0.2,
                  widthFactor: 0.5,

                  child: Container(
                    color: Colors.orange,
                  ),
                ),
              )

                         //  device preview use app testing

            ],
          ),
        ),
      ),
    );
  }

  Widget lunchButton({
    required String tittle,
      required IconData icon,
      required Function() onpresseds}) {
    return ElevatedButton(
        onPressed: onpresseds,
        child: Container(
          height: 50,
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text(tittle), Icon(icon)],
          ),
        ));
  }
}
