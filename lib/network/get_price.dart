import 'package:http/http.dart' as http;
import 'dart:convert';

const base_url = 'https://apiv2.bitcoinaverage.com';

class NetworkHelper {
  Future<dynamic> getData(String selectedCurrency) async {
    Uri url = Uri.parse('$base_url/indices/global/ticker/BTC$selectedCurrency');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      // print(data);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
