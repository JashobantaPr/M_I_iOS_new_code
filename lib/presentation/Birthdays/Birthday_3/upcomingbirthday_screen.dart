import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Birthdays/Birthday_3/controller/upcomingbirthdaycontroller.dart';
import 'package:intl/intl.dart';

class UpcomingBirthdayScreen extends GetWidget<UpcomingBirthDayController> {
  const UpcomingBirthdayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> certificatesList = [
      {
        "name": "Anushka Sharma ",
        "postedDate": "2023-06-25T12:34:56.789Z",
        "certificateName": "Best Employee",
        "profile": "https://example.com/profile1.jpg",
        "likes": "120",
        "comments": "15",
      },
      {
        "name": "Anushka Sharma ",
        "postedDate": "2023-05-20T09:22:33.456Z",
        "certificateName": "Team Player",
        "profile": "https://example.com/profile2.jpg",
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
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.red, width: 1.5),
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    certificate["profile"]!,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.person, size: 60);
                                    },
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
