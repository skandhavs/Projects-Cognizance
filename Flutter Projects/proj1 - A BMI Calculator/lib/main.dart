// main.dart
import 'package:flutter/material.dart';
import './imagesfiles.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final height_ar = TextEditingController();
  final weight_ar = TextEditingController();
  double? bmi;
  String message = 'Please enter your height and weight';
   _calculate() {
    final double? height = double.tryParse(height_ar.value.text);
    final double? weight = double.tryParse(weight_ar.value.text);
    if (height == null || weight == null || height <= 0 || weight <= 0) {
      setState(() {
        message = "Your height and weight is not negative!!!";
      });
      return Images(bmi!);
    }
    setState(() {
      bmi = weight / (height * height);
      if (bmi!< 18.5) {
        message = "You are  underweight ";
      } else if (bmi! < 25) {
        message = 'You have healthy weight';
      } else if (bmi! < 30) {
        message = 'You are overweight';
      } else if(bmi!<40){
        message = 'You are obese';
      }else if(bmi!>40){
        message = 'You are morbidly obese';
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.black,
          centerTitle:true,
        title:  const Text('BMI CALCULATOR',
          style: TextStyle(
          fontFamily: 'Orb',
            color:Colors.yellow
        ),),
        ),
        backgroundColor: Colors.black54,
        body:Align(
          alignment:AlignmentDirectional.topCenter,
        child: SizedBox(
        width: 320,
        child: Card(
        color: Colors.black,
        elevation: 10,
        child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        TextField(
          style:const TextStyle(color:Colors.yellowAccent,),
        keyboardType:
        const TextInputType.numberWithOptions(decimal: true),
        decoration:
        const InputDecoration(labelText: 'Height in m',
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey
              ),),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey
              ),
          ),
            labelStyle: TextStyle(
              color: Colors.yellowAccent,
              fontFamily: 'Orb',
              fontWeight: FontWeight.normal,
            )),
        controller: height_ar,
        ),
        const SizedBox(height:20),
        TextField(
          style:const TextStyle(color:Colors.yellowAccent,),
        keyboardType:
        const TextInputType.numberWithOptions(decimal: true),
        decoration: const InputDecoration(
        labelText: 'Weight in kg',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1,
                  color: Colors.grey
              ),),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1,
                  color: Colors.grey
              ),
          ),
            labelStyle: TextStyle(
              color: Colors.yellowAccent,
              fontFamily: 'Orb',
            )
        ),
        controller: weight_ar,
        ),
          const SizedBox(height:40),
        ElevatedButton.icon(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.yellowAccent), ),
              onPressed: _calculate,
        icon:const Icon(Icons.calculate_rounded,color: Colors.black,),
        label:const Text("Calculate",style: TextStyle(color: Colors.black,fontFamily: 'Orb'),)
        ),
          const SizedBox(height:20),
        Text(
        bmi == null ? 'No Result' : bmi!.toStringAsFixed(2),
        style: const TextStyle(fontSize: 50,color:Colors.yellowAccent),
        textAlign: TextAlign.center,
        ),
        const SizedBox(
        height: 20,
        ),
        Text(
        message,
        style:const TextStyle(color:Colors.yellowAccent),
        textAlign: TextAlign.center,
        ),
        ],
        ),
        ),
        ),
        ),),);
      }
}
