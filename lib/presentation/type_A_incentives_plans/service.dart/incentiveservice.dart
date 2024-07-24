// class TypeAservices {
//   Future<ProgramDetails?> leaderBoard() async {
//     try {
//       var headers = {
//         'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
//         'X-API-KEY': 'grgbuzzz',
//         'Content-Type': 'application/x-www-form-urlencoded',
//         'Cookie':
//             '7a2e968c0b376de46a933ec04704fe5ff5f48d42=98l9ef8keip42cq94d6s9aegrjfbp1dh'
//       };

//       var body = {
//         'company_id': '80',
//         'program_id': '795',
//         'own_id': '61302',
//         'c_code': 'COMP000080'
//       };

//       var uri = Uri.parse(Url.leaderBoard);
//       print('Sending request to: $uri');
//       var response = await http.post(uri, headers: headers, body: body);

//       print('Response status code: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         var jsonData = json.decode(response.body);
//         var programResponse = ProgramResponse.fromJson(jsonData);

//         if (programResponse.programDetails.isNotEmpty) {
//           return programResponse.programDetails[0];
//         } else {
//           print('No program details found');
//           return null;
//         }
//       } else {
//         print('Request failed with status: ${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       print("Failed to fetch points: $e");
//       return null;
//     }
//   }
// }
