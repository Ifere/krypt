
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'YOUR-API-KEY-HERE';

class CoinData {
  String urlBTC = "https://rest.coinapi.io/v1/exchangerate/BTC/";
  String urlETH = "https://rest.coinapi.io/v1/exchangerate/ETH/";
  String urlLTC = "https://rest.coinapi.io/v1/exchangerate/LTC/";

  dynamic btcVal = '-';
  dynamic ethVal = '-';
  dynamic ltcVal = '-';
  String btcRate = 'USD';
  String ethRate = 'USD';
  String ltcRate = 'USD';


  String getBTCPair(String pair) {
    btcRate = pair;
    return urlBTC + "$pair";
  }

  String getETHPair(String pair) {
    ethRate = pair;
    return urlETH + "$pair";
  }

  String getLTCPair(String pair) {
    ltcRate = pair;
    return urlLTC + "$pair";
  }

  void getBTCData(String url) async {
    final resp = await http.get(
      url,
      headers: { "X-CoinAPI-Key" : "3152C52C-3370-4AEB-859A-BA383ACDEC42" },
    );
    if (resp.statusCode == 200) {
      var data = jsonDecode(resp.body)["rate"];
      btcVal = double.parse(data.toString()).toStringAsFixed(4);
    }
  }
  void getETHData(String url) async {
    final resp = await http.get(
      url,
      headers: { "X-CoinAPI-Key" : "3152C52C-3370-4AEB-859A-BA383ACDEC42" },
    );
    print(resp);
    if (resp.statusCode == 200) {
      var data = jsonDecode(resp.body)["rate"];
      ethVal = double.parse(data.toString()).toStringAsFixed(4);
    }
  }
  void getLTCData(String url) async {
    final resp = await http.get(
      url,
      headers: { "X-CoinAPI-Key" : "3152C52C-3370-4AEB-859A-BA383ACDEC42" },
    );
    print(resp);
    if (resp.statusCode == 200) {
      var data = jsonDecode(resp.body)["rate"];
      ltcVal = double.parse(data.toString()).toStringAsFixed(4);
    }
  }


   //TODO: Create your getCoinData() method here.

}
