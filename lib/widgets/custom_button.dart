import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Widget? child;
  const CustomButton({super.key, required this.title, this.child });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical:5.0),
      child: FilledButton(
        onPressed:(){
            Navigator.of(context).push(
          MaterialPageRoute(
              builder:(_) => child?? Container()),
            );
            
        },
        child:Text(title),
      ),
    );
  }
}