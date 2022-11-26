import 'questions.dart';

class Data {
  int _soruNo = 0;
  List<Question> _sorular = [
    Question('Dünyadaki tavuk sayısı insan sayısından fazladır', true),
    Question('Ankaranın başkenti Türkiyedir', false),
    Question('Kelebeklerin ömrü bir gündür', false),
    Question('Kaju fıstığı aslında bir meyvenin sapıdır', true),
    Question('Titanic gelmiş geçmiş en büyük gemidir', false),
    Question('Fatih Sultan Mehmet hiç patates yememiştir', true),
    Question(
        'Enflasyon terimi, çoğu ürün ve hizmetin fiyatlarındaki genel düşüşü ifade eder',
        false),
    Question('Kredi kartı ve banka kartı aynıdır', false),
    Question(
        'Ethereum, Bitcoin\'den sonra ikinci en büyük kripto para birimidir',
        true),
    Question(
        'Eyfel Kulesi açıldığında, Parisli sanat topluluğu ondan nefret etti.',
        true),
    Question('Sudan\'da Mısır\'dakinden daha fazla antik piramit var,', true),
    Question('Atlantik Okyanusu dünyanın en sıcak okyanusudur', false),
  ];

  String getSoruMetni(int soruNo) {
    return _sorular[soruNo].question;
  }

  bool getSoruCevabi(int soruNo) {
    return _sorular[soruNo].answer;
  }

  int soruSayisiArtir() {
    return _soruNo++;
  }

  int getSoruSayisi() {
    return _soruNo;
  }

  bool sorularBittiMi() {
    if (_soruNo >= _sorular.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void testSifirla() {
    _soruNo = 0;
  }
}
