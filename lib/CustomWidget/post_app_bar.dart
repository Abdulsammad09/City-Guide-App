import 'package:flutter/material.dart';

class PostAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                     blurRadius:6,
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_back,
                size: 28,
              ),
            ),
          ),
          InkWell(
            onTap:(){},
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Icon(
                Icons.favorite,
                color: Colors.redAccent,
                size: 28,
              ),
            ),
          )
        ],
      ),
    );
  }
}