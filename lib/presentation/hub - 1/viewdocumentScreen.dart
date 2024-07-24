import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewDocumentScreen extends StatelessWidget {
  final String documentName;

  const ViewDocumentScreen({super.key, required this.documentName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "",
            style: TextStyle(color: Colors.white),
          ),
          //  backgroundColor: const Color(0XFFE41C39),
          iconTheme: const IconThemeData(color: Colors.white),
          // leading: IconButton(
          //   onPressed: () => Get.back(),
          //   icon: Icon(Icons.arrow_back),
          // ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  documentName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Card(
                    color: Colors.grey,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: 250, // Specify the width of the Card
                      height: 70, // Specify the height of the Card
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "No preview available",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
