import 'package:bmi_plus/calculate.dart';
import 'package:bmi_plus/component.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(child: GestureDetector(
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder: (BuildContext c)=>cal(ismale: true,tital: m,icon: male,color: blue,)));
                  },
                  child: Container(
                    color: blue,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(m,style: ts,),
                          SizedBox(height: 10,),
                          Icon(male,size: 45,color: Colors.white,),
                        ],
                      ),
                    ),
                  ),
                )),
                Expanded(child: GestureDetector(
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder: (BuildContext c)=>cal(ismale: false,tital: f,icon: female,color: pink,)));
                  },
                  child: Container(
                    color: pink,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(f,style: ts,),
                          SizedBox(height: 10,),
                          Icon(female,size: 45,color: Colors.white,),
                        ],
                      ),
                    ),
                  ),
                ))
              ],
            ),
            Positioned(
                left: MediaQuery.sizeOf(context).width/4-10,
                top: 10,
                child: Container(
                  padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text("BMI CALCULATOR",style: TextStyle(
                      color: Colors.black,
                      fontSize: 25
                    ),))),
          ],
        ),
      ),
    );
  }
}
