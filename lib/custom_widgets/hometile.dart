import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {

  final List<Widget> children;

  HomeTile({
    @required this.children
  });
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
                  decoration: new BoxDecoration(color: Colors.grey[800].withOpacity(0.9),borderRadius: BorderRadius.circular(30.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:children
                  ),
                ),
    );
  }
  
}