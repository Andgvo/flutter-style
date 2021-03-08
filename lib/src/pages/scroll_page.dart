import 'package:flutter/cupertino.dart';

class ScrollPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: [
            _page1(),
            _page2()
          ],
        ),
      ),
    );
  }

  Widget _page1() {
    return Stack(
      children: [
        _backgroundColor(),
        _backgroundImg(),
        _texts()
      ],
    );
  }
  
  Widget _backgroundColor() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  Widget _backgroundImg(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _texts(){

    final textStyle = TextStyle(color: CupertinoColors.white, fontSize: 50.0);

    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 20.0,),
          Text('11', style: textStyle,),
          SizedBox(height: 10.0,),
          Text('Wendsday', style: textStyle,),
          Expanded(child: Container()),
          Icon(
            CupertinoIcons.chevron_down, size: 70.0, color: CupertinoColors.white,
          )
        ],
      ),
    );
  }

  /*
   *  PAGE 2
   */
  Widget _page2() {
    return Stack(
      children: [
        _backgroundColor(),
        _centerButtonAction()
      ],
    );
  }

  Widget _centerButtonAction(){
    return Container(
      child: Center(
        child: CupertinoButton.filled(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Text('Welcome!', style: TextStyle(fontSize: 20.0),)
          ),
          onPressed: (){},
        ),
      ),
    );
  }

}