import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis/sheets/v4.dart' as sheets;
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:lottie/lottie.dart';


// Replace with your credentials JSON
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

''';

const _spreadsheetId = '1xep7Ks6SAbzdpoK5VZIjR0osZcMwL_3Q5Po-Kh-1aUA';

class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({super.key});

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final TextEditingController _improvementsController = TextEditingController();
  final TextEditingController _bugsController = TextEditingController();
  final TextEditingController _othersController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double _userExperienceRating = 0;
  double _recommendationRating = 0;
  int _experienceRatingCircle = 0;

  @override
  void dispose() {
    _improvementsController.dispose();
    _bugsController.dispose();
    _othersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF81D4FA),
                Color.fromARGB(255, 37, 151, 244),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10.0,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: const Color.fromARGB(0, 178, 94, 94),
            title: const Text(
              'Feedback',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
                letterSpacing: 2.0, // Increase letter spacing
                // Replace with your custom font
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

              Lottie.asset(
                'assets/animations/feed2.json',
                height: 270,
                width: double.infinity,

              ),
              SizedBox(height: 20,),
              _buildFeedbackQuestion('Any improvements you think we could implement?', _improvementsController),
              SizedBox(height: 16),
              _buildFeedbackQuestion('Any bugs, reports, issues?', _bugsController),
              SizedBox(height: 16),
              _buildFeedbackQuestion('Others?', _othersController),
              SizedBox(height: 16),
              _buildCircleRatingQuestion('How likely will you recommend this app to a friend?', (rating) {
                setState(() {
                  _experienceRatingCircle = rating;
                });
              }),
              SizedBox(height: 16),
              _buildStarRatingQuestion('Rate the overall user experience', (rating) {
                setState(() {
                  _recommendationRating = rating;
                });
              }),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _submitFeedback();
                  }
                },
                child: Text('Submit',
                  style: TextStyle(color: Colors.blue),),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildFeedbackQuestion(String question, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue), // Blue border when not focused
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0), // Blue border when focused
            ),

            hintText: 'Enter your response here',
          ),
          maxLines: 3,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please provide an answer';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildStarRatingQuestion(String question, ValueChanged<double> onRatingChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Slider(
          value: _recommendationRating,
          onChanged: onRatingChanged,
          min: 0,
          max: 10,
          divisions: 10,
          label: _recommendationRating.toString(),
          activeColor: Colors.blue,
        ),
        Text(
          '${_recommendationRating.toInt()} Stars',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildCircleRatingQuestion(String question, ValueChanged<int> onRatingChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Slider(
          value: _experienceRatingCircle.toDouble(),
          onChanged: (rating) {
            onRatingChanged(rating.toInt());
          },
          min: 0,
          max: 10,
          divisions: 10,
          label: _experienceRatingCircle.toString(),
          activeColor: Colors.blue,
        ),
        Text(
          'Rating: ${_experienceRatingCircle.toInt()}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  void _submitFeedback() async {
    final improvements = _improvementsController.text;
    final bugs = _bugsController.text;
    final others = _othersController.text;
    final experienceRating = _experienceRatingCircle;
    final recommendationRating = _recommendationRating;

    try {
      final credentials = ServiceAccountCredentials.fromJson(_credentials);
      final client = await auth.clientViaServiceAccount(credentials, [sheets.SheetsApi.spreadsheetsScope]);
      final sheetsApi = sheets.SheetsApi(client);

      final feedbackData = [
        [improvements, bugs, others, experienceRating.toString(), recommendationRating.toString()],
      ];

      final valueRange = sheets.ValueRange.fromJson({
        'range': 'Sheet1!A1:E1',
        'values': feedbackData,
      });

      await sheetsApi.spreadsheets.values.append(
        valueRange,
        _spreadsheetId,
        'Sheet1!A1:E1',
        valueInputOption: 'RAW',
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Your feedback has been submitted successfully.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred while submitting your feedback. Please try again later.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
