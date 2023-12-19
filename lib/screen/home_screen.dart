import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime dDay = DateTime.now();
  void onHeartPressed() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  dDay = date;
                });
              },
            ),
          ),
        );
      },
      barrierDismissible: true,
    );
    // setState(() {
    //   firstDay = firstDay.subtract(Duration(days: 1));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
          top: true,
          bottom: false,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _DDay(onHeartPressed: onHeartPressed, dDay: dDay),
                _CoupleImage(),
              ])),
    );
  }
}

class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed;
  final DateTime dDay; // named parameter이다. 값은 상위에서 넣어 준다.

  const _DDay({required this.onHeartPressed, required this.dDay});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(children: [
      const SizedBox(height: 16),
      Text('U&I', style: textTheme.headline1),
      const SizedBox(height: 16),
      Text('기념일', style: textTheme.bodyText1),
      Text('${dDay.year}.${dDay.month}.${dDay.day}',
          style: textTheme.bodyText2),
      const SizedBox(height: 16),
      IconButton(
        iconSize: 60,
        icon: Icon(Icons.favorite, color: Colors.red),
        onPressed: onHeartPressed,
      ),
      const SizedBox(height: 16),
      Text('D ${DateTime.now().difference(dDay).inDays - 1}',
          style: textTheme.headline2),
    ]);
  }
}

class _CoupleImage extends StatelessWidget {
  const _CoupleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset('images/middle_image.png',
            height: MediaQuery.of(context).size.height / 2),
      ),
    );
  }
}
