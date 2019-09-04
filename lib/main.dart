import 'package:flutter/material.dart';


void main(List<String> args) {
  runApp(
    MaterialApp(
      title: "Minimalist Calculator",
      home: Home()
    ),
  );
}

class Home extends StatelessWidget{

@override
  Widget build(BuildContext context) {
    
    return CalculatorHome();
  }

}

class CalculatorHome extends StatefulWidget{

State<StatefulWidget> createState() => Mystate();

}


num num1 = 0.0;
num num2 =0.0;
String output = "0";
String operate = "";
String out = "0";


bool operated = true;

class Mystate extends State<CalculatorHome>{


buttonPress(dynamic buttonText){

if(buttonText=='C'){
  output = "0";
  num1 = 0.0;
  num2 =0.0;
  operate = "";
  operated = true;

}
else if(buttonText=='+/-' || buttonText=='%' ||buttonText=='/' || buttonText=='*' ||buttonText=='-' || buttonText=='+'){
  operate = buttonText;
  operated = true;
  num1 = double.tryParse(output);
  output = "0";
  if(operate == "%"){
      output = (num1/100).toString();
}
}
else if(buttonText=='.'){

    if (!output.contains(".")){
      output = output + buttonText;
    }
    operated = true;


}
else if(buttonText=="="){
  num2 = double.parse(output);

    if(operate == "+/-"){
      output = (num1*(-1)).toString();
      operated = true;
    }
    if(operate == "+"){
    output = (num1+num2).toString();
    operated = true;
    }
    if(operate == "-"){
      output = (num1-num2).toString();
      operated = true;
    }
    if(operate == "*"){
      output = (num1*num2).toString();
      operated = true;
    }
    if(operate == "/"){
    output = (num1/num2).toString();
    operated = true;
    }
operated = false;

num1=0.0;
num2 =0.0;
operate = "";

}

else {
  if(operated){
     output = output + buttonText;
    
  }
  
  

  
}


setState(() {
var index = output.indexOf(".");
if(output.length-index>7){
  out = double.parse(output).toStringAsFixed(6);
}else{

out = double.parse(output).toString();

}

});



} 


  

  @override
  Widget build(BuildContext context) {

  Widget custombutton([dynamic ss,int flexSize]){
    return Expanded(
      flex: flexSize,
      child: RaisedButton(
        color: Colors.blue.shade100,
        elevation: 22,
        padding: EdgeInsets.all(35),
        onPressed: () {
          buttonPress(ss);
        },
        child: Text("$ss",style: TextStyle(fontSize:16,fontWeight: FontWeight.w600),)
        
      )
    );
  }

    return Scaffold(
      appBar: AppBar(
        elevation: 32,
        backgroundColor: Colors.blue.shade300,
        title: Text("Minimalist Calculator",
        style: TextStyle(
          fontSize: 22,
          fontStyle: FontStyle.italic,
          color: Colors.blueGrey.shade800
          ),
          ),
        centerTitle: false,
        
      ),
      body: Center(
        
       child: Column(
         mainAxisAlignment: MainAxisAlignment.end,
         children: <Widget>[
           Container(
             alignment: Alignment.centerRight,
             child: Text(
              "$out",
              style: TextStyle(fontSize: 35),
            ),
            margin: EdgeInsets.symmetric(
              vertical: 44,
              horizontal: 12,
            ),
           ),

           Row(
             children: <Widget>[
               custombutton("C",1),
               custombutton("+/-",1),
               custombutton("%",1),
               custombutton("/"),
               

             ],
           ),
           Row(
             children: <Widget>[
               custombutton("9",1),
               custombutton("8",1),
               custombutton("7",1),
               custombutton("*"),
               

             ],
           ),
           Row(
             children: <Widget>[
               custombutton("6",1),
               custombutton("5",1),
               custombutton("4",1),
               custombutton("-"),
               

             ],
           ),
           Row(
             children: <Widget>[
               custombutton("3",1),
               custombutton("2",1),
               custombutton("1",1),
               custombutton("+",),
               

             ],
           ),
           Row(
             children: <Widget>[
               custombutton("0",2),
               custombutton(".",1),
               custombutton("=",),
               

             ],
           ),
          

         ]
       ),    
      ) ,
      
      
    );
  }
}


