import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getOpenAI(String prompt) async {
  final apiKey = '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';
  final response = await http.post(
    Uri.parse('https://api.openai.com/v1/engines/text-davinci-003/completions'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey'
    },
    body: jsonEncode({
      'prompt': prompt,
      'max_tokens': 50,
      'n': 1,
      'stop': ['\n']
    }),
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final completions = data['choices'][0]['text'];
    return completions;
  } else {
    throw Exception('Failed to load data from OpenAI API');
  }
}
