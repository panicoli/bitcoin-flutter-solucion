//1. Importar lo packages necesarios.
import 'dart:convert';
import 'package:http/http.dart' as http;

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

const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  //3. Crear un metodo Asyncrono llamado getCoinData() que devuelva un Future (price data).
  Future getCoinData() async {
    //4. Crear una url convinando bitcoinAverageURl con la moneda que nos interesa saber, BTC a USD.
    String requestURL = '$bitcoinAverageURL/BTCUSD';
    //5. Hacer una request (GET) a la URL y esperar la respuesta.
    http.Response response = await http.get(requestURL);

    //6. Checkar que la request fue succesful.
    if (response.statusCode == 200) {
      //7. Usar 'dart:convert' package y guardar en una variable decodedData lo que viene de Bitcoinaverage.
      var decodedData = jsonDecode(response.body);
      //8. Obtene el ultimo precio del BTC con respecto al USD consultando 'last' y guardalo en la variable lastPrice.
      var lastPrice = decodedData['last'];
      //9. Del metodo, devolve lastPrice.
      return lastPrice;
    } else {
      //10. Manejar cualquier error que venga de la request.
      print(response.statusCode);
      //Opcional: throw un error si falla la request.
      throw 'Problemas con la request';
    }
  }
}
