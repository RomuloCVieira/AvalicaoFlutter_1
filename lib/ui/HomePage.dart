import 'package:flutter/material.dart';
import 'package:prova1/Funcoes.dart';

class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    final edtNome = new TextEditingController();
    final edtNota1 = new TextEditingController();
    final edtNota2 = new TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar:AppBar(
                title: Text("Prova_qt1", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.normal)),
                centerTitle: true,
                backgroundColor: Colors.black,
            ),
            body: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                        criarCampoTexto(this.edtNome, "Seu nome:", TextInputType.text),
                        criarCampoTexto(this.edtNota1, "Nota 1:", TextInputType.number),
                        criarCampoTexto(this.edtNota2, "Nota 2:", TextInputType.number),
                        criarBotao("Calcular", Colors.black, this.enviarNome)
                    ],
                ),
            )
        );
    }

    void enviarNome() {
        if (edtNome.text.isEmpty || edtNota1.text.isEmpty || edtNota2.text.isEmpty) {
            Funcoes().mostrarMensagem(context, "Atenção", "Preecha todos os Campos!!!");
        } else {
            var btn;
            var nome = edtNome.text;
            var n1 = num.tryParse(edtNota1.text);
            var n2 = num.tryParse(edtNota2.text);

            var result = (n1 + n2) / 2;
            if (result >= 7.0)
            {
                Funcoes().mostrarMensagem(context, "Parabéns!!! $nome", "você foi aprovado com a nota: " + result.toStringAsPrecision(2));
            } else {
                Funcoes().mostrarMensagem(context, "Sinto muito!!! $nome","Você foi reprovado com a nota: " + result.toStringAsPrecision(2));
            }
        }
    }

    Widget criarCampoTexto(TextEditingController c, String texto, TextInputType teclado) {
        return Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
                controller: c,
                decoration: InputDecoration(
                    labelText: texto,
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                ),
                keyboardType: teclado,
            ),
        );
    }
    Widget criarBotao(String texto, Color cor, clique) {
        return Padding(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
                color: cor,
                child: Text(texto, style: TextStyle(color: Colors.white, fontSize: 22),),
                onPressed: clique,
            ),
        );
    }
}