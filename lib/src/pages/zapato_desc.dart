import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapatos/src/helpers/helpers.dart';
import 'package:zapatos/src/models/zapato_model.dart';
import 'package:zapatos/src/widgets/widgets.dart';

class ZapatoDescPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: "Zapatos",
                child: ZapatoSizePreview(fullScreen: true)
              ),
              Positioned(
                top: 80,
                child: FloatingActionButton(
                  child: Icon(Icons.chevron_left, color: Colors.white,size: 60),
                  onPressed: (){
                    cambiarStatusLight();
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                )
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ZapatoDesc(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _MontoBuyNow(),
                  _ColoresYMas(),
                  _BotonesLikeCartSettings()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(Icon(Icons.star, color: Colors.red, size: 25,)),
          _BotonSombreado(Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25,)),
          _BotonSombreado(Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25,))
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {

  final Icon icon;
  
  const _BotonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: -5, blurRadius:20, offset: Offset(0,10))
        ]
      ),
    );
  }
}

class _ColoresYMas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(left: 90,child:_BotonColor(Color(0xff354d56),4,"assets/imgs/negro.png")),
                Positioned(left: 60,child:_BotonColor(Color(0Xff2099f1),3,"assets/imgs/azul.png")),
                Positioned(left: 30,child:_BotonColor(Color(0xffFFAD29),2,"assets/imgs/amarillo.png")),
                _BotonColor(Color(0xffC6D642),1, "assets/imgs/verde.png")
              ],
            ),
          ),
          BotonNaranja(texto: "More related items", alto: 30, ancho: 170, color: Color(0xffFFC675),)
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {

  final Color color;
  final int index;
  final String urlImagen;

  const _BotonColor(
    this.color, 
    this.index,
    this.urlImagen
  );

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: (){
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = this.urlImagen;
        },
        child: Container(
          width: 45,
          height:45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          )
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:30),
      child: Container(
        margin: EdgeInsets.only(top:20, bottom: 20),
        child: Row(
          children: [
            Text("\$180.0", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BotonNaranja(
                ancho: 120,
                alto: 40,
                texto: "Buy Now"
              ),
            )
          ],
        ),
      ),
    );
  }
}