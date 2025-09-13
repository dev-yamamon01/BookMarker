
import 'dart:typed_data';

class UrlUtils {

//与えられた文字列がURLかどうか判定する関数
//「http://~」「https://~」をtrueとする
  static bool checkInputUrl(String url) {
    if (url.contains("http://") || url.contains("https://")) {
      return true;
    } else {
      return false;
    }
  }

  static Uint8List getTransparentImage() {
    return Uint8List.fromList([
      0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A,
      0x00, 0x00, 0x00, 0x0D, 0x49, 0x48, 0x44, 0x52,
      0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
      0x08, 0x06, 0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4,
      0x89, 0x00, 0x00, 0x00, 0x0A, 0x49, 0x44, 0x41,
      0x54, 0x78, 0x9C, 0x63, 0x00, 0x01, 0x00, 0x00,
      0x05, 0x00, 0x01, 0x0D, 0x0A, 0x2D, 0xB4, 0x00,
      0x00, 0x00, 0x00, 0x49, 0x45, 0x4E, 0x44, 0xAE,
      0x42, 0x60, 0x82,
    ]);
  }

  //与えられたURLからドメイン部を抜き出す関数
  static DevidedUrl extractDomainAndDir(String url){
    List<String> devided=url.split("/");//「/」で配列分け
    //以下のRangeErrorの分岐処理
    if(devided.length<=2){
      //devidedが2要素数以下の場合は空文字を返す
      return DevidedUrl("","");
    }
    String domainText=devided[2];//ドメイン部の抜き出し
    String dirText=devided.sublist(3).join("/");//ディレクトリ部の抜き出し

    DevidedUrl devidedUrl=DevidedUrl(domainText, dirText);//カスタムクラスに格納することでふたつの変数を返せるようにする

    return devidedUrl;
  }

}

class DevidedUrl {
  final String domain;
  final String dir;

  DevidedUrl(this.domain, this.dir);
}