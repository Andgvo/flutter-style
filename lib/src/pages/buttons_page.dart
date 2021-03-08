import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class ButtonsPage extends StatelessWidget {

  final List<CustomButton> buttons = [
    CustomButton(icon: Icons.border_all,text: 'General',color: Colors.blue ),
    CustomButton(icon: Icons.directions_bus,text: 'Bus',color: Colors.purpleAccent),
    CustomButton(icon: Icons.shop,text: 'Buy',color: Colors.pinkAccent),
    CustomButton(icon: Icons.insert_drive_file,text: 'File',color: Colors.orange),
    CustomButton(icon: Icons.movie_filter, text: 'Entertaiment',color: Colors.blueAccent),
    CustomButton(icon: Icons.cloud,text: 'Grocery',color: Colors.green),
    CustomButton(icon: Icons.collections, text: 'Photos',color: Colors.red),
    CustomButton(icon: Icons.help_outline,text: 'Help',color: Colors.teal),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: CupertinoColors.systemPink,
        inactiveColor: Color.fromRGBO(116, 117, 152, 1.0),
        backgroundColor: Color.fromRGBO(55, 57, 84, 1.0),
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.calendar)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.bubble_left)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled)),
        ],  
      ),
      tabBuilder: (context, i) {
        return CupertinoPageScaffold(
        child: Stack(
          children: [
            _background(),
            SingleChildScrollView(
              child: Column(
                children: [
                  _titleSection(),
                  _createTable(2, buttons)
                ],
              ),
            )
          ],
        ),
      );
      
      }
    );
  }

  Widget _background(){
    final gradient = Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.6),
            end: FractionalOffset(0.0, 1.0),
            colors: [
              Color.fromRGBO(52, 54, 101, 1.0),
              Color.fromRGBO(35, 37, 57, 1.0),
            ]
          )
        ),
    );

    final pinkBox = RotationTransition(
      turns: new AlwaysStoppedAnimation(50/360),
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0)

            ]
          )
        ),
      )
    );

    return Stack(
      children: [
        gradient,
        Positioned(
          top: -100.0,
          left: -50.0,
          child: pinkBox,
        ),
      ],
    );
  }

  Widget _titleSection(){
    
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Classify transaction', style: TextStyle( color: CupertinoColors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Text('Classify this transactio into a partiicular category', style: TextStyle( color: CupertinoColors.white, fontSize: 18.0,))
          ],
        ),
      ),
    );
  }

  Widget _createTable(int cols, List<CustomButton> buttons){
    List<TableRow> tableContent = [];
    int control = 0;
    List<Widget> rowContent = [];
    for (var button in buttons) {
      rowContent.add( _createCustomButton(button) );
      control++;
      if(control == cols){
        control = 0;
        tableContent.add( TableRow(
          children: rowContent
        ));
        rowContent = [];
      }
    }
    
    return Table(
      children: tableContent
    );
  }

  Widget _createCustomButton(CustomButton button){//(IconData icon, Color color){
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur( sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.6),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: button.color,
                radius: 35.0,
                child: Icon(button.icon, color: CupertinoColors.white, size: 30),
              ),
              Text(button.text, style: TextStyle(color: button.color ),)
            ],
          ),
        ),
      ),
    );
  }
}


class CustomButton{

  IconData icon;
  String text;
  Color color;

  CustomButton({ this.icon, this.text, this.color});
}