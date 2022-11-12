import 'package:http/http.dart' as http;

class CallApi {
  final String baseUrl = 'https://restcountries.com/v3.1';

  getData(apiUrl) async {
    var fullUrl = baseUrl + apiUrl;
    try {
      return await http.get(
        Uri.parse(
          fullUrl,
        ),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
    } catch (e) {
      // print(e);
      return null;
    }
  }
}
