import 'package:flutter/cupertino.dart';

class HomePageApp extends StatelessWidget{

  final styleTitle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold );
  final styleSubtitle = TextStyle(fontSize: 18.0, color: CupertinoColors.systemGrey );
  
  @override
  Widget build(BuildContext context) {
    
    return CupertinoPageScaffold(
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(image: NetworkImage('https://images.adsttc.com/media/images/5bf2/16a3/08a5/e515/4e00/018b/newsletter/feature_image.jpg?1542592134'),),
              _bodyContainer(),
            ],
          ),
        )
      )
      
    );
  }

  Widget _bodyContainer(){
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          _titleSection(),
          SizedBox(height: 20,),
          _actionSection(),
          SizedBox(height: 20,),
          _createText()
        ]
      ),
    );
  }

  Widget _titleSection(){
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Lago con puente', style: styleTitle,),
              SizedBox(height: 7.0,),
              Text('Lago con puente', style: styleSubtitle,),
            ],
          ),
        ),
        Icon( CupertinoIcons.star_fill, color: CupertinoColors.systemRed, size: 25.0,),
        Text('41', style: TextStyle(fontSize: 20.0),)
      ],
    );
  }

  Widget _actionSection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _createAction(CupertinoIcons.phone,'Call'),
        _createAction(CupertinoIcons.map,'Route'),
        _createAction(CupertinoIcons.share,'Share'),
      ],
    );
  }

  _createAction(IconData icon, String name, ) {
    return Column(
      children: [
        Icon(icon),
        Text(name)
      ],
    );
  }

  Widget _createText(){
    

    return Container(
      child: Text('Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.', textAlign: TextAlign.justify,),
    );
  }
}

