import 'package:flutter/cupertino.dart';

class StylePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _creteText(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _navigateButton(context, 'Basic style', 'basic', 'basic.png'),
                      _navigateButton(context, 'Parallax style', 'scroll', 'full_style.png'),
                      
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _navigateButton(context, 'New theme', 'style','buttons_style.png'),
                    ]
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }

  Widget _creteText(BuildContext context ){
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children : [ 
          Text('Flutter style app', style: TextStyle( color: CupertinoColors.systemBlue, fontSize: 40.0),),
          SizedBox(height: 20.0,),
          Text('Click on diferents styles to preview'),
        ]
      ),
    );
  }

  Widget _navigateButton(BuildContext context, String text, String url, String img){
    return Container(
      child: Column(
        children: [
          Container(
            height: 250.0,
            child: Image(image: AssetImage('assets/$img'))
          ),
          SizedBox(height: 10.0,),
          CupertinoButton.filled(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: Text(text),
            onPressed: (){
              Navigator.pushNamed(context, url);
            },
          )
        ],
      ),
    );
  }
  
}