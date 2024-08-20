import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class DevPage extends StatelessWidget {
  final List<Map<String, String>> developers = [
    {
      'img': 'assets/images/developers/dev7.jpg',
      'name': 'Yamini Shree',
      'roll': 'CS21B056',
      'linkedin': 'http://linkedin.com/in/yamini-baskar-b04644241',
    },
    {
      'img': 'assets/images/developers/dev2.jpg',
      'name': 'Jai Pradeep',
      'roll': 'CS23B024',
      'linkedin': 'http://linkedin.com/in/jai-pradeep-jayachandran-1910241b6',
    },
    {
      'img': 'assets/images/developers/dev3.jpg',
      'name': 'Stany',
      'roll': 'CS23B059',
      'linkedin': 'https://in.linkedin.com/in/koppala-stanycletus-7540b6272',
    },
    {
      'img': 'assets/images/developers/dev4.jpg',
      'name': 'Adithya',
      'roll': 'CS23B001',
      'linkedin': 'https://in.linkedin.com/in/ananth-adithya',
    },
    {
      'img': 'assets/images/developers/dev5.jpg',
      'name': 'Sudhanva',
      'roll': 'CS23B051',
      'linkedin': 'https://in.linkedin.com/in/sudhanva321',
    },
    {
      'img': 'assets/images/developers/dev6.jpg',
      'name': 'Srikar',
      'roll': 'CS23B049',
      'linkedin': 'https://www.linkedin.com/in/srikar-vilas-donur-14b211323?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
    },
  ];

  final String rickrollUrl = 'https://youtu.be/xvFZjo5PgG0?si=FpflRy_1jS7vQaTo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
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
              'Developers',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              // Lottie Animation in Scrollable Area
              Center(
                child: Lottie.asset(
                  'assets/animations/developers.json',
                  width: 150, // Adjust size if needed
                  height: 150,
                ),
              ),
              SizedBox(height: 20),
              // Developer Cards
              for (int i = 0; i < developers.length; i += 2)
                _buildRow(
                  context,
                  developers[i],
                  i + 1 < developers.length ? developers[i + 1] : null,
                ),
              SizedBox(height: 30), // Space before feedback section
              // Feedback Section
              // Center(
              //   child: Column(
              //     children: [
              //       Text(
              //         "To know more, Click below",
              //         style: TextStyle(
              //           fontSize: 18,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.black, // Adjust text color for readability
              //         ),
              //         textAlign: TextAlign.center, // Center text alignment
              //       ),
              //       SizedBox(height: 15), //
              //       Center(
              //         child: Lottie.asset(
              //           'assets/animations/rickroll.json',
              //           width: 150, // Adjust size if needed
              //           height: 150,
              //         ),
              //       ), // Space between text and button
              //       GestureDetector(
              //         onTap: () {
              //           _launchURL(context, rickrollUrl);
              //         },
              //         child: Container(
              //           child: Link(
              //               uri: Uri.parse(rickrollUrl),
              //               builder: (context, followLink) =>
              //                   ElevatedButton(
              //                     onPressed: followLink,
              //                     style: ElevatedButton.styleFrom(
              //                       backgroundColor: Colors.blue, // Background color
              //                       foregroundColor: Colors.white, // Text color
              //                       elevation: 0, // Remove elevation
              //                       shadowColor: Colors.transparent, // Remove shadow
              //                       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Adjust padding if needed
              //                     ),
              //                     child: const Text(
              //                       'Click Here',
              //                       style: TextStyle(
              //                         fontSize: 20, // Set your desired font size here
              //                         fontWeight: FontWeight.bold, // Optional: makes the text bold
              //                       ),
              //                     ),
              //                   )
              //
              //
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 50), // Space after button
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, Map<String, String> dev1, Map<String, String>? dev2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildDevCard(context, dev1),
        if (dev2 != null) _buildDevCard(context, dev2),
      ],
    );
  }

  Widget _buildDevCard(BuildContext context, Map<String, String> developer) {
    return GestureDetector(
      onTap: () => _showEnlargedImage(
        context,
        developer['img']!,
        developer['name']!,
        developer['roll']!,
        developer['linkedin']!,
      ),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(developer['img']!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            developer['name']!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Adjust text color for contrast
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  void _showEnlargedImage(BuildContext context, String imgPath, String name, String roll, String linkedinUrl) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 5), // Blue border
              borderRadius: BorderRadius.circular(20), // Match the dialog shape
            ),
            child: SizedBox(
              width: 390,
              height: 280,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    width: 130,
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$name\n\n$roll',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          GestureDetector(
                            onTap: () => _launchURL(context, linkedinUrl),
                            child: Container(
                              margin: EdgeInsets.only(right: 1),
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Adjusted padding
                              decoration: BoxDecoration(
                                color: Color(0xFF0077B5),
                                borderRadius: BorderRadius.circular(16), // Adjusted border radius
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                    onPressed: () => _launchURL(context, linkedinUrl),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: Colors.white,
                                      side: BorderSide.none,
                                      shadowColor: Colors.transparent,
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                    ),
                                    child: Text('LinkedIn'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _launchURL(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not launch $url'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
        ),
      );
    }
  }
}
