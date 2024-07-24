import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/News/MostTrendingNews/controller/mosttrending_news_Anniversariescontroller.dart';
import 'package:intl/intl.dart';

class MostTrendingNewsScreen
    extends GetWidget<MostTrebdingNewsAnniversariesController> {
  const MostTrendingNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> certificatesList = [
      {
        "name": "Anushka Sharma ",
        "postedDate": "2023-06-25T12:34:56.789Z",
        "certificateName": "Best Employee",
        "likes": "120",
        "comments": "15",
      },
      {
        "name": "Anushka Sharma ",
        "postedDate": "2023-05-20T09:22:33.456Z",
        "certificateName": "Team Player",
        "likes": "98",
        "comments": "8",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                      Icon(Icons.calendar_month, color: Colors.grey, size: 15),
                ),
                Text(
                  'Overview of the year',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: certificatesList.length,
                itemBuilder: (context, index) {
                  var certificate = certificatesList[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [],
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  certificate["name"]!,
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color(0xFF383853)),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Received a certificate: ${certificate["certificateName"]}',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Color(0xFF383853)),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  DateFormat('dd MMMM yyyy hh:mm a').format(
                                    DateTime.parse(certificate["postedDate"]!),
                                  ),
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Received a certificate ',
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      'Likes',
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 30,
                                      width: 2,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Comments',
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
