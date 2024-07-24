import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_28/model/buzz_28_model.dart';
import 'dart:convert';
import 'package:incentivesgit/presentation/buzz_screens/buzz_28/model/taggedusers_model.dart';

class Buzz28Service {
  final CacheService _cacheService = CacheService();

  Future<BudgetResponse?> balancepoints() async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/json',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=0n965gavf9kokd65a1v9inam9gf0ifo5'
    };
    var request = http.Request('POST', Uri.parse(Url.viewmybudget));
    request.body = json.encode({
      "access_controls": {
        "2": {
          "menu_id_pk": "2",
          "menu_name": "Budget Management",
          "menu_controller": "",
          "menu_function": "",
          "menu_parent_id": "2",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "2.00",
          "access_code": "AC0002"
        },
        "3": {
          "menu_id_pk": "3",
          "menu_name": "Engagement",
          "menu_controller": "",
          "menu_function": "",
          "menu_parent_id": "3",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "3.00",
          "access_code": "AC0001"
        },
        "4": {
          "menu_id_pk": "4",
          "menu_name": "Programs",
          "menu_controller": "",
          "menu_function": "",
          "menu_parent_id": "4",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "4.00",
          "access_code": "AC0003"
        },
        "5": {
          "menu_id_pk": "5",
          "menu_name": "Rewards",
          "menu_controller": "",
          "menu_function": "",
          "menu_parent_id": "5",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "5.00",
          "access_code": "AC0004"
        },
        "14": {
          "menu_id_pk": "14",
          "menu_name": "Buckets",
          "menu_controller": "budget",
          "menu_function": "index",
          "menu_parent_id": "2",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "2.02",
          "access_code": "AC0002"
        },
        "15": {
          "menu_id_pk": "15",
          "menu_name": "Buzzzes",
          "menu_controller": "behaviours",
          "menu_function": "index",
          "menu_parent_id": "3",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "3.01",
          "access_code": "AC0005"
        },
        "17": {
          "menu_id_pk": "17",
          "menu_name": "Certificates",
          "menu_controller": "certificates",
          "menu_function": "index",
          "menu_parent_id": "3",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "3.03",
          "access_code": "AC0016"
        },
        "19": {
          "menu_id_pk": "19",
          "menu_name": "Programs Configuration",
          "menu_controller": "programs",
          "menu_function": "index",
          "menu_parent_id": "4",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "4.01",
          "access_code": "AC0003"
        },
        "24": {
          "menu_id_pk": "24",
          "menu_name": "My Wallet",
          "menu_controller": "budget",
          "menu_function": "view_my_wallet",
          "menu_parent_id": "24",
          "access_control": "1",
          "type": "header_dropdown",
          "sequence": "2.00",
          "access_code": "AC0002"
        },
        "26": {
          "menu_id_pk": "26",
          "menu_name": "Rewards",
          "menu_controller": "redemption",
          "menu_function": "rewards",
          "menu_parent_id": "26",
          "access_control": "1",
          "type": "header",
          "sequence": "3.00",
          "access_code": "AC0004"
        },
        "27": {
          "menu_id_pk": "27",
          "menu_name": "My Budget",
          "menu_controller": "budget",
          "menu_function": "view_my_budget",
          "menu_parent_id": "27",
          "access_control": "1",
          "type": "header_dropdown",
          "sequence": "3.00",
          "access_code": "AC0002"
        },
        "28": {
          "menu_id_pk": "28",
          "menu_name": "Analytics Dashboard",
          "menu_controller": "campaign_reports",
          "menu_function": "redirect_eng_campaign",
          "menu_parent_id": "28",
          "access_control": "1",
          "type": "header_dropdown",
          "sequence": "8.00",
          "access_code": "AC0003"
        },
        "30": {
          "menu_id_pk": "30",
          "menu_name": "My Approvals",
          "menu_controller": "approvals",
          "menu_function": "index",
          "menu_parent_id": "30",
          "access_control": "1",
          "type": "header_dropdown",
          "sequence": "6.00",
          "access_code": "AC0017"
        },
        "38": {
          "menu_id_pk": "38",
          "menu_name": "My Programs",
          "menu_controller": "programs",
          "menu_function": "my_program_list",
          "menu_parent_id": "38",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "2.00",
          "access_code": "AC0003"
        },
        "39": {
          "menu_id_pk": "39",
          "menu_name": "All Programs",
          "menu_controller": "programs",
          "menu_function": "program_list",
          "menu_parent_id": "39",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "3.00",
          "access_code": "AC0003"
        },
        "40": {
          "menu_id_pk": "40",
          "menu_name": "Configuration",
          "menu_controller": "programs",
          "menu_function": "all_banners",
          "menu_parent_id": "40",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "4.00",
          "access_code": "AC0003"
        },
        "45": {
          "menu_id_pk": "45",
          "menu_name": "Buzzzes",
          "menu_controller": "engagements",
          "menu_function": "recognitionbuzz",
          "menu_parent_id": "45",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "1.00",
          "access_code": "AC0005"
        },
        "46": {
          "menu_id_pk": "46",
          "menu_name": "Birthdays",
          "menu_controller": "engagements",
          "menu_function": "birthdaybuzz",
          "menu_parent_id": "46",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "2.00",
          "access_code": "AC0006"
        },
        "47": {
          "menu_id_pk": "47",
          "menu_name": "Anniversaries",
          "menu_controller": "engagements",
          "menu_function": "anniversarybuzz",
          "menu_parent_id": "47",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "3.00",
          "access_code": "AC0007"
        },
        "48": {
          "menu_id_pk": "48",
          "menu_name": "News",
          "menu_controller": "engagements",
          "menu_function": "newsbuzz",
          "menu_parent_id": "48",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "4.00",
          "access_code": "AC0008"
        },
        "49": {
          "menu_id_pk": "49",
          "menu_name": "Gallery",
          "menu_controller": "gallery",
          "menu_function": "index",
          "menu_parent_id": "49",
          "access_control": "1",
          "type": "engagement_module",
          "sequence": "5.00",
          "access_code": "AC0009"
        },
        "51": {
          "menu_id_pk": "51",
          "menu_name": "Knowledge Center",
          "menu_controller": "engagements",
          "menu_function": "knowledgecenterbuzz",
          "menu_parent_id": "51",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "7.00",
          "access_code": "AC0011"
        },
        "54": {
          "menu_id_pk": "54",
          "menu_name": "Certificates",
          "menu_controller": "engagements",
          "menu_function": "certificates",
          "menu_parent_id": "54",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "10.00",
          "access_code": "AC0016"
        },
        "64": {
          "menu_id_pk": "64",
          "menu_name": "Programs",
          "menu_controller": "programs",
          "menu_function": "main",
          "menu_parent_id": "64",
          "access_control": "1",
          "type": "header",
          "sequence": "2.00",
          "access_code": "AC0003"
        },
        "66": {
          "menu_id_pk": "66",
          "menu_name": "Visibility Setting",
          "menu_controller": "dashboard_setting",
          "menu_function": "dashboard_visibilty",
          "menu_parent_id": "65",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "7.01",
          "access_code": "AC0001"
        },
        "67": {
          "menu_id_pk": "67",
          "menu_name": "User Assignment",
          "menu_controller": "dashboard_setting",
          "menu_function": "dashboard_user_assign",
          "menu_parent_id": "65",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "7.02",
          "access_code": "AC0001"
        },
        "69": {
          "menu_id_pk": "69",
          "menu_name": "Engagement Dashboard",
          "menu_controller": "reports",
          "menu_function": "index",
          "menu_parent_id": "120",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "1.00",
          "access_code": "AC0001"
        },
        "70": {
          "menu_id_pk": "70",
          "menu_name": "Campaign Dashboard",
          "menu_controller": "campaign_reports",
          "menu_function": "index",
          "menu_parent_id": "120",
          "access_control": "1",
          "D  type": "campaign_explore_sidebar",
          "sequence": "1.00",
          "access_code": "AC0003"
        },
        "72": {
          "menu_id_pk": "72",
          "menu_name": "My Supercheques",
          "menu_controller": "",
          "menu_function": "",
          "menu_parent_id": "72",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "10.00",
          "access_code": "AC0018"
        },
        "73": {
          "menu_id_pk": "73",
          "menu_name": "Supercheques Config",
          "menu_controller": "supercheque",
          "menu_function": "config",
          "menu_parent_id": "72",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "9.01",
          "access_code": "AC0018"
        },
        "76": {
          "menu_id_pk": "76",
          "menu_name": "Sponsors",
          "menu_controller": "budget",
          "menu_function": "sponsor_list",
          "menu_parent_id": "2",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "2.01",
          "access_code": "AC0002"
        },
        "78": {
          "menu_id_pk": "78",
          "menu_name": "Pan Profiles",
          "menu_controller": "pan_card_profiles",
          "menu_function": "index",
          "menu_parent_id": "13",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "12.02",
          "access_code": "AC0004"
        },
        "79": {
          "menu_id_pk": "79",
          "menu_name": "Bank Ac Profiles",
          "menu_controller": "bank_account_profiles",
          "menu_function": "index",
          "menu_parent_id": "13",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "12.03",
          "access_code": "AC0004"
        },
        "83": {
          "menu_id_pk": "83",
          "menu_name": "Tds Management",
          "menu_controller": "tds_management",
          "menu_function": "index",
          "menu_parent_id": "5",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "5.03",
          "access_code": "AC0004"
        },
        "84": {
          "menu_id_pk": "84",
          "menu_name": "Hub",
          "menu_controller": "",
          "menu_function": "",
          "menu_parent_id": "84",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "11.00",
          "access_code": "AC0020"
        },
        "85": {
          "menu_id_pk": "85",
          "menu_name": "Hub Settings",
          "menu_controller": "hub_settings",
          "menu_function": "index",
          "menu_parent_id": "84",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "10.01",
          "access_code": "AC0020"
        },
        "86": {
          "menu_id_pk": "86",
          "menu_name": "Hub",
          "menu_controller": "hub",
          "menu_function": "index",
          "menu_parent_id": "86",
          "access_control": "1",
          "type": "header",
          "sequence": "4.00",
          "access_code": "AC0020"
        },
        "92": {
          "menu_id_pk": "92",
          "menu_name": "Forced Redemption",
          "menu_controller": "force_redemption",
          "menu_function": "index",
          "menu_parent_id": "5",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "5.04",
          "access_code": "AC0004"
        },
        "93": {
          "menu_id_pk": "93",
          "menu_name": "Reportee Addition/Removal Criteria",
          "menu_controller": "rules",
          "menu_function": "index",
          "menu_parent_id": "13",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "12.08",
          "access_code": "AC0022"
        },
        "94": {
          "menu_id_pk": "94",
          "menu_name": "My Reportees",
          "menu_controller": "reportee",
          "menu_function": "index",
          "menu_parent_id": "94",
          "access_control": "1",
          "type": "header_dropdown",
          "sequence": "4.00",
          "access_code": "AC0022"
        },
        "104": {
          "menu_id_pk": "104",
          "menu_name": "Quizzes",
          "menu_controller": "quiz",
          "menu_function": "index",
          "menu_parent_id": "104",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "12.00",
          "access_code": "AC0023"
        },
        "105": {
          "menu_id_pk": "105",
          "menu_name": "Dashboard",
          "menu_controller": "programs",
          "menu_function": "main",
          "menu_parent_id": "105",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "1.00",
          "access_code": "AC0003"
        },
        "113": {
          "menu_id_pk": "113",
          "menu_name": "Approvals",
          "menu_controller": " ",
          "menu_function": " ",
          "menu_parent_id": "113",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "3.00",
          "access_code": "AC0017"
        },
        "115": {
          "menu_id_pk": "115",
          "menu_name": "Reportee Requests",
          "menu_controller": "",
          "menu_function": "",
          "menu_parent_id": "115",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "5.00",
          "access_code": "AC0022"
        },
        "120": {
          "menu_id_pk": "120",
          "menu_name": "Analytics Dashboard",
          "menu_controller": "",
          "menu_function": "",
          "menu_parent_id": "120",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "6.00",
          "access_code": "AC0003"
        },
        "125": {
          "menu_id_pk": "125",
          "menu_name": "Gallery",
          "menu_controller": "engagements",
          "menu_function": "gallerybuzzz",
          "menu_parent_id": "125",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "12.00",
          "access_code": "AC0009"
        },
        "127": {
          "menu_id_pk": "127",
          "menu_name": "Data Sources",
          "menu_controller": "data_template",
          "menu_function": "index",
          "menu_parent_id": "127",
          "access_control": "1",
          "type": "header",
          "sequence": "4.00",
          "access_code": "AC0024"
        },
        "128": {
          "menu_id_pk": "128",
          "menu_name": "VPA Ac Profiles",
          "menu_controller": "vpa_profiles",
          "menu_function": "index",
          "menu_parent_id": "13",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "12.06",
          "access_code": "AC0004"
        },
        "131": {
          "menu_id_pk": "131",
          "menu_name": "Orders Management",
          "menu_controller": "",
          "menu_function": "",
          "menu_parent_id": "131",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "5.00",
          "access_code": "AC0004"
        },
        "132": {
          "menu_id_pk": "132",
          "menu_name": "Order Cancellations",
          "menu_controller": "orders_management",
          "menu_function": "Index",
          "menu_parent_id": "131",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "5.01",
          "access_code": "AC0004"
        },
        "133": {
          "menu_id_pk": "133",
          "menu_name": "Quizzes",
          "menu_controller": "",
          "menu_function": "",
          "menu_parent_id": "133",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "13.00",
          "access_code": "AC0023"
        },
        "136": {
          "menu_id_pk": "136",
          "menu_name": "Custom Dashboard",
          "menu_controller": "reports",
          "menu_function": "show_custom_dashboard",
          "menu_parent_id": "120",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "1.00",
          "access_code": "AC0003"
        },
        "137": {
          "menu_id_pk": "137",
          "menu_name": "Tier Management",
          "menu_controller": "",
          "menu_function": "",
          "menu_parent_id": "137",
          "access_control": "1",
          "type": "campaign_explore_sidebar",
          "sequence": "14.00",
          "access_code": "AC0025"
        }
      },
      "activities": {
        "A0005": [
          {
            "activity_code": "A0005",
            "name": "Award Points",
            "controller": "budget",
            "functions": "awardpoints,view_my_budget"
          }
        ],
        "A0006": [
          {
            "activity_code": "A0006",
            "name": "Access to wallet",
            "controller": "budget",
            "functions": "view_my_wallet"
          }
        ],
        "A0011": [
          {
            "activity_code": "A0011",
            "name": "View Edit my profile and change password",
            "controller": "home",
            "functions": "view"
          }
        ],
        "A0013": [
          {
            "activity_code": "A0013",
            "name": "Create Delete Buzzz",
            "controller": "post",
            "functions": "delete_post_by_author,submit_post"
          }
        ],
        "A0015": [
          {
            "activity_code": "A0015",
            "name": "Create edit and Delete news",
            "controller": "news",
            "functions": "index,load_add_view,edit_news,news_delete"
          }
        ],
        "A0016": [
          {
            "activity_code": "A0016",
            "name": "View Rewards",
            "controller": "redemption",
            "functions": "rewards,productDetails"
          },
          {
            "activity_code": "A0016",
            "name": "View Rewards",
            "controller": "redemption",
            "functions": "rewards"
          },
          {
            "activity_code": "A0016",
            "name": "View Rewards",
            "controller": "redemption",
            "functions": "rewards"
          }
        ],
        "A0017": [
          {
            "activity_code": "A0017",
            "name": "View My Orders",
            "controller": "redemption",
            "functions": "orderHistory"
          }
        ],
        "A0019": [
          {
            "activity_code": "A0019",
            "name": "Add Edit Photo and Video Gallery",
            "controller": "gallery",
            "functions": "load_add_view,edit_gallery"
          }
        ],
        "A0020": [
          {
            "activity_code": "A0020",
            "name": "Create edit and Delete Article in Knowledge Center",
            "controller": "knowledgecenter",
            "functions": "index,load_add_view,edit_article,article_delete"
          }
        ],
        "A0026": [
          {
            "activity_code": "A0026",
            "name": "Theme",
            "controller": "theme",
            "functions": "index"
          }
        ],
        "A0034": [
          {
            "activity_code": "A0034",
            "name": "View Programs Section in the product",
            "controller": "programs",
            "functions": "index,add_program_point,main,my_program_list"
          }
        ],
        "A0041": [
          {
            "activity_code": "A0041",
            "name": "Configure Certificates",
            "controller": "certificates",
            "functions": "index"
          }
        ],
        "A0042": [
          {
            "activity_code": "A0042",
            "name": "View my approvals",
            "controller": "approvals",
            "functions": "index"
          },
          {
            "activity_code": "A0042",
            "name": "View my approvals",
            "controller": "reportee",
            "functions": "index"
          }
        ],
        "A0050": [
          {
            "activity_code": "A0050",
            "name": "Access to Buzzz Help",
            "controller": "help",
            "functions": "index"
          }
        ],
        "A0064": [
          {
            "activity_code": "A0064",
            "name": "Linkedin - Share on personal wall",
            "controller": "Home",
            "functions": "ganerateimgaes"
          }
        ],
        "A0070": [
          {
            "activity_code": "A0070",
            "name": "View Buzzz Home Page",
            "controller": "home",
            "functions": "index"
          }
        ],
        "A0084": [
          {
            "activity_code": "A0084",
            "name": "View Hub section",
            "controller": "hub",
            "functions": "index"
          }
        ],
        "A0088": [
          {
            "activity_code": "A0088",
            "name": "Edit email ID in any user profile",
            "controller": "user",
            "functions": "submit"
          }
        ],
        "A0092": [
          {
            "activity_code": "A0092",
            "name":
                "Allow Reporting Manager to View and Edit Bank and Pan  profiles of the Reportees",
            "controller": "rules",
            "functions": "index"
          }
        ],
        "M0094": [
          {
            "activity_code": "M0094",
            "name": "Redeem Rewards",
            "controller": "redemption",
            "functions": "productDetails"
          }
        ],
        "M0095": [
          {
            "activity_code": "M0095",
            "name": "Global post",
            "controller": "",
            "functions": ""
          }
        ],
        "M0096": [
          {
            "activity_code": "M0096",
            "name": "scope self email subscribe",
            "controller": "",
            "functions": ""
          }
        ],
        "M0099": [
          {
            "activity_code": "M0099",
            "name":
                "Active user directly becomes a participant in Type F campaign",
            "controller": ""
          }
        ],
        "M0098": [
          {
            "activity_code": "M0098",
            "name":
                "View all referrals according to hierarchy in type F campaign",
            "controller": ""
          }
        ]
      },
      "company_id": companyId,
      "user_id": userId,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var jsonMap = json.decode(responseData);
      return BudgetResponse.fromJson(jsonMap);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<TaggedUsersResponse?> taggedUsers(String postId) async {
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=eqphmlurdqq1q4lck3h635pi6h8ttm3u'
    };
    var request = http.Request('POST', Uri.parse(Url.gettaggedusers));
    request.bodyFields = {
      'postid': postId,
      'post_type': 'Recognition',
      'own_id': userId!
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseData = await response.stream.bytesToString();
      final jsonMap = json.decode(responseData);
      if (jsonMap['status'] == true && jsonMap['usersawards'] != null) {
        return TaggedUsersResponse.fromJson(jsonMap);
      } else {
        print('Status is false or users awards is null');
        return null;
      }
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<Map<String, dynamic>> awardpoints(mapString) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/json',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=gu6almohdbn6d7sp2s4d7jpbfiu8fn65'
    };

    var request = http.Request('POST', Uri.parse(Url.awardPoints));
    request.body = json.encode(mapString);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseBody);
      return jsonResponse;
    } else {
      return {
        'status': false,
        'msg': response.reasonPhrase,
        'error': 'Request failed with status: ${response.statusCode}'
      };
    }
  }
}
