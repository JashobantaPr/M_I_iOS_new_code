// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:incentivesgit/presentation/certificate_screens/certificate_Tabbar/controller/buzzeTabBar_Controller.dart';

// class ScopeCertificateDialougeScreen extends StatelessWidget {
//   ScopeCertificateDialougeScreen({Key? key});

//   final CertificateTabBarController controller =
//       Get.find<CertificateTabBarController>();

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: [
//           Expanded(
//             child: Obx(
//               () => ListView.builder(
//                 padding: EdgeInsets.zero,
//                 itemCount: controller.getCountryData.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final country = controller.getCountryData[index];
//                   return ListTile(
//                     title: Text(
//                       country.name ?? '',
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontFamily: GoogleFonts.roboto().fontFamily,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     onTap: () {
//                       controller.setSelectedCountry(country);
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//           Obx(() {
//             if (controller.selectedCountry.value != null) {
//               return Column(
//                 children: [
//                   Divider(
//                     color: Colors.grey,
//                     thickness: 1,
//                   ),
//                   ListTile(
//                     leading: Checkbox(
//                       value: false,
//                       onChanged: (bool? value) {},
//                     ),
//                     title: RichText(
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: 'Mark ',
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontFamily: GoogleFonts.roboto().fontFamily,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           TextSpan(
//                             text: '${controller.selectedCountry.value!.name}',
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontFamily: GoogleFonts.roboto().fontFamily,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                           TextSpan(
//                             text: ' for a default view',
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontFamily: GoogleFonts.roboto().fontFamily,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             } else {
//               return SizedBox.shrink(); // Hide if no country selected
//             }
//           }),
//           SizedBox(
//             width: 241,
//             height: 40,
//             child: ElevatedButton(
//               onPressed: () {
//                 controller
//                     .setCityName(controller.selectedCountry.value!.name ?? '');
//                 Get.back();
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red,
//               ),
//               child: Text(
//                 'Apply',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
