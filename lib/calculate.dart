import 'dart:math';

import 'package:flutter/material.dart';

import 'component.dart';
import 'home.dart';

class cal extends StatefulWidget {
  const cal({this.color,this.icon,this.ismale,this.tital});
final ismale;
final tital;
final icon;
final color;
  @override
  State<cal> createState() => _calState();
}

class _calState extends State<cal> {
  TextStyle title=TextStyle(color: Colors.black,fontSize: 20);
int weight=0;
int height=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios,color: widget.color,size: 30,),
                          Text("BMI",style: title,)
                        ],
                      ),
                    ),
                  ),
                  Center(child: Column(
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.tital,style: title,),
                      SizedBox(
                        height: 30,
                      ),
                      Icon(widget.icon,color: widget.color,size: 55,),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Weight (KG)",style: title,),
                      SizedBox(
                        height: 0,
                      ),
                    ],
                  )),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0,0,0,30),
                      child: ListView.builder(
                          itemCount: 250,
                          itemBuilder: (context,index)
                      {
                        int i=index+20;
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                                weight=i;
                            });
                            print(weight);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8),
                            child: Text("$i",style: TextStyle(color: weight==i?widget.color:Colors.black,fontSize: weight==i?40:25),),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              )),
              Expanded(
                  flex:1,
                  child: Container(
                    color: widget.color,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                           // padding: EdgeInsets.all(8),
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 70,
                            ),
                            Text("Height (CM)",style: TextStyle(fontSize: 20),),
                            SizedBox(
                              height: 10,
                            )
                                              ],
                        )),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 50),
                            child: ListView.builder(
                                itemCount: 150,
                                itemBuilder: (context,index)
                                {
                                  int i=index+120;
                                  return GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        height=i;
                                      });
                                      print(height);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: height==i?Colors.white:widget.color,
                                        borderRadius: BorderRadius.circular(40)
                                      ),
                                      child: Text("$i",style: TextStyle(color: height==i?widget.color:Colors.white,fontSize: 25),),
                                    ),
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
          Positioned(
              right: 4,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(onPressed: (){
                  bool error=false;
                  double result=0;
                  String r="";
                  if(height==0 || weight==0){
                    error=true;
                  }
                  else{
                    result=weight/pow(height/100, 2);
                    switch (result){
                      case (<18.5) :{
                        r="Underweight";}
                      break;
                      case (<=25 && >=18) :{
                        r="Normal";}
                      break;
                      case (>25) :{
                        r="Overwieght";}
                      break;
                    }

                  }
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: widget.color,
                        title: Center(child: Text(error?'ERROR':"Result",style: ts,)),
                       // content: //error?Text('Please select All items (Height,Weight)',textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 12),):
                        actions: [ error?Text('Please select All items (Height,Weight)',textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 12),):
                        Column(
                          children: [
                            Center(child: Text(r,style: TextStyle(color: Colors.white,fontSize: 15),)),
                            SizedBox(height: 10,),
                            Center(child: Text(result.toStringAsFixed(1),style: TextStyle(color: Colors.white,fontSize: 15),)),
                            SizedBox(height: 10,),
                            ElevatedButton(onPressed: (){
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>home()), (Route route)=>false,);
                            },   style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  // side: BorderSide(color: Colors.red)
                  )
                  ),
                  )
                  , child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5),
                  child: Text("Home".toUpperCase(),style: TextStyle(color: Colors.black),),
                  ))
                          ],
                        )
                          ,]

                      )
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                         // side: BorderSide(color: Colors.red)
                      )
                  ),
                )
                , child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5),
                  child: Text("calcu".toUpperCase(),style: TextStyle(color: Colors.black),),
                )),
              )),
        ],
      ),
    );
  }
}
