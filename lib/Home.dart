import 'package:flutter/material.dart';
import 'package:alcool_gasolina/main.dart';


class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _textEditingControllerOne = TextEditingController();
  TextEditingController _textEditingControllerTwo = TextEditingController();
  String _resultado = "";

  void _calcular() {
var precoAlcool = double.tryParse(_textEditingControllerOne.text.replaceAll(",", "."));
var precoGasolina = double.tryParse(_textEditingControllerTwo.text.replaceAll(",", "."));

if(precoAlcool != null && precoGasolina != null){
  double conta = precoAlcool / precoGasolina;

  if(conta <= 0.7){


    setState(() {
     _resultado = "Vale à pena colocar álcool! ($conta)";

    });
  }
  else{
    setState(() {
      _resultado = "Não vale à pena colocar álcool ($conta)";
    });
  }
}


      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Álcool ou gasolina", style: TextStyle(fontFamily: "Arial Rounded MT Bold", fontSize: 30 ),),

    ),
      body:
      Container(
        margin: EdgeInsets.fromLTRB(10,15,10,5),
      padding: EdgeInsets.all(20),
        child: SingleChildScrollView(

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('images/logo.png'),
            Divider(height: 35,),

            Text("Saiba qual a melhor "
                "opção para abastecimento do seu "
                "carro!", style: TextStyle(fontSize: 25, fontFamily:
            "Arial Hebrew", fontWeight: FontWeight.bold,
            ),),
            Divider(height: 35,),

            TextFormField(
              keyboardType: TextInputType.number,
              onFieldSubmitted: (String texto){
                var precoAlcool = _textEditingControllerOne.text;
              },
              controller: _textEditingControllerOne,
              decoration: InputDecoration(
                labelText: "Preço do álcool, ex: 4,11",


              ),
              style: TextStyle(
                fontSize: 19
              ),

            ),
            Divider(height: 35,),

            TextFormField(
              keyboardType: TextInputType.number,
              onFieldSubmitted: (String texto){
                var precoGasolina = _textEditingControllerTwo.text;

              },
              decoration: InputDecoration(
                labelText: "Preço da gasolina, ex: 4,90 ",

              ),
                style: TextStyle(
                fontSize: 19,
              ),
              controller: _textEditingControllerTwo,
              ),
            Divider(height: 35,),

            ElevatedButton(onPressed: (){
_calcular();



            },
                child: Text('Calcular', style: TextStyle(fontSize: 25),),
              style:  ElevatedButton.styleFrom( textStyle: TextStyle(fontFamily: 'Baskerville'),
                backgroundColor: Colors.blue.shade800,
                  side: BorderSide( style: BorderStyle.solid, strokeAlign: StrokeAlign.outside,
                  ),



              ),
            ),
            Divider(height: 35,),
            
            Text(this._resultado, style: TextStyle(fontFamily: "Baskerville", fontSize: 25, fontWeight: FontWeight.bold),)
            

          ],

        ),

      )




    ));
  }
}
