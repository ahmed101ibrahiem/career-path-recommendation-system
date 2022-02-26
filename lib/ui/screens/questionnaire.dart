import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pharus/constant/colors.dart';
import 'package:pharus/ui/widgets/questionnaire_cart.dart';

import 'job_zone_screen.dart';


class Questionnaire extends StatefulWidget {
  static const id = 'Questionnaire';

  const Questionnaire({Key key}) : super(key: key);

  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  List _quesionnaireAsk = [
    {'screen':'1. since dummy data is kind a safety mechanism for data integrity. integrity.', },
    {'screen': '2. since dummy data is kind a safety mechanism for data integrity. integrity.'},
    {'screen': '3. since dummy data is kind a safety mechanism for data integrity. integrity.'}
  ];
  int _quest =0;
  double progresPercent = 0.3;
  void _next (){

if (_quest  > 1 ){
  Navigator.pushNamed(context, JobZoneScreen.id);
}
else{
    _quest+=1;
    progresPercent += 0.35;}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(36.0, 8, 8, 8),
          child: Material(
            color: primaryColor,
            borderRadius: BorderRadius.circular(12.0),
            child: MaterialButton(
              minWidth: double.infinity,
              height: MediaQuery.of(context).size.height * 0.01,
              onPressed: () {
                setState(() {
                  _next();
                });
              },
              child:_quest > 1 ? Text(
                'Finish!' ,
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ): Text(
                 'NEXT!',
                style: TextStyle(
                    color: Colors.white,
                  //  letterSpacing: 1,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFD9D9D9),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFD9D9D9),
        centerTitle: true,
        title: Text(
          'logo',
          style: TextStyle(color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.13),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 16, 20, 8),
            child: Column(
              children: [

                Text(
                    'since dummy data is kind a safety mechanism for data integrity.'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                new LinearPercentIndicator(
                 // width: MediaQuery.of(context).size.width - 50,
                 // animation: true,
                  lineHeight: 20.0,
                  animationDuration: 1000,
                  percent: progresPercent,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: primaryColor,
                ),

              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          reverse: true,
          itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 16),
          child: QuestionnaireCard(_quesionnaireAsk[_quest]['screen']),
        );
      })
    );
  }
}
