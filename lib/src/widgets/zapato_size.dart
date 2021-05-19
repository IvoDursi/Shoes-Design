import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapatos/src/models/zapato_model.dart';
import 'package:zapatos/src/pages/zapato_desc.dart';

class ZapatoSizePreview extends StatelessWidget {

  final bool fullScreen;

  const ZapatoSizePreview({
    this.fullScreen = false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!this.fullScreen){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ZapatoDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (this.fullScreen) ? 5 : 30, 
          vertical: (this.fullScreen) ? 5 : 0
        ),
        child: Container(
          width: double.infinity,
          height: (this.fullScreen) ? 410 : 430,
          decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: (!this.fullScreen) ? BorderRadius.circular(50) : BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50),topLeft: Radius.circular(40),topRight: Radius.circular(40))
          ),
          child: Column(
            children: [
              //Zapato con su sombra
              _ZapatoConSombra(),
              if (!this.fullScreen)
              _ZapatoTallas()
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _CajasTalla(numero: 7),
          _CajasTalla(numero: 7.5),
          _CajasTalla(numero: 8),
          _CajasTalla(numero: 8.5),
          _CajasTalla(numero: 9),
          _CajasTalla(numero: 9.5)
        ],
      ),
    );
  }
}

class _CajasTalla extends StatelessWidget {

  final double numero;

  const _CajasTalla({
    this.numero
  });

  @override
  Widget build(BuildContext context) {

  final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: (){
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel.talla = this.numero;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text("${numero.toString().replaceAll(".0", "")}", style: TextStyle(
          color: (this.numero == zapatoModel.talla) ?  Colors.white : Color(0xffF1A23A),
          fontSize: 16,
          fontWeight: FontWeight.bold
        )),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: (this.numero == zapatoModel.talla) ? Color(0xffF1A23A) : Colors.white,
          boxShadow: [
            if(this.numero == zapatoModel.talla)
            BoxShadow(
              color: Color(0xffF1A23A), blurRadius:10, offset: Offset(0,5)
            ),
          ]
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(bottom: 20, right: 0, child: _ZapatoSombra()),
          Image(image: AssetImage(zapatoModel.assetImage),)
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Color(0xffEAA14E), blurRadius:40
            )
          ]
        ),
      ),
    );
  }
}