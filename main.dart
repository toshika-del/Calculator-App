import 'package:calculator_1st/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
    void main(){
     runApp( const MaterialApp(
      home:  CalculatorApp(),
     ));
    }
    
  class CalculatorApp extends StatefulWidget{
    const CalculatorApp({Key?key}) :super(key: key);
    @override
    State<CalculatorApp> createState() => _CalculatorAppState();
  }
  class  _CalculatorAppState extends State<CalculatorApp>{
    double firstnum = 0.0;
    double secnum = 0.0;
    var input ='';
    var output ='';
    var operation ='';
    var hideinput =false;
    var outputsize =34.0;

    onButtonclick (value){
//if value is AC
if(value=="AC"){
  input ='';
  output='';
}
else if (value =="<"){
  if(input.isNotEmpty){
     input=input.substring(0,input.length-1);
  }

}
else if(value =="="){
  if(input.isNotEmpty){

  
  var userInput = input;
  userInput =input.replaceAll("x", "*");
  Parser p =Parser();
  Expression expression =p.parse(userInput);
  ContextModel cm = ContextModel();
  var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
  output =finalvalue.toString();
  if(output.endsWith(".0")){
       output=output.substring(0,output.length-2);
  }
  input = output;
  hideinput =true;
  }
}
else{
  input =input+value;
  hideinput =false;


}
setState(() {
  
});
    }

    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Colors.grey,
        body:Column(
          children: [
            Expanded(child: Container
            (
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.white10,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children:  [
                  Text(hideinput ? ' ' :
                    input,style: const TextStyle(
                    fontSize: 40,
                    color: Colors.blue,
                  ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(output,style: const TextStyle(
                    fontSize: 40,
                    color: Colors.deepPurpleAccent,
                  ),
                  ),
                ],
              ),



              ),
              
            ),
            //buttonArea
            Row(
              children: [button( text: "AC",),
              button(text: "<"),
              button( text: "",buttonBgColor: Colors.transparent),
               button( text: "/" )
              ],
            ),
             Row(
              children: [button( text: "7",),
              button(text: "8"),
              button( text: "9"),
               button( text: "x" )
              ],
            ),
             Row(
              children: [button( text: "4",),
              button(text: "5"),
              button( text: "6"),
               button( text: "-" )
              ],
            ),
             Row(
              children: [button( text: "3",),
              button(text: "2"),
              button( text: "1"),
               button( text: "+" )
              ],
            ),
              Row(
              children: [button( text: "0",),
              button(text: "."),
              button( text: "%"),
               button( text: "=" )
              ],
            ),
          ],

        ),
      );
    }
    Widget button({
      text,tcolor=Colors.white,buttonBgColor = buttonColor
    }){
      return  Expanded(
                  child:Container(
                    margin: const EdgeInsets.all(8),
                  child:ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      padding: const EdgeInsets.all(22),
                      backgroundColor: buttonBgColor,),
                   
                    onPressed: ()=>onButtonclick(text), child: Text(text,style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  ),
                );
    }



  }
 
 

