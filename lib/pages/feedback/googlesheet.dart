import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:googleapis/sheets/v4.dart' as sheets;
import 'package:googleapis_auth/googleapis_auth.dart';

// Replace with your credentials JSON file path
const _credentials = r'''
{
  "type": "service_account",
  "project_id": "feedback-432710",
  "private_key_id": "e0fa2b063747db9b65ee7abd6fbc217a3e62df74",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCpYvbvJp9gZhk7\nnwwTeGtNgu0CDULlBa7uRrBh7nPQ9L2XTmMrlHDtk/WGIgq8IakgsunnR1QhqgBB\nDHAuWSNH2rAewxVK5WtBnMFdvQQCrBDz4rpUEk7r0tmPLB9V7xXO46RhYCzdmzxP\nRx6/MrqNBI7CTDtgAKuwfuC44wq6bMM2qd27BpopWZ4WWuQd+tqNLGwSOddUMfSZ\nKA2VAniwgmChV4cyW5O6d/ggCUFJyYXqOxrOURB7KrORpL7CpCGjzU7B/lu7O8UI\nQC4LmKS1um2K1sv7SHSIowEmtMJaxfKCnxHrb7CMqWlSimcKCeX7Q5k2QldNLVqU\n4C18cVr9AgMBAAECggEAOsMV1kZIUQlqZIgbCOAkHXo3nZgbJldv5cKJKxgtfoaB\nBS4Q8kvnV0wWh4dkwPpOcYUP5weUNK+EsgxOGI4c0q8XnTxhNR/csyDd5haN/x1R\nLkJwEH1feqklh2kvn8C3CJRpcMyME/7oD7qk/IBtPkGgAuCuUnI5HZwOeqVtEdnb\nAJuN7P5i4y/D8S5R10e4oTcxroKutZe5TiChcyUvAteu+QGPyHwZIuZK9g5lknlo\npMVPEVyIHVbqRkL9pCCjh4QJY32+H1j2vHHTr+9rq/6A60/P9HgqsYu2GbM9ba6b\nl4a1k61aqNC3GrQXnMJUX7YjA/+Faqh2js/iUykE0wKBgQDpMNxtgeM6BZCs7jnw\ndjNY0jcpgmEhMnkqKkmjOnjUJaslV5diku8r4NGEdxldaxR+luSGrdN8pEzBmm84\n3zXjlO9m/Hh9VGhbXd3EArOPzkFjmo5Y7A25mqgJqakGsDrJl/fxLPt3VGJG/1wG\nE1nibJ+7jdrVAt/jKb/su9p9VwKBgQC59G70uryEeYh9H7QOiv+N1d8KKg1+2RiY\n0tLpnagVCjpK+JVAMTCtEKIZ9Zz1lsGmUEr9BE5Kre5iJXNaMtUcfwJgmIsuohu9\nbG0Np8bb21O2kQtBH8qYrh7pk+wTCGZ4z1U3Z+TkZCujZIk/mLUOjVKT8XbEYNuK\nsT4AB55hywKBgEbFj4CktQO9AKWbP3ZdSUQhuKAec8ARg3hqkSK68kTgkcqphMZj\n9baJas0bIFWb1AJ/ZSgCxXbEno77gdnu1HoXj3jgEulmnq1sFYwRjdGNNYc3NxCB\nw8Ca0XjtRuFCxvS77IIDtuYGdDU79v/ZC6SOdwQDD3EqiCx3VUpR0QPNAoGBAKjb\nTFIQq5UEIyuzuTYnhA3QsrsxGpYgHxTPBFS9I98PLYXcmvLyeAf/faNjBAeCwQ/8\nA0wkN8/ahwg6h7fVRu2ca5U5j9FlxRjKN3DZ9Fq6nBbBON4HN1pTaqCiARH7Y8m6\nQ+CPCCtYxsOVTIgia+7t55mN/1Itvc4ASpOOV4TnAoGALGL3tfx5GnU9SwzJEWGr\nBCH6Bh8GKcX0TEWlTUhe2sXLNLp7y32ZJej1fb35DkJr+thjjAR3CufA15Q7/l99\nO1B42nsIoTPA6MujaKMUWJmWjRLPiqXxqmt1rleW4BNdCB0YcdbLS649NI6aOCyS\nxcdw18hwI/u2QQuo36y6IeU=\n-----END PRIVATE KEY-----\n",
  "client_email": "iit-tp-insti-app@feedback-432710.iam.gserviceaccount.com",
  "client_id": "106375104829481002074",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/iit-tp-insti-app%40feedback-432710.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

'''; // Copy the JSON from your downloaded file

const _spreadsheetId = '1xep7Ks6SAbzdpoK5VZIjR0osZcMwL_3Q5Po-Kh-1aUA'; // Replace with your spreadsheet ID

Future<void> appendToSheet(List<List<dynamic>> values) async {
  final client = http.Client();
  final credentials = ServiceAccountCredentials.fromJson(_credentials);

  final scopes = [sheets.SheetsApi.SpreadsheetsScope];

  final authClient = await clientViaServiceAccount(credentials, scopes);

  final sheetsApi = sheets.SheetsApi(authClient);

  final range = 'Sheet1!A2'; // Replace with the range you want to write to

  final valueRange = sheets.ValueRange.fromJson({
    'range': range,
    'values': values,
  });

  final response = await sheetsApi.spreadsheets.values.append(
    valueRange,
    _spreadsheetId,
    range,
    valueInputOption: 'RAW',
  );

  print('Response status: ${response.statusCode}');
  client.close();
}
 