import 'package:bilgi_yarismasi/constants.dart';
import 'package:bilgi_yarismasi/data.dart';
import 'package:flutter/material.dart';

//scrolling
void main() => runApp(BilgiTesti());
//String sonucMetni = '';

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> sonuclar = [];
  Data data_1 = Data();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Row(
            children: [Text("Doğru Cevap Sayisi: ${dogruCevapSayisiBulma()}\nYanlış Cevap: ${data_1.getSoruSayisi() + 0 - dogruCevapSayisiBulma()}",style: TextStyle(color: Colors.yellowAccent),)],
          ),
        ),
        Expanded(
          flex: 14,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: soruBlogu(),
          ),
        ),
        Expanded(
          flex: 2,
          child: sonucGoster(),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: butonYerlestir(),
          ),
        )
      ],
    );
  }

  soruBlogu() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          soruSayiGostergesi(),
          Text(
            data_1.getSoruMetni(
              data_1.getSoruSayisi(),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  soruSayiGostergesi() {
    return CircleAvatar(
      radius: 50,
      child: Text(
        '${data_1.getSoruSayisi() + 1}',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }

  sonucGoster() {
    return Wrap(
      //spacing: 0,
      //runSpacing: 0,
      //children: sonuclar,
      children: sonuclar,

      //sonucMetniGoster(),
      //Text('${data_1.getSoruSayisi() + 1}'),
      //sonuclar[data_1.getSoruSayisi()],
    );
  }

  butonYerlestir() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: (Colors.red),
                padding: EdgeInsets.all(12),
              ),
              child: Icon(
                Icons.thumb_down,
                size: 30.0,
              ),
              onPressed: () {
                buttonFonksiyonu(false);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: (Colors.green),
                padding: EdgeInsets.all(12),
              ),
              child: Icon(
                Icons.thumb_up_alt_rounded,
                size: 30.0,
              ),
              onPressed: () {
                buttonFonksiyonu(true);
              },
            ),
          ),
        ),
      ],
    );
  }

  dogruCevapSayisiBulma() {
    int dogruSayisi = 0;
    for (int i = 0; i < sonuclar.length; i++) {
      sonuclar[i] == kDogruCevap ? dogruSayisi++ : dogruSayisi = dogruSayisi;
    }
    return dogruSayisi;
  }

  void buttonFonksiyonu(bool secilenButon) {
    sonuclar.add(Text(
      '${data_1.getSoruSayisi() + 1}',
      style: TextStyle(
        fontSize: 24,
      ),
    ));
    if (data_1.sorularBittiMi()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("Sorular tamamlandı!"),
            content: Text(
              'Soru sayısı: ${data_1.getSoruSayisi() + 1}\nDoğru Cevap: ${dogruCevapSayisiBulma()}\nYanlış Cevap: ${data_1.getSoruSayisi() + 1 - dogruCevapSayisiBulma()}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new TextButton(
                child: Text("Başa dön"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    data_1.testSifirla();
                    sonuclar = [];
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        data_1.getSoruCevabi(data_1.getSoruSayisi()) == secilenButon
            ? sonuclar.add(kDogruCevap)
            : sonuclar.add(kYanlisCevap);
        data_1.soruSayisiArtir();
      });
    }
  }

// sonucMetniGoster() {
//   sonucMetni +=
//       '${data_1.getSoruSayisi() + 1} ${sonuclar[data_1.getSoruSayisi()]}';
//   return Text('$sonucMetni');
// }
}
