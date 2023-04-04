import 'package:flutter/material.dart';
class Images extends StatelessWidget {
  double? bmi;
  Images(this.bmi, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: Colors.blue,
        child :
        (bmi!< 18.5)
            ? Image.asset('assets/underweight.png')
            : (bmi! < 25)
            ? Image.asset('assets/fat.png')
            : (bmi!< 30)
            ? Image.asset('assets/overweight.png')
            :(bmi! < 40)
            ? Image.asset('assets/obesity.png')
            : Image.asset('assets/morbidobese.png')

    );
  }
}
