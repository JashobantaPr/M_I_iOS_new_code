import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/Approvals/request_pending_viewdetails/controller/request_pendingController.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:intl/intl.dart';

class RequestPendingViewDetailsScreen
    extends GetWidget<RequestPendingViewDetailsController> {
  const RequestPendingViewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, _) {
        return Scaffold(
          appBar: _customAppBar(),
          body: Obx(
            () => Container(
              width: 385,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    _buildSectionHeader('Claim Submission For'),
                    _buildDivider(),
                    _buildBudgetHistory('Campaign Name', ':',
                        controller.myRequestPending.value?.campaignName ?? ''),
                    _buildBudgetHistoryy(
                      'Requested By',
                      ':',
                      controller.myRequestPending.value?.addedUser ?? '',
                      controller.myRequestPending.value?.requestedByProfile ??
                          '',
                    ),

                    _buildBudgetHistory('Request Type ', ':',
                        controller.myRequestPending.value?.description ?? ''),
                    _buildBudgetHistory11('Date of request', ':',
                        controller.myRequestPending.value?.createdAt ?? ''),
                    SizedBox(
                      height: 14,
                    ),
                    _buildBudgetHistory2(
                        'Status',
                        ':',
                        controller.myRequestPending.value?.approvalStatus ??
                            ''),
                    _buildSectionHeader('Basic Details'),
                    _buildDivider(),
                    _buildBudgetHistory('Claim Id', ':',
                        controller.myRequestPending.value?.claimCode ?? ''),
                    _buildBudgetHistory('Submission Date', ':',
                        controller.myRequestPending.value?.createdAt ?? ''),
                    _buildBudgetHistory(
                        'Total invoice value',
                        ':',
                        controller.myRequestPending.value?.totalInvoiceValue ??
                            ''),
                    // _buildBudgetHistory('Quantity', ':',
                    //     controller.myRequestPending.value?.quantity ?? ''),
                    _buildBudgetHistory(
                      'Points',
                      ': ',
                      controller.myRequestPending.value?.points ?? '',
                    ),
                    _buildBudgetHistory('Invoice Id', ':',
                        controller.myRequestPending.value?.invoiceId ?? ''),
                    _buildBudgetHistory111(
                      context,
                      'Attachment the claim\nproof(invoice copy)',
                      ': ',
                      'View invoice image', // Pass the appropriate buttonText for display
                      controller.myRequestPending.value?.invoiceImageUrl ?? '',
                    ),

                    _buildSectionHeader('Business Hierarchy'),
                    _buildDivider(),
                    _buildBudgetHistory(
                        'Country',
                        ':',
                        getCountryFromBusinessHierarchy(controller
                                .myRequestPending
                                .value
                                ?.claimBusinessHierarchy ??
                            [])),

                    _buildBudgetHistory(
                        'State',
                        ':',
                        getStateFromBusinessHierarchy(controller
                                .myRequestPending
                                .value
                                ?.claimBusinessHierarchy ??
                            [])),
                    _buildBudgetHistory(
                        'City',
                        ':',
                        getCityFromBusinessHierarchy(controller.myRequestPending
                                .value?.claimBusinessHierarchy ??
                            [])),
                    _buildBudgetHistory(
                      'Store',
                      ': ',
                      getStoreFromBusinessHierarchy(controller
                              .myRequestPending.value?.claimBusinessHierarchy ??
                          []),
                    ),
                    _buildSectionHeader('Product Hierarchy'),
                    _buildBudgetHistory(
                      'Brand',
                      ': ',
                      getBrandFromProductHierarchy(controller
                              .myRequestPending.value?.claimProductHierarchy ??
                          []),
                    ),
                    _buildBudgetHistory(
                      'Product',
                      ': ',
                      getProductFromProductHierarchy(controller
                              .myRequestPending.value?.claimProductHierarchy ??
                          []),
                    ),
                    _buildBudgetHistory(
                      'Edition',
                      ': ',
                      getEditionFromProductHierarchy(controller
                              .myRequestPending.value?.claimProductHierarchy ??
                          []),
                    ),
                    _buildBudgetHistory(
                      'SKU',
                      ': ',
                      getSkuFromProductHierarchy(controller
                              .myRequestPending.value?.claimProductHierarchy ??
                          []),
                    ),
                    _buildSectionHeader('Other Fields'),
                    _buildDivider(),
                    _buildBudgetHistory('Which City You like', ':', "Pune"),

                    _buildBudgetHistory('Select Purchased', ':', "01-05-2024"),

                    _buildBudgetHistory1112(
                      context,
                      'Multiple Files',
                      ':',
                      'View Invoice Copy',
                      controller.myRequestPending.value?.multipleFiles ?? [],
                    ),

                    _buildBudgetHistory(' Number', ':', '200'),
                    _buildBudgetHistory('State You Like?', ':', 'Maharashtra'),
                    _buildBudgetHistory('Village You Like', ':', 'Hello'),
                    _buildBudgetHistory('City Names', ':', 'Option 1'),
                    _buildBudgetHistory('Name', ':', 'ggh'),
                    _buildBudgetHistory('Description', ':', 'ggg'),
                    // _buildSectionHeader('Approver Details'),
                    // _buildDivider(),
                    // _buildBudgetHistory('Approver ', ':',
                    //     controller.myRequestPending.value?.addedUser ?? ''),
                    // _buildBudgetHistory('Approver Email ', ':',
                    //     controller.myRequestPending.value?.approverEmail ?? ''),
                    // _buildBudgetHistory(
                    //     'Comments',
                    //     ':',
                    //     controller.myRequestPending.value?.approverComment ??
                    //         ''),
                    // _buildBudgetHistory(' Approval Date', ':',
                    //     controller.myRequestPending.value?.createdAt ?? ''),
                    // _buildCommentsSection(),
                    // _buildActionButtons(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String extractFileName(String url) {
    return url.split('/').last;
  }

  Widget _buildBudgetHistory1112(
    BuildContext context,
    String title,
    String colon,
    String fileName,
    List<String> multipleFiles, // Updated to List<String>
  ) {
    return GestureDetector(
      onTap: () {
        if (multipleFiles.isNotEmpty) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Image.network(
                multipleFiles[0], // Display the first image in the list
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text(
                      'No image Found',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                      ),
                    ),
                  );
                },
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Close'),
                ),
              ],
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 60),
                Text(
                  colon,
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  fileName, // Display the file name here
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: const Color.fromARGB(255, 38, 13, 161),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Widget _buildBudgetHistory111(
    BuildContext context,
    String title,
    String colon,
    String buttonText,
    String invoiceImage,
  ) {
    String displayText = buttonText; // Initially display the button text

    return GestureDetector(
      onTap: () {
        // Update displayText to show the invoice image filename when tapped
        displayText = invoiceImage;
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Image.network(
              invoiceImage,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text(
                    'No image Found',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                    ),
                  ),
                );
              },
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                Text(
                  colon,
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: Text(
                    displayText,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: const Color.fromARGB(255, 38, 13, 161),
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Widget _buildBudgetHistoryy(
      String label1, String separator, String? label2, String? profileImage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              child: Text(
                label1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              separator,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 25.0),
            Expanded(
              child: Row(
                children: [
                  if (profileImage != null && profileImage.isNotEmpty)
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(profileImage),
                        radius: 14.0,
                        backgroundColor: Colors.white,
                      ),
                    )
                  else
                    CircleAvatar(
                      radius: 14.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 50.0,
                        color: Colors.grey,
                      ),
                    ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      label2 ?? '',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  String getCountryFromBusinessHierarchy(
      List<Map<String, String>> businessHierarchy) {
    String country = '';
    for (var item in businessHierarchy) {
      if (item['level'] == 'Country') {
        country = item['level_nodes'] ?? ''; // Use level_nodes if it exists
        break;
      }
    }
    return country;
  }

  String getStateFromBusinessHierarchy(
      List<Map<String, String>> businessHierarchy) {
    String state = '';
    for (var item in businessHierarchy) {
      if (item['level'] == 'State') {
        state = item['level_nodes'] ?? ''; // Use level_nodes if it exists
        break;
      }
    }
    return state;
  }

  String getCityFromBusinessHierarchy(
      List<Map<String, String>> businessHierarchy) {
    String city = '';
    for (var item in businessHierarchy) {
      if (item['level'] == 'City') {
        city = item['level_nodes'] ?? ''; // Use level_nodes if it exists
        break;
      }
    }
    return city;
  }

  String getBrandFromProductHierarchy(
      List<Map<String, String>> productHierarchy) {
    String brand = '';
    for (var item in productHierarchy) {
      if (item['level'] == 'Brand') {
        brand = item['level_nodes'] ?? ''; // Use level_nodes if it exists
        break;
      }
    }
    return brand;
  }

// Method to get the product information from claimProductHierarchy
  String getProductFromProductHierarchy(
      List<Map<String, String>> productHierarchy) {
    String product = '';
    for (var item in productHierarchy) {
      if (item['level'] == 'Product') {
        product = item['level_nodes'] ?? ''; // Use level_nodes if it exists
        break;
      }
    }
    return product;
  }

// Method to get the edition information from claimProductHierarchy
  String getEditionFromProductHierarchy(
      List<Map<String, String>> productHierarchy) {
    String edition = '';
    for (var item in productHierarchy) {
      if (item['level'] == 'Edition') {
        edition = item['level_nodes'] ?? ''; // Use level_nodes if it exists
        break;
      }
    }
    return edition;
  }

  String getSkuFromProductHierarchy(
      List<Map<String, String>> productHierarchy) {
    String sku = '';
    for (var item in productHierarchy) {
      if (item['level'] == 'SKU') {
        sku = item['level_nodes'] ?? ''; // Use level_nodes if it exists
        break;
      }
    }
    return sku;
  }

// Method to get the store information from claimBusinessHierarchy
  String getStoreFromBusinessHierarchy(
      List<Map<String, String>> businessHierarchy) {
    String store = '';
    for (var item in businessHierarchy) {
      if (item['level'] == 'Store') {
        store = item['level_nodes'] ?? ''; // Use level_nodes if it exists
        break;
      }
    }
    return store;
  }

  Widget _buildBudgetHistory11(String label, String separator, String value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 40.0),
        Text(
          separator,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 25.0),
        Text(
          _formatDate(value), // Format the date here
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  String _formatDate(String dateTimeString) {
    try {
      DateTime dateTime = DateTime.parse(dateTimeString);
      return DateFormat('dd-MMMM-yyyy')
          .format(dateTime); // Format the date as '30-March-2024'
    } catch (e) {
      print('Error parsing date: $e');
      return dateTimeString; // Return original value if parsing fails
    }
  }

  PreferredSizeWidget _customAppBar() {
    return AppBar(
      backgroundColor: appTheme.redappbar,
      automaticallyImplyLeading: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset(
            ImageConstant.backarrow,
            width: 27.w,
            height: 18.h,
          ),
        ),
      ),
      title: Text(
        'View Details',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: appTheme.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 10.0, bottom: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.poppins().fontFamily,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildBudgetHistory(String label1, String separator, String label2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              child: Text(
                label1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              separator,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 25.0),
            Expanded(
              child: Text(
                label2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildBudgetHistory2(String label1, String separator, String label2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              child: Text(
                label1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              separator,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 25.0),
            Expanded(
              child: Text(
                label2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Color.fromARGB(255, 4, 157, 42),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildBudgetHistory1(String label1, String separator, String label2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              child: Text(
                label1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              separator,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 25.0),
            Expanded(
              child: Text(
                label2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Color.fromARGB(255, 58, 8, 238),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildDivider() {
    return Column(
      children: [
        SizedBox(height: 5),
        Divider(
          color: appTheme.gray500,
          thickness: 1.0,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
