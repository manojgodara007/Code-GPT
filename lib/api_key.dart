import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = "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";

class Api {
  static final url = Uri.parse("https://api.openai.com/v1/completions");
  static final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey'
  };
  static generateTxet(String text) async {
    var res = await http.post(url,
        headers: headers,
        body: jsonEncode({
          "model": "text-davinci-003",
          "prompt": text,
          "max_tokens": 100,
          "temperature": 0,
          "stop": "/n",
          "top_p": 1,
        }));

    var data = jsonDecode(res.body.toString());
    return ("${data['choices'][0]["text"]}");
  }
}
