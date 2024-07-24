import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Anniversaries/Anniversaries_Tabbar/Anniversaries_tabbar_screen.dart';
import 'package:incentivesgit/presentation/Anniversaries/Anniversaries_Tabbar/binding/Anniversaries_TabbarBinding.dart';
import 'package:incentivesgit/presentation/Approvals/Program%20Approval/ProgramApprovalScreen.dart';
import 'package:incentivesgit/presentation/Approvals/Program%20Approval/binding/programApproval_binding.dart';
import 'package:incentivesgit/presentation/Approvals/Reportee%20addition%20Approval/binding/reporteebinding.dart';
import 'package:incentivesgit/presentation/Approvals/Reportee%20addition%20Approval/reporteeAdditionApproval_screen.dart';
import 'package:incentivesgit/presentation/Approvals/approvalTabBar/approvalTabBar_screen.dart';
import 'package:incentivesgit/presentation/Approvals/approvalTabBar/binding/approvalTabBarBinding.dart';
import 'package:incentivesgit/presentation/Approvals/approved_details/ApprovalDetails_screen.dart';
import 'package:incentivesgit/presentation/Approvals/campaign%20approval_1/binding/campaignapprovalbinding.dart';
import 'package:incentivesgit/presentation/Approvals/campaign%20approval_1/campaignapprovalscreen.dart';
import 'package:incentivesgit/presentation/Approvals/claim_approval_1/binding/claimapproval1binding.dart';
import 'package:incentivesgit/presentation/Approvals/claim_approval_1/claimapproval_1_screen.dart';
import 'package:incentivesgit/presentation/Approvals/claimapproval_viewdetails/bidning/claimapproval_viewdetails_binding.dart';
import 'package:incentivesgit/presentation/Approvals/claimapproval_viewdetails/viewDetails_screen.dart';
import 'package:incentivesgit/presentation/Approvals/incenitves%20approval/binding/incentivebinding.dart';
import 'package:incentivesgit/presentation/Approvals/incenitves%20approval/incentiveapproval_screen.dart';
import 'package:incentivesgit/presentation/Approvals/request_pending_viewdetails/binding/request_pendingBinding.dart';
import 'package:incentivesgit/presentation/Approvals/request_pending_viewdetails/requestpending_Screen.dart';
import 'package:incentivesgit/presentation/Approvals/user_approvals/binding/userapproval_binding.dart';
import 'package:incentivesgit/presentation/Approvals/user_approvals/userapproval_screen.dart';
import 'package:incentivesgit/presentation/Birthdays/birthday_Tabbar/binding/birthday_TabbarBinding.dart';
import 'package:incentivesgit/presentation/Birthdays/birthday_Tabbar/birthday_tabbar_screen.dart';
import 'package:incentivesgit/presentation/News/create_news/binding/createNews_binding.dart';
import 'package:incentivesgit/presentation/News/create_news/createnews_screen.dart';
import 'package:incentivesgit/presentation/News/news_Tabbar/binding/News_TabbarBinding.dart';
import 'package:incentivesgit/presentation/News/news_Tabbar/news_tabbar_screen.dart';
import 'package:incentivesgit/presentation/bottonnavivationBar/binding/bottomnavigationbarbinding.dart';
import 'package:incentivesgit/presentation/bottonnavivationBar/bottomnavigationbar.dart';
import 'package:incentivesgit/presentation/buzz_screens/Buzz_summary/binding/buzzSummary_binding.dart';
import 'package:incentivesgit/presentation/buzz_screens/Buzz_summary/buzzSummary_Screen.dart';
import 'package:incentivesgit/presentation/buzz_screens/Buzze_tabbar/BuzzesTabBar_Screen.dart';
import 'package:incentivesgit/presentation/buzz_screens/Buzze_tabbar/binding/buzzTabBar_Binding.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_28/binding/buzz_28_binding.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_28/buzz_28_screen.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_32/binding/buzz_32_binding.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_32/buzz_32_screen.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_33/binding/buzz_33_binding.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_33/buzz_33_screen.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_9/binding/buzz_9_binding.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_9/buzz_9_screen.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_leaderboard/binding/leaderboard_binding.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_leaderboard/leaderboard_screen.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_post/binding/buzzes_tabbar_binding.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_post/buzzes_tabbar_post.dart';
import 'package:incentivesgit/presentation/buzz_screens/commentsdata/binding/commentsdatabinding.dart';
import 'package:incentivesgit/presentation/buzz_screens/commentsdata/commentsscreen.dart';
import 'package:incentivesgit/presentation/buzz_screens/likesdata/binding/likedatabinding.dart';
import 'package:incentivesgit/presentation/buzz_screens/likesdata/likedatascreen.dart';
import 'package:incentivesgit/presentation/campaign_balance_point/binding/campaign_balance_point_binding.dart';
import 'package:incentivesgit/presentation/campaign_balance_point/campaign_balance_point_screen.dart';
import 'package:incentivesgit/presentation/campaign_balancepoints_programId/balancepoints.dart';
import 'package:incentivesgit/presentation/campaign_balancepoints_programId/binding/balanepointsbinding.dart';
import 'package:incentivesgit/presentation/campaign_calculatedpoints_programId/binding/earnedpointsbinding.dart';
import 'package:incentivesgit/presentation/campaign_calculatedpoints_programId/earnedpoints.dart';
import 'package:incentivesgit/presentation/campaign_earned_point_viewdetails_screen/binding/campaign_earned_point_viewdetails_binding.dart';
import 'package:incentivesgit/presentation/campaign_earned_point_viewdetails_screen/campaign_earned_point_viewdetails_screen.dart';
import 'package:incentivesgit/presentation/campaign_earned_points/binding/earnedpointsbinding.dart';
import 'package:incentivesgit/presentation/campaign_earned_points/earnedpoints.dart';
import 'package:incentivesgit/presentation/campaign_earnedpoints_programId/binding/earnedpointsbinding.dart';
import 'package:incentivesgit/presentation/campaign_earnedpoints_programId/earnedpoints.dart';
import 'package:incentivesgit/presentation/campaign_expired_point/binding/campaign_expired_point_binding.dart';
import 'package:incentivesgit/presentation/campaign_expired_point/campaign_expired_point_screen.dart';
import 'package:incentivesgit/presentation/campaign_expiredpoints_programId/binding/expiredpointsbinding.dart';
import 'package:incentivesgit/presentation/campaign_expiredpoints_programId/expiredpoints.dart';
import 'package:incentivesgit/presentation/campaign_redeemed_point/binding/campaign_redeemed-point_binding.dart';
import 'package:incentivesgit/presentation/campaign_redeemed_point/campaign_redeemed_point_screen.dart';
import 'package:incentivesgit/presentation/campaign_redeemedpoints_programId/binding/earnedpointsbinding.dart';
import 'package:incentivesgit/presentation/campaign_redeemedpoints_programId/redeemedpoints.dart';
import 'package:incentivesgit/presentation/certificate_screens/Award%20Certificate/awardCertificate_Screen.dart';
import 'package:incentivesgit/presentation/certificate_screens/Award%20Certificate/binding/awardCertificate_binding.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_10/binding/certificate_10_binding.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_10/certificate_10_screen.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_7/binding/certificate_7_binding.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_7/certificate_7_screen.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_8/binding/certificate_8_binding.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_8/certificate_8_screen.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_Tabbar/CertificateTabBar_Screen.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_Tabbar/binding/buzzTabBar_Binding.dart';
import 'package:incentivesgit/presentation/certificate_screens/get_all_certificate_screen/viewotherprofile.dart';
import 'package:incentivesgit/presentation/forgetPassword/Binding/forget_binding.dart';
import 'package:incentivesgit/presentation/forgetPassword/forgetScreen.dart';
import 'package:incentivesgit/presentation/help&support/aboutmyincentives/aboutmyincentives_screen.dart';
import 'package:incentivesgit/presentation/help&support/aboutmyincentives/binding/aboutmyincentives_binding.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_2/binding/customer_support_2_binding.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_2/customer_support_2_screen.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_4/binding/customer_support_4_binding.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_4/customer_support_4_screen.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_5/binding/customer_support_5_binding.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_5/customer_support_5_screen.dart';
import 'package:incentivesgit/presentation/help&support/customersupport_1/binding/customersupport_1_binding.dart';
import 'package:incentivesgit/presentation/help&support/customersupport_1/customersupport_1_screen.dart';
import 'package:incentivesgit/presentation/help&support/edit_ticket/binding/edit_ticket_binding.dart';
import 'package:incentivesgit/presentation/help&support/edit_ticket/edit_ticket_screen.dart';
import 'package:incentivesgit/presentation/help&support/helpmanual_1/binding/helpmanual_1_binding.dart';
import 'package:incentivesgit/presentation/help&support/helpmanual_1/helpmanual_1_screen.dart';
import 'package:incentivesgit/presentation/help&support/helpmanual_3/binding/helpmanual_3_binding.dart';
import 'package:incentivesgit/presentation/help&support/helpmanual_3/helpmanual_3_screen.dart';
import 'package:incentivesgit/presentation/help&support/helpmanual_4/binding/helpmanual_4_binding.dart';
import 'package:incentivesgit/presentation/help&support/helpmanual_4/helpmanual_4_screen.dart';
import 'package:incentivesgit/presentation/help&support/landingPage/binding/landingPage_binding.dart';
import 'package:incentivesgit/presentation/help&support/landingPage/landingPage_screen.dart';
import 'package:incentivesgit/presentation/help&support/scheduledupgrade/binding/scheduledupgrade_binding.dart';
import 'package:incentivesgit/presentation/help&support/scheduledupgrade/scheduledupgrade_screen.dart';
import 'package:incentivesgit/presentation/homebottombar/account/accountscreen.dart';
import 'package:incentivesgit/presentation/homebottombar/account/binding/accountbinding.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/binding/campaignbinding.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/campaignscreen.dart';
import 'package:incentivesgit/presentation/homebottombar/engagement/binding/engagementbinding.dart';
import 'package:incentivesgit/presentation/homebottombar/engagement/engagementscreen.dart';
import 'package:incentivesgit/presentation/homebottombar/my_campainns/binding/my_campains_binding.dart';
import 'package:incentivesgit/presentation/homebottombar/my_campainns/my_campains_screen.dart';
import 'package:incentivesgit/presentation/hub%20-%201/binding/hub1_binding.dart';
import 'package:incentivesgit/presentation/hub%20-%201/hub1_screen.dart';
import 'package:incentivesgit/presentation/hub%20-%202/binding/hub2_binding.dart';
import 'package:incentivesgit/presentation/hub%20-%202/hub2_screen.dart';
import 'package:incentivesgit/presentation/hub%20-%203/binding/hub3_binding.dart';
import 'package:incentivesgit/presentation/hub%20-%203/hub3_screen.dart';
import 'package:incentivesgit/presentation/hub%20-%204/binding/hub4_binding.dart';
import 'package:incentivesgit/presentation/hub%20-%204/hub4_screen.dart';
import 'package:incentivesgit/presentation/hub_screens/binding/hub_binding.dart';
import 'package:incentivesgit/presentation/hub_screens/hub_screen.dart';
import 'package:incentivesgit/presentation/myBudget/auditdetails/auditdetails_screen.dart';
import 'package:incentivesgit/presentation/myBudget/auditdetails/binding/auditdetails_binding.dart';
import 'package:incentivesgit/presentation/myBudget/mybudget_balance/binding/mybudget_balance_binding.dart';
import 'package:incentivesgit/presentation/myBudget/mybudget_balance/mybudget_balance.dart';
import 'package:incentivesgit/presentation/myBudget/mybudget_viewdetails/binding/mybudget_viewdetails_binding.dart';
import 'package:incentivesgit/presentation/myBudget/mybudget_viewdetails/mybudget_viewdetails_screen.dart';
import 'package:incentivesgit/presentation/myOrders/myorder/binding/myorderbinding.dart';
import 'package:incentivesgit/presentation/myOrders/myorder/myOrder_Screen.dart';
import 'package:incentivesgit/presentation/myOrders/myorders_voucher_type%203/binding/myorders_voucher_type%203_binding.dart';
import 'package:incentivesgit/presentation/myOrders/myorders_voucher_type%203/myorders_voucher_type%203_screen.dart';
import 'package:incentivesgit/presentation/myOrders/otp_screen/binding/otp_binding.dart';
import 'package:incentivesgit/presentation/myOrders/otp_screen/otp_screen.dart';
import 'package:incentivesgit/presentation/myOrders/viewDetails/binding/viewdetails_binding.dart';
import 'package:incentivesgit/presentation/myOrders/viewDetails/viewDetails_screen.dart';
import 'package:incentivesgit/presentation/myOrders/viewdetails_vouchertype/binding/vouchertype_binding.dart';
import 'package:incentivesgit/presentation/myOrders/viewdetails_vouchertype/vouchertype_screen.dart';
import 'package:incentivesgit/presentation/myOrders/voucher_view/binding/vouchar_binding.dart';
import 'package:incentivesgit/presentation/myProfile/business_hierarchy/binding/business_hierarchy_binding.dart';
import 'package:incentivesgit/presentation/myProfile/business_hierarchy/business_hierarchy_screen.dart';
import 'package:incentivesgit/presentation/myProfile/email_preference/binding/email_preference_binding.dart';
import 'package:incentivesgit/presentation/myProfile/email_preference/email_preference.dart';
import 'package:incentivesgit/presentation/myProfile/emailpreferences_unsubscribe/binding/emailpreferences_unsubscribe_binding.dart';
import 'package:incentivesgit/presentation/myProfile/emailpreferences_unsubscribe/emailpreferences_unsubscribe_screen.dart';
import 'package:incentivesgit/presentation/myProfile/my_tds_certificate/binding/my_tds_certificate_binding.dart';
import 'package:incentivesgit/presentation/myProfile/my_tds_certificate/my_tds_certificate.dart';
import 'package:incentivesgit/presentation/myProfile/myprofile/binding/myprofilebinding.dart';
import 'package:incentivesgit/presentation/myProfile/myprofile/myprofile_screen.dart';
import 'package:incentivesgit/presentation/myProfile/pan_profile/binding/pan_profile_binding.dart';
import 'package:incentivesgit/presentation/myProfile/pan_profile/pan_profile.dart';
import 'package:incentivesgit/presentation/myProfile/password_reset/binding/password_reset_binding.dart';
import 'package:incentivesgit/presentation/myProfile/password_reset/password_reset_screen.dart';
import 'package:incentivesgit/presentation/myProfile/paytm_profile/binding/paytm_binding.dart';
import 'package:incentivesgit/presentation/myProfile/paytm_profile/paytm_profile.dart';
import 'package:incentivesgit/presentation/myProfile/upi_profile/binding/upi_profile_binding.dart';
import 'package:incentivesgit/presentation/myProfile/upi_profile/upi_profile.dart';
import 'package:incentivesgit/presentation/myProfile/verificationcode/binding/verificationcode_binding.dart';
import 'package:incentivesgit/presentation/myProfile/verificationcode/verificationcode.dart';
import 'package:incentivesgit/presentation/myWallet/myWallet_landing/binding/myWallet_landing_binding.dart';
import 'package:incentivesgit/presentation/myWallet/myWallet_landing/myWallet_Screen.dart';
import 'package:incentivesgit/presentation/myWallet/pointsreceivedorder_viewdetails/binding/pointsreceivedorder_viewdetails_binding.dart';
import 'package:incentivesgit/presentation/myWallet/pointsreceivedorder_viewdetails/pointsreceivedorder_viewdetails_screen.dart';
import 'package:incentivesgit/presentation/myWallet/selectwallet_viewdetails/binding/selectwallet_viewdetails_binding.dart';
import 'package:incentivesgit/presentation/myWallet/selectwallet_viewdetails/selectwallet_viewdetails_screen.dart';
import 'package:incentivesgit/presentation/onBoarding/login_screen/binding/login_binding.dart';
import 'package:incentivesgit/presentation/onBoarding/login_screen/login_screen.dart';
import 'package:incentivesgit/presentation/onBoarding/new_user_screen/binding/new_user_binding.dart';
import 'package:incentivesgit/presentation/onBoarding/new_user_screen/new_user_screen.dart';
import 'package:incentivesgit/presentation/onBoarding/notification_screen/binding/notification_binding.dart';
import 'package:incentivesgit/presentation/onBoarding/notification_screen/notification_screen.dart';
import 'package:incentivesgit/presentation/onBoarding/resendotpscreen/binding/resendotpbinding.dart';
import 'package:incentivesgit/presentation/onBoarding/resendotpscreen/resendotpscreen.dart';
import 'package:incentivesgit/presentation/onBoarding/underMaintenace/binding/under_maintenence_binding.dart';
import 'package:incentivesgit/presentation/onBoarding/underMaintenace/under_maintance_screen.dart';
import 'package:incentivesgit/presentation/onBoarding/userVerification/binding/userVerification_binding.dart';
import 'package:incentivesgit/presentation/product_referrel/product_referrel_tabbar/binding/product_referrel_tabbar_binding.dart';
import 'package:incentivesgit/presentation/product_referrel/product_referrel_tabbar/product_referrel_tabbar.dart';
import 'package:incentivesgit/presentation/product_referrel/redeemcode1/binding/redeemcode1_binding.dart';
import 'package:incentivesgit/presentation/product_referrel/redeemcode1/redeemcode1.dart';
import 'package:incentivesgit/presentation/product_referrel/refer_a_friend/binding/refer_a_friend_binding.dart';
import 'package:incentivesgit/presentation/product_referrel/refer_a_friend/refer_a_friend.dart';
import 'package:incentivesgit/presentation/product_referrel/succesful_referrels/binding/sucessful_referrel_binding.dart';
import 'package:incentivesgit/presentation/product_referrel/succesful_referrels/succesfull_referrel.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_10/binding/quizzes_10_binding.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_10/quizzes_10_screen.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_11/binding/general_knowledge_binding.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_11/general_knowledge.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_16/binding/quizzes_16_binding.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_16/quizzes_16_screen.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_details/binding/quizzes_details_binding.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_details/quizzes_details.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/binding/quizzes_tabbar_binding.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/live_quiz/bindings/live_quiz_bindings.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/live_quiz/live_quiz.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/posts/binding/post_binding.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/posts/quizzes_post_screen.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/quizzes/binding/quizzes_binding.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/quizzes/quizzes_screen.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/quizzes_tabbar_screen.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/upcoming_quiz/binding/upcoming_quiz_binding.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/upcoming_quiz/upcoming_quiz_screen.dart';
import 'package:incentivesgit/presentation/resetPassword/binding/resetpassword_binding.dart';
import 'package:incentivesgit/presentation/resetPassword/resetpasswordscreen.dart';
import 'package:incentivesgit/presentation/rewards/Scan_qrcode/Binding/scan_qrcode_binding.dart';
import 'package:incentivesgit/presentation/rewards/Scan_qrcode/scan_qrcode.dart';
import 'package:incentivesgit/presentation/rewards/bank_transfer_flexi2/bank_transfer_flexi2.dart';
import 'package:incentivesgit/presentation/rewards/bank_transfer_flexi2/binding/bank_transfer_flexi2_binding.dart';
import 'package:incentivesgit/presentation/rewards/bank_transfer_flexible/banktransferflexible.dart';
import 'package:incentivesgit/presentation/rewards/bank_transfer_flexible/binding/bank_transfer_flexible_binding.dart';
import 'package:incentivesgit/presentation/rewards/banktransfer/bank_transfer.dart';
import 'package:incentivesgit/presentation/rewards/banktransfer/binding/bank_transfer_binding.dart';
import 'package:incentivesgit/presentation/rewards/cash_payout/binding/cash_payout_binding.dart';
import 'package:incentivesgit/presentation/rewards/cash_payout/cash_payout.dart';
import 'package:incentivesgit/presentation/rewards/giftcard_viewdetails/binding/view_details_binding.dart';
import 'package:incentivesgit/presentation/rewards/giftcard_viewdetails/view_details.dart';
import 'package:incentivesgit/presentation/rewards/product/binding/product_binding.dart';
import 'package:incentivesgit/presentation/rewards/product/product.dart';
import 'package:incentivesgit/presentation/rewards/qrcodedata/binding/qrcode_data_binding.dart';
import 'package:incentivesgit/presentation/rewards/qrcodedata/qrcodedata.dart';
import 'package:incentivesgit/presentation/rewards/rewards-landing/binding/reward-landing_binding.dart';
import 'package:incentivesgit/presentation/rewards/rewards-landing/reward-landing_screen.dart';
import 'package:incentivesgit/presentation/rewards/rewards_superchequescredit/binding/rewards_superchequescredit_binding.dart';
import 'package:incentivesgit/presentation/rewards/rewards_superchequescredit/rewards_superchequescredit_screen.dart';
import 'package:incentivesgit/presentation/rewards/supercheque/binding/supercheque_binding.dart';
import 'package:incentivesgit/presentation/rewards/supercheque/supercheque.dart';
import 'package:incentivesgit/presentation/typeC_screens/TypeC_KpiSku_Regression_awardingpoints_claim_management/TypeC_KpiSku_Regression_awardingpoints_claim_management_screen.dart';
import 'package:incentivesgit/presentation/typeC_screens/TypeC_KpiSku_Regression_awardingpoints_claim_management/binding/TypeC_KpiSku_Regression_awardingpoints_claim_management_binding.dart';
import 'package:incentivesgit/presentation/typeC_screens/Type_c_totalinvoiceregression2/binding/type_C_totalinvoiceBinding.dart';
import 'package:incentivesgit/presentation/typeC_screens/Type_c_totalinvoiceregression2/type_C_totalinvoiceregressionScreen.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management_flexi_form/binding/claim_approval_based_awarding_of_points_claim_management_flexi_form_binding.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management_flexi_form/claim_approval_based_awarding_of_points_claim_management_flexi_form_screen.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_KpiSku_createclaim_management/binding/typeC_KpiSku_createclaim_management_binding.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_KpiSku_createclaim_management/typeC_KpiSku_createclaim_management_screenl.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_KpiSku_regression/binding/typeC_KpiSku_regression_binding.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_KpiSku_regression/typeC_KpiSku_regression_screen.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_claim_approval_history/binding/typeC_claimapproval_history_binding.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_claim_approval_history/typeC_claimapproval_history_screen.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_create_claim_screen/binding/create_claim_binding.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_create_claim_screen/typec_create_claim_screen.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_createclaim_management/binding/typeC_createclaim_management_binding.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_createclaim_management/typeC_createclaim_management_screen.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_flexiform_approval_history/binding/typeC_flexiform_approval_history_binding.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_flexiform_approval_history/typeC_flexiform_approval_history_screen.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_flexiform_campaign_details/binding/typeC_flexiform_campaign_details_binding.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_flexiform_campaign_details/typeC_flexiform_campaign_details_screen.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_flexiform_view_details/binding/typeC_flexiform_view_details_binding.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_flexiform_view_details/typeC_flexiform_view_details_screen.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_viewdetails_pendingforapproval/binding/typeC_viewdetails_pendingforapproval_binding.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_viewdetails_pendingforapproval/typeC_viewdetails_pendingforapproval_screen.dart';
import 'package:incentivesgit/presentation/typeC_screens/type_C_ClaimDetails/binding/claimDetailsBinding.dart';
import 'package:incentivesgit/presentation/typeC_screens/type_C_ClaimDetails/type_C_claimDetailsScreen.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaign_details_card_progressbar/binding/campaigndetailscardprogressbarbinding.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaign_details_card_progressbar/campaign_details_cardprogressbar.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaign_details_card_screen/binding/campaigndetailscardscreenbinding.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaign_details_card_screen/campaign_details_card_screen.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaigndetailstargetmeter/binding/campaigndetailstargetmeterbinidng.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaigndetailstargetmeter/campaigndetailstargetmeter.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaigndetailstargetmeter2tails/binding/campaigndetailstargetmeter2tailsbinding.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaigndetailstargetmeter2tails/campaigndetailstargetmeter2tails_screen.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaigndetailstargetmeter3tails/binding/campaigndetailstargetmeter3tailsbinding.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaigndetailstargetmeter3tails/campaigndetailstargetmeter3tails_screen.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myperformancecard/binding/myperformancecardbinding.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myperformancecard/my_performance_card_screen.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myperformancetargetmeter/binding/myperformancetargetmeterbinding.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myperformancetargetmeter/myperformacetargetmeter_screen.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myprogressbar/binding/myprogressbarbinding.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myprogressbar/myprogressbar_screen.dart';
import 'package:incentivesgit/presentation/typeD_calculated_points_screen/binding/typeD_calculated_points_binding.dart';
import 'package:incentivesgit/presentation/typeD_calculated_points_screen/typeD_calculated_points_screen.dart';
import 'package:incentivesgit/presentation/typeF_screens/allreferrals_viewdetails/allreferrals_viewdetails_screen.dart';
import 'package:incentivesgit/presentation/typeF_screens/allreferrals_viewdetails/binding/allreferrals_viewdetails_binding.dart';
import 'package:incentivesgit/presentation/typeF_screens/campaigndetails_allreferrals/binding/campaigndetails_allreferrals_binding.dart';
import 'package:incentivesgit/presentation/typeF_screens/campaigndetails_allreferrals/campaigndetails_allreferrals_screen.dart';
import 'package:incentivesgit/presentation/typeF_screens/earnedpoints_viewdetails/binding/earnedpoints_viewdetails_binding.dart';
import 'package:incentivesgit/presentation/typeF_screens/earnedpoints_viewdetails/earnedpoints_viewdetails_screen.dart';
import 'package:incentivesgit/presentation/typeF_screens/redeemcode_earned%E2%80%8B%E2%80%8Bpoints/binding/redeemcode_earned%E2%80%8B%E2%80%8Bpoints_binding.dart';
import 'package:incentivesgit/presentation/typeF_screens/redeemcode_earned%E2%80%8B%E2%80%8Bpoints/redeemcode_earned%E2%80%8B%E2%80%8Bpoints_screen.dart';
import 'package:incentivesgit/presentation/typeF_screens/successfulreferrals%E2%80%8B_viewdetails/binding/successfulreferrals%E2%80%8B_viewdetails_binding.dart';
import 'package:incentivesgit/presentation/typeF_screens/successfulreferrals%E2%80%8B_viewdetails/successfulreferrals%E2%80%8B_viewdetails_screen.dart';
import 'package:incentivesgit/presentation/typeF_screens/successfulreferrals_points%E2%80%8B/binding/successfulreferrals_points%E2%80%8B_binding.dart';
import 'package:incentivesgit/presentation/typeF_screens/successfulreferrals_points%E2%80%8B/successfulreferrals_points%E2%80%8B_screen.dart';
import 'package:incentivesgit/presentation/type_A_directawardingofpoints/binding/direct_awardinfofpoints_binding.dart';
import 'package:incentivesgit/presentation/type_A_directawardingofpoints/directawardingofpoints_screen.dart';
import 'package:incentivesgit/presentation/type_A_incentives_plans/binding/incentive_plans_binding.dart';
import 'package:incentivesgit/presentation/type_A_incentives_plans/incentives_plans.dart';
import 'package:incentivesgit/presentation/type_A_leaderboard/binding/leaderboard_binding.dart';
import 'package:incentivesgit/presentation/type_A_leaderboard/leaderboard_screen.dart';
import 'package:incentivesgit/presentation/type_A_view_details/binding/view_details_binding.dart';
import 'package:incentivesgit/presentation/type_A_view_details/view_details_screen.dart';
import 'package:incentivesgit/presentation/type_B_leaderboard/binding/leaderBoard_typeb_binding.dart';
import 'package:incentivesgit/presentation/type_B_leaderboard/leaderBoard_screen.dart';
import 'package:incentivesgit/presentation/type_C_flexiform_create_claim/binding/create_claim_binding.dart';
import 'package:incentivesgit/presentation/type_C_flexiform_create_claim/create_claim_screen.dart';
import 'package:incentivesgit/presentation/type_b_screen/campain_details_screen/campain_details_screen.dart';
import 'package:incentivesgit/presentation/type_g_screens/Scan_qrcode/Binding/qrcode_binding.dart';
import 'package:incentivesgit/presentation/type_g_screens/Scan_qrcode/scan_qrcode.dart';
import 'package:incentivesgit/presentation/type_g_screens/type_g_campaigndetails/binding/type_g_campaigndetailsBinding.dart';
import 'package:incentivesgit/presentation/type_g_screens/type_g_campaigndetails/type_g_campaign_details.dart';
import 'package:incentivesgit/widgets/accountverified.dart';
import 'package:incentivesgit/widgets/customalert.dart';
import 'package:incentivesgit/widgets/newversionupdateDialogue.dart';
import 'package:incentivesgit/widgets/password_succefully.dart';

import '../presentation/Approvals/approved_details/binding/approved_binding.dart';
import '../presentation/TierScreen/ViewTierscreen/binding/view_tier_binding.dart';
import '../presentation/TierScreen/ViewTierscreen/view_tier_screen.dart';
import '../presentation/TierScreen/getall_Tiers/audit_trail_screen.dart';
import '../presentation/TierScreen/getall_Tiers/binding/audit_trail_binding.dart';
import '../presentation/certificate_screens/Myprofile/binding/myProfile_binding.dart';
import '../presentation/certificate_screens/Myprofile/myProfile_screen.dart';
import '../presentation/certificate_screens/get_all_certificate_screen/binding/get_all_certificate_binding.dart';
import '../presentation/certificate_screens/get_all_certificate_screen/get_all_certificate_screen.dart';
import '../presentation/certificate_screens/view_certificate_screen/binding/view_certificate_binding.dart';
import '../presentation/certificate_screens/view_certificate_screen/view_certificate_screen.dart';
import '../presentation/certificate_screens/view_profile_screen/binding/view_profile_binding.dart';
import '../presentation/certificate_screens/view_profile_screen/view_profile_screen.dart';
import '../presentation/gallery_screen/create_gallery_screen/binding/create_gallery_binding.dart';
import '../presentation/gallery_screen/create_gallery_screen/create_gallery_Screen.dart';
import '../presentation/gallery_screen/get_gallrey_screen/binding/gallery_binding.dart';
import '../presentation/gallery_screen/get_gallrey_screen/gallery_screen.dart';
import '../presentation/hub properties/binding/propertiesbinding.dart';
import '../presentation/hub properties/hubproperties_screen.dart';
import '../presentation/hubpropertiesvideo/binding/hubpropertiesvideobinding.dart';
import '../presentation/hubpropertiesvideo/hubpropertiesvideoScreen.dart';
import '../presentation/knowladge_center/create_article_screen/binding/create_article_binding.dart';
import '../presentation/knowladge_center/create_article_screen/create_article_Screen.dart';
import '../presentation/knowladge_center/knowladge_tabbar_screen/Knowledge_TabBar_Screen.dart';
import '../presentation/knowladge_center/knowladge_tabbar_screen/binding/Knowledge_TabBar_Binding.dart';
import '../presentation/myOrders/voucher_view/vouchar_view_screen.dart';
import '../presentation/onBoarding/loginWithPassword/binding/loginPassword_binding.dart';
import '../presentation/onBoarding/loginWithPassword/login_password.dart';
import '../presentation/onBoarding/login_otp/binding/loginOtp_binding.dart';
import '../presentation/onBoarding/login_otp/loginOtp_scree.dart';
import '../presentation/onBoarding/resend_verify_mail/binding/resendotpbinding.dart';
import '../presentation/onBoarding/resend_verify_mail/resendotpscreen.dart';
import '../presentation/onBoarding/set_password/binding/setpassword_binding.dart';
import '../presentation/onBoarding/set_password/setpasswordscreen.dart';
import '../presentation/onBoarding/splash_screen/binding/splash_binding.dart';
import '../presentation/onBoarding/splash_screen/splash_screen.dart';
import '../presentation/onBoarding/userVerification/userVerification_screen.dart';
import '../presentation/typeC_screens/typeC_KpiSku_ClaimDetails/binding/typeC_KpiSku_ClaimDetails_binding.dart';
import '../presentation/typeC_screens/typeC_KpiSku_ClaimDetails/typeC_KpiSku_ClaimDetails_screen.dart';
import '../presentation/type_b_screen/campain_details_screen/binding/campain_details_binding.dart';
import '../presentation/type_g_screens/Scan_Code_Enter_qrcode/Binding/ScanCodeEnter_binding.dart';
import 'package:incentivesgit/presentation/type_g_screens/Scan_Code_Enter_qrcode/Scan_Code_Enter_qrcode.dart';

class AppRoutes {
  // OnBoarding Screens
  static const String initialRoute = '/splash_screen';
  static const String loginScreen = '/login_screen';
  static const String undermaintenance = '/under_maintenance';
  static const String notification = '/notification';
  static const String loginPassword = '/loginPassword';
  static const String loginOtp = '/login_Otp';
  static const String userVerification = '/userVerification';
  static const String accountverified = '/accountverified';
  static const String resendotp = '/resendotp';
  static const String resendotpverify = '/resendotpverify';
  static const String newUserScreen = '/new_user_screen';
  static const String setPasswordScreen = '/set_password_screen';
  static const String forgetpassword = '/forgetScreen';
  static const String resetpasword = '/resetpasswordscreen';
  static const String loginsuccesfully = '/loginsuccesfully';
  static const String update = '/newversionupdateDialogue';
  static const String bottomtab = '/bottomNav';
  static const String campaign = '/campaign';
  static const String mycampaign = '/mycampaign';
  static const String engagement = '/engagement';
  static const String account = '/account';
  static const String campaignearnedviewdetails =
      '/campaign_earned_point_viewdetails_screen';
  static const String redeemedpoint = '/redeemedpoint_screen';
  static const String campaignearnedpoints = '/campaignearnedpoints_screen';
  static const String campaignredeemedpoints =
      '/campaignredeeemedpoints_screen';
  static const String campaignexpiredpoints = '/campaignexpiredpoints_screen';
  static const String campaignbalancepoints = '/campaignbalancepoints_screen';
  static const String claimapprovahistory = '/typeC_claim_approval_screen';

  // Type A Screens
  static const String inceniveplans = '/incentive_plans';
  static const String viewdetailsforachivdements = '/view_details';
  static const String typeAleaderboard = '/leader_board';
  static const String directawardingofpoints = '/directawardingofpoints';
  static const String typebleaderboard = '/leaderboard';

  // TYPE B Screens
  static const String typebcampaignDetails = '/campain_details';
  static const String typeckpiskuregression = '/Type_C_kpiskuregressionScreen';
  static const String createclaimmanagement =
      '/Type_C_createclaimmanagementScreen';
  static const String typeckpiskucreateclaim =
      '/Type_C_typeckpiskucreateclaimScreen';
  static const String customalert = '/cutomalert';
  static const String typeckpiskuawaringpointsclaimmanagement =
      '/Type_C_typeckpiskuawaringpointsclaimmanagementScreen';

  // Type C Screens
  static const String typeCflexicreateclaim = '/createclaim';
  static const String typeccreateclaim = '/typeC_create_claim_screen';
  static const String typecclaimapprovalhistory =
      '/typeC_claim_approval_screen';
  static const String typecflexiformapproval =
      '/typeC_flexiform_approval_history_screen';
  static const String typecflexiformviewdetails =
      '/typeC_flexiform_view_details';
  static const String typecflexiformcampaigndetails =
      '/typeC_flexiform_campaign_details';
  static const String claimapprovalbasedonflexiform =
      '/claimapprovalbasedonflexiform';
  static const String typectotalinvoiceregression =
      '/Type_C_totalinvoiceregressionScreen';
  static const String typeCClaimDetails = '/type_C_claimdetails';
  static const String typeckpiskuclaimdetails =
      '/Type_C_typeckpiskuclaimdetailsScreen';
  static const String typecviewdetailspending =
      '/typeC_viewdetails_pendingforapproval';

  // Type D Screens
  static const String campaigndetailstargetmeter =
      '/campaigndetailstargetmeter_screen';
  static const String campaigndetailstargetmeter3trial =
      '/campaigndetailstargetmeter3trial_screen';
  static const String myperformancetargetmeter =
      '/myperformancetargetmeter_screen';
  static const String campaigndetailscardscreen =
      '/campaigndetailscardscreen_screen';
  static const String myperformancecard = '/myperformancecard_screen';
  static const String campaigndetailstargetmeter2tail =
      '/campaigndetailstargetmeter2tail_screen';
  static const String campaigndetailscardprogressbar =
      '/campaigndetailscardprogressbar_screen';
  static const String myprogressbar = '/myprogressbar_screen';
  static const String typedcalculatedpoints = '/typeD_calculated_points_screen';
  static const String campaigncalculatedprogramId =
      '/calculatedtotal_program_id_screen';
  static const String campaignearnedprogramId =
      '/earnedtotal_program_id_screen';
  static const String campaignredeemedprogramId =
      '/redeemedtotal_program_id_screen';
  static const String campaignexpiredprogramId =
      '/expiredtotal_program_id_screen';
  static const String campaignbalanceprogramId =
      '/balancetotal_program_id_screen';

  // Type F Screens
  static const String successfulreferralsviewdetails =
      '/successfulreferralsviewdetails';
  static const String successfulreferralspoints = '/successfulreferralspoints';
  static const String productreferreltabbar = '/productreferreltabbar';
  static const String allreferralsviewdetails = '/allreferralsviewdetails';
  static const String earnedpointsviewdetails = '/earnedpointsviewdetails';
  static const String campaigndetailsallreferrals =
      '/campaigndetailsallreferrals';
  static const String redeemcodeearnedpoints = '/redeemcodeearnedpoints';
  static const String referafriend = '/referafriend';
  static const String succesfulreferrel = '/succesfulreferrel';
  static const String redeemcode = '/redeemcode';
  static const String qrcodeEnterscnner = '/Qr_code_Enter_screen';

  // Buzz Screens
  static const String buzz9 = '/buzz_9';
  static const String buzz10 = '/buzz_10';
  static const String buzz28 = '/buzz_28';
  static const String buzz32 = '/buzz_32';
  static const String buzz33 = '/buzz_33';
  static const String buzzpost = '/buzzpost';
  static const String buzzetabbar = '/Buzze_Tabbar';
  static const String buzzetabbarleaderboard = '/Buzze_Tabbar_LeaderBoard';
  static const String buzzesummary = '/buzzSummary_Screen.dart';

  // Certificate Screens
  static const String certificate7 = '/certificate_7';
  static const String certificate8 = '/certificate_8';
  static const String certificate10 = '/certificate_10';
  static const String certificatetabbar = '/certificate_Tabbar';
  static const String viewprofile = '/view_profile_screen';
  static const String certifiateleaderBoard = '/certificateleaderboard_screen';
  static const String awardCertificate = '/awardCertificate_screen';
  static const String viewotherprofile = '/viewotherprofile';
  static const String myProfile = '/myProfile_screen';
  // Hub Screens
  static const String hub = '/hub_screen';
  static const String hub1 = '/hub1_screen';
  static const String hub2 = '/hub2_screen';
  static const String hub3 = '/hub3_screen';
  static const String hub4 = '/hub4_screen';
  static const String hubproperties = '/hubpropertiesscreen';
  static const String hubpropertiesvideo = '/hubpropertiesvideoscreen';

  // Like and Comment Screens
  static const String likerdata = '/likerdata';
  static const String commentsdata = '/commentsdata';
  static const String viewcertificatescreen = '/view_certificate_screen';

  // My Profile Screens
  static const String passwordreset = '/passwordreset';
  static const String emailpreferencesunsubscribe =
      '/emailpreferencesunsubscribe';
  static const String businesshierarchy = '/businesshierarchy';
  static const String myprofile = '/myprofile';
  static const String emailpreference = '/emailpreference';
  static const String panprofile = '/panProfile';
  static const String mytdscertificate = '/mytdscertificate';

  // My Wallet Screens
  static const String mywallettransaction = '/myWalletTransaction';
  static const String paytmprofile = '/paytmProfile';
  static const String upiprofile = '/upiProfile';
  static const String verificationcode = '/verificationCode';
  static const String selectwalletviewdetails = '/mywalletviewdetails';
  static const String pointsreceivedorderviewdetails =
      '/pointsreceivedorder_viewdetails';

  // My Budget Screens
  static const String mybudgetviewdetails = '/mybudgetviewdetails';
  static const String mybudgetauditdetails = '/mybudgetauditdetails';
  static const String mybudgetbalance = '/mybudgetbalance';

  // My Orders Screens
  static const String myordersvouchertype3 = '/myordersvouchertype3';
  static const String myorders = '/myorderscreen';
  static const String myordersviewdetails = '/viewdetailscreen';
  static const String myordersvouchertype = '/MyOrderVoucherTypeScreen';
  static const String voucharDetails = "/vouchar_view_screen.dart";
  static const String orderOtpScreen = "/orderOtpScreen";

  // Rewards Screens
  static const String rewardssuperchequescredit = '/rewardssuperchequescredit';
  static const String rewards = '/rewards';
  static const String supercheque = '/supercheque';
  static const String scanqrcode = '/scanqrcode';
  static const String qrcodedata = '/qrcodedata';
  static const String banktransfer = '/bankTransfer';
  static const String banktransferflexi = '/bankTransferflexi';
  static const String banktransferflexi2 = '/bankTransferflexi2';
  static const String cashpayout = '/cashPayout';
  static const String product = '/product';
  static const String giftCardviewdetails = '/giftcardviewDetails';

  // Help and Support Screens
  static const String helpandsupportlandingpage = '/helpandsupportlandingpage';
  static const String helpandsupporthelpmanual1 = '/helpandsupporthelpmanual1';
  static const String helpandsupporthelpmanual3 = '/helpandsupporthelpmanual3';
  static const String helpandsupporthelpmanual4 = '/helpandsupporthelpmanual4';
  static const String helpandsupportcustomersupport4 =
      '/helpandsupportcustomersupport4';
  static const String helpandsupportscheduledupgrade =
      '/helpandsupportscheduledupgrade';
  static const String helpandsupportaboutmyincentives =
      '/helpandsupportaboutmyincentives';
  static const String helpandsupportcustomersupport2 =
      '/helpandsupportcustomersupport2';
  static const String helpandsupportcustomersupport5 =
      '/helpandsupportcustomersupport5';
  static const String customersupport1 = '/customercupport1';
  static const String helpandsupportcustomersupport1 =
      '/helpandsupportcustomersupport1';
  static const String editticket = '/editticket';

  // Approvals Screens
  static const String myapprovaltabbar = '/MyApprovalTabBar_Screen';
  static const String requestpendingg = '/requestpending_screen';
  static const String approveddetails = '/ApprovalDetails_Screen';
  static const String userapprovals = '/userapprovals_screen';
  //static const String myapproval = '/MyApproval_Screen';
  static const String approvalcampaignapproval = '/campaignapprovalScreen';
  static const String approvalviewdetails = '/claimapproval_1_screen';
  static const String claimapprovalviewdetails = '/viewdetailsscreen';
  static const String reporteeviewdetails = '/reporteeAdditionApproval_screen';
  static const String programviewdetails = '/ProgramApprovalscreen';
  static const String incentiveviewdetails = '/incentiveapproval_screen';
  static const String myapproval = '/myapproval_screen';

  // Quizzes Screens
  static const String quizzes10 = '/quizzes10';
  static const String quizzes16 = '/quizzes16';
  static const String quizzesTabBarScreen = "/quizzes_tabbar_screen.dart";
  static const String quizzesPostScreen = "/quizzes_post_screen.dart";
  static const String quizzesScreen = "/quizzes_screen.dart";
  static const String liveQuizScreen = "/live_quiz.dart";
  static const String upcomingQuizScreen = "/upcoming_quiz_screen.dart";
  static const String quizDetailScreen = "/quizDetailScreen";
  static const String generalKnowledge = "/generalKnowledge";

  // Birthdays Screens
  static const String birthdaytabbar = '/birthday_tabbar_screen';

  // Anniversaries Screens
  static const String anniversariestabbar = '/anniversaries_tabbar_screen';

  // New Screens
  static const String newstabbar = '/news_tabbar_screen';
  static const String createnews = '/createnews__screen';

  // Knowledge Screens
  static const String knowladgetabbar = '/knowladge_tabbar_screen';
  static const String createarticle = '/create_article_screen';

  // Gallery Screens
  static const String galleryscreen = '/get_gallery_screen';
  static const String creategalleryscreen = '/create_gallery_screen';

  //Type G Screens
  static const String qrcodescnner = '/Qr_code_screens';
  static const String typegcampaigndetails = '/type_g_campaigndetails';

  //Tier_Screen
  static const String viewtierscreen = '/viewtier_screen';
  static const String audittrailscreen = '/audit_trail_screen';

  static List<GetPage> pages = [
    GetPage(
      name: typebcampaignDetails,
      page: () => const CampaignDetailstypeBScreen(),
      bindings: [
        CampainDetailsBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: undermaintenance,
      page: () => const UnderMaintenenceScreen(),
      bindings: [
        UnderMaintenenceBinding(),
      ],
    ),
    GetPage(
      name: notification,
      page: () => const NotificationScreen(),
      bindings: [
        NotificationBinding(),
      ],
    ),
    GetPage(
      name: loginPassword,
      page: () => const LoginWithPassword(),
      bindings: [
        LoginPasswordBinding(),
      ],
    ),
    GetPage(
      name: loginOtp,
      page: () => const OtpScreen(),
      bindings: [
        LoginOtpBinding(),
      ],
    ),
    GetPage(
      name: userVerification,
      page: () => const UserVerificationScreen(),
      bindings: [
        UserVerificationBinding(),
      ],
    ),
    GetPage(
      name: accountverified,
      page: () => const AccountVerifiedScreen(),
    ),
    GetPage(
      name: resendotp,
      page: () => const ResendOtpScreen(),
      bindings: [
        ResendOtpBinding(),
      ],
    ),
    GetPage(
      name: newUserScreen,
      page: () => const NewUserScreen(),
      bindings: [
        NewUserBinding(),
      ],
    ),
    GetPage(
      name: newUserScreen,
      page: () => const ForgetScreen(),
      bindings: [
        ForgetBinding(),
      ],
    ),
    GetPage(
      name: setPasswordScreen,
      page: () => const SetpassWordScreen(),
      bindings: [
        SetPasswordBinding(),
      ],
    ),
    GetPage(
      name: forgetpassword,
      page: () => const ForgetScreen(),
      bindings: [
        ForgetBinding(),
      ],
    ),
    GetPage(
      name: resendotpverify,
      page: () => const ResendOtpVerifyScreen(),
      bindings: [
        ResendOtpVerifyBinding(),
      ],
    ),
    GetPage(
      name: resetpasword,
      page: () => ResetPassWordScreen(),
      bindings: [
        ResetPasswordBinding(),
      ],
    ),
    GetPage(
      name: bottomtab,
      page: () => const BottomNavScreen(),
      bindings: [
        BottomNavBinding(),
      ],
    ),
    GetPage(
      name: engagement,
      page: () => const EngagementScreen(),
      bindings: [
        EngagementBinding(),
      ],
    ),
    GetPage(
      name: account,
      page: () => const AccountScreen(),
      bindings: [
        AccountBiniding(),
      ],
    ),
    GetPage(
      name: campaign,
      page: () => const CampaignScreen(),
      bindings: [
        CampaignBinding(),
      ],
    ),
    GetPage(
      name: mycampaign,
      page: () => const MyCapmainsScreen(),
      bindings: [
        MyCampainsBinding(),
      ],
    ),
    GetPage(
      name: campaignearnedviewdetails,
      page: () => const ViewDetailsScreen(),
      bindings: [
        ViewDetailsBinding(),
      ],
    ),
    GetPage(
      name: campaignearnedpoints,
      page: () => const CampaignEarnedPointsScreen(),
      bindings: [
        CampaignEarnedPointsBinding(),
      ],
    ),
    GetPage(
      name: typeccreateclaim,
      page: () => const CreateClaimScreen(),
      bindings: [
        CreateClaimBinding(),
      ],
    ),
    GetPage(
      name: hub,
      page: () => const HubScreen(),
      bindings: [
        HubBinding(),
      ],
    ),
    GetPage(
      name: claimapprovahistory,
      page: () => const ClaimApprovalScreen(),
      bindings: [
        ClaimApprovalBinding(),
      ],
    ),
    GetPage(
      name: typedcalculatedpoints,
      page: () => const CalculatedPointsScreen(),
      bindings: [
        CalculatedPointsBinding(),
      ],
    ),
    GetPage(
        name: typecflexiformapproval,
        page: () => const FlexiFormApprovalScreen(),
        bindings: [
          FlexiFormApprovalBinding(),
        ]),
    GetPage(
      name: campaigndetailstargetmeter,
      page: () => const CampaignDetailsTargetMeter(),
      bindings: [
        CampaignDetailsTargetMeterBinding(),
      ],
    ),
    GetPage(
      name: loginsuccesfully,
      page: () => const PasswordSuccessfullyScreen(),
    ),
    GetPage(
      name: update,
      page: () => const UpdateDialog(),
    ),
    GetPage(
      name: inceniveplans,
      page: () => const Incentiveplans(),
      bindings: [
        IncentivePlansBinding(),
      ],
    ),
    GetPage(
      name: viewdetailsforachivdements,
      page: () => const ViewDetailsForAchivementsScreen(),
      bindings: [
        ViewDetailsForAchivementsBinding(),
      ],
    ),
    GetPage(
      name: typeAleaderboard,
      page: () => const LeaderBoardScreentypea(),
      bindings: [
        LeaderBoardBinding(),
      ],
    ),
    GetPage(
      name: campaigndetailstargetmeter3trial,
      page: () => const CampaignDetailsTargetMeter3trialsScreen(),
      bindings: [
        CampaignDetailsTargetMeter3trialsBinding(),
      ],
    ),
    GetPage(
      name: myperformancetargetmeter,
      page: () => const MyPerformanceTargetMeterScreen(),
      bindings: [
        MyPerformanceTargetMeterBinding(),
      ],
    ),
    GetPage(
      name: campaigndetailscardscreen,
      page: () => const CampaignDetailsCardScreen(),
      bindings: [
        CampaignDetailsCardBinding(),
      ],
    ),
    GetPage(
      name: myperformancecard,
      page: () => const MyPerformanceCardScreen(),
      bindings: [
        MyPerformanceCardBinding(),
      ],
    ),
    GetPage(
      name: campaigndetailstargetmeter2tail,
      page: () => const CampaignDetailsTargetMeter2tailsScreen(),
      bindings: [
        CampaignDetailsTargetMeter2taillsBinding(),
      ],
    ),
    GetPage(
      name: campaigndetailscardprogressbar,
      page: () => const CampaignDetailsCardProgressBarScreen(),
      bindings: [
        CampaignDetailsCardProgressBarBinding(),
      ],
    ),
    GetPage(
      name: myprogressbar,
      page: () => const MyProgressBarScreen(),
      bindings: [
        MyProgressBarBinding(),
      ],
    ),
    GetPage(
      name: directawardingofpoints,
      page: () => const CampaignDetailstypeAScreen(),
      bindings: [
        DirectAwardingOfPointsBinding(),
      ],
    ),
    GetPage(
      name: typeCflexicreateclaim,
      page: () => TypeCFlexiCreateClaimScreen(),
      bindings: [
        TypeCCreateClaimFlexiformBinding(),
      ],
    ),
    GetPage(
      name: typecflexiformviewdetails,
      page: () => TypeCViewDetailsScreen(),
      bindings: [
        TypeCViewDetailsBinding(),
      ],
    ),
    GetPage(
      name: typecflexiformcampaigndetails,
      page: () => const TypeCCampaignDetailsScreen(),
      bindings: [
        TypeCCampaignDetailsBinding(),
      ],
    ),
    GetPage(
      name: campaignredeemedpoints,
      page: () => const CampaignRedeemedPointsScreen(),
      bindings: [
        CampaignRedeemedPointsBinding(),
      ],
    ),
    GetPage(
      name: campaignexpiredpoints,
      page: () => const CampaignExpiredPointsScreen(),
      bindings: [
        CampaignExpiredPointsBinding(),
      ],
    ),
    GetPage(
      name: campaignbalancepoints,
      page: () => const CampaignBalancePointsScreen(),
      bindings: [
        CampaignBalancePointsBinding(),
      ],
    ),
    GetPage(
      name: buzz9,
      page: () => Buzz9Screen(),
      bindings: [
        Buzz9Binding(),
      ],
    ),
    GetPage(
      name: claimapprovalbasedonflexiform,
      page: () =>
          const ClaimApprovalBasedAwardingofPointsClaimManagementFlexiForm(),
      bindings: [
        ClaimApprovalBasedAwardingofPointsClaimManagementFlexiFormBinding(),
      ],
    ),
    GetPage(
      name: typebleaderboard,
      page: () => const LeaderBoardScreentypeb(),
      bindings: [
        LeaderBoardTypeBBinding(),
      ],
    ),
    GetPage(
      name: buzz28,
      page: () => Buzz28Screen(),
      bindings: [
        Buzz28Binding(),
      ],
    ),
    GetPage(
      name: buzz33,
      page: () => Buzz33Screen(),
      bindings: [
        Buzz33Binding(),
      ],
    ),
    GetPage(
      name: myProfile,
      page: () => MyProfileeScreen(),
      bindings: [
        MyProfileeBinding(),
      ],
    ),
    GetPage(
      name: buzzpost,
      page: () => const BuzzesTabbarPostScreen(),
      bindings: [
        BuzzesTabbarBinding(),
      ],
    ),
    GetPage(
      name: buzzetabbar,
      page: () => BuzzestabBarScreens(),
      bindings: [
        BuzzesTabBarBinding(),
      ],
    ),
    GetPage(
      name: certificatetabbar,
      page: () => CertificatetabBarScreens(),
      bindings: [
        CertificateTabBarBinding(),
      ],
    ),
    GetPage(
      name: certificatetabbar,
      page: () => const GetAllCertificateScreen(),
      bindings: [
        GetAllCertificateBinding(),
      ],
    ),
    GetPage(
      name: certificate7,
      page: () => const Certificate7Screen(),
      bindings: [
        Certificate7Binding(),
      ],
    ),
    GetPage(
      name: certificate8,
      page: () => const Certificate8Screen(),
      bindings: [
        Certificate8Binding(),
      ],
    ),
    GetPage(
      name: viewprofile,
      page: () => const ViewProfileScreen(),
      bindings: [
        ViewProfileBinding(),
      ],
    ),
    GetPage(
      name: viewotherprofile,
      page: () => const ViewOtherProfileScreen(),
      bindings: [
        GetAllCertificateBinding(),
      ],
    ),
    GetPage(
      name: buzzetabbarleaderboard,
      page: () => const BuzzesTabbarLeaderBoardScreen(),
      bindings: [
        BuzzesTabbarLeaderBoardBinding(),
      ],
    ),
    GetPage(
      name: certificate10,
      page: () => const Certificate10Screen(),
      bindings: [
        Certificate10Binding(),
      ],
    ),
    GetPage(
      name: hub4,
      page: () => const Hub4Screen(),
      bindings: [
        Hub4Binding(),
      ],
    ),
    GetPage(
      name: hub3,
      page: () => const Hub3Screen(),
      bindings: [
        Hub3Binding(),
      ],
    ),
    GetPage(
      name: hub1,
      page: () => Hub1Screen(),
      bindings: [
        Hub1Binding(),
      ],
    ),
    GetPage(
      name: hub2,
      page: () => Hub2Screen(),
      bindings: [
        Hub2Binding(),
      ],
    ),
    GetPage(
      name: hubproperties,
      page: () => const HubPropertiesScreen(),
      bindings: [
        HubPropertiesBinding(),
      ],
    ),
    GetPage(
      name: hubpropertiesvideo,
      page: () => const HubPropertiesVideoScreen(),
      bindings: [
        HubPropertiesVideoBinding(),
      ],
    ),
    GetPage(
      name: typectotalinvoiceregression,
      page: () => const TypeCTotalInvoiceRegression(),
      bindings: [
        TypeCTotalinvoiceRegressionBinding(),
      ],
    ),
    GetPage(
      name: campaigncalculatedprogramId,
      page: () => const CampaignCalculatedPointsScreen(),
      bindings: [
        CampaignCalculatedPointsBinding(),
      ],
    ),
    GetPage(
      name: campaignearnedprogramId,
      page: () => const CampaignEarnedPointsScreen1(),
      bindings: [
        CampaignEarnedPointsBinding1(),
      ],
    ),
    GetPage(
      name: campaignredeemedprogramId,
      page: () => const CampaignRedeemedPointsScreen1(),
      bindings: [
        CampaignRedeemedPointsBinding1(),
      ],
    ),
    GetPage(
      name: campaignexpiredprogramId,
      page: () => const CampaignExpiredPointsScreen1(),
      bindings: [
        CampaignExpiredPointsBinding1(),
      ],
    ),
    GetPage(
      name: campaignbalanceprogramId,
      page: () => const CampaignBalancePointsScreen1(),
      bindings: [
        CampaignBalancePointsBinding1(),
      ],
    ),
    GetPage(
      name: typeCClaimDetails,
      page: () => const TypeCClaimDetailsScreen(),
      bindings: [
        TypeCClaimDetailsBinding(),
      ],
    ),
    GetPage(
      name: typeckpiskuclaimdetails,
      page: () => const TypeCKpiSkuClaimDetailsScreen(),
      bindings: [
        TypeCKpiSkuClaimDetailsBinding(),
      ],
    ),
    GetPage(
      name: typeckpiskuregression,
      page: () => const TypeCKpiSkuRegressionScreen(),
      bindings: [
        TypeCKpiSkuRegressionBinding(),
      ],
    ),
    GetPage(
      name: createclaimmanagement,
      page: () => const CreateClaimManagaementScreen(),
      bindings: [
        CreateClaimManagementBinding(),
      ],
    ),
    GetPage(
      name: typeckpiskucreateclaim,
      page: () => const TypeCKpiSkuCreateClaimScreen(),
      bindings: [
        TypeCKpiSkuCreateClaimBinding(),
      ],
    ),
    GetPage(
      name: customalert,
      page: () => const SuccessDialogScreen(),
    ),
    GetPage(
      name: typeckpiskuawaringpointsclaimmanagement,
      page: () => const TypeCKpiSkuAwardingPointsClaimManagementScreen(),
      bindings: [
        TypeCKpiSkuAwardingPointsClaimManagementBinding(),
      ],
    ),
    GetPage(
      name: buzzesummary,
      page: () => const BuzzSummaryScreen(),
      bindings: [
        BuzzeSummaryBinding(),
      ],
    ),
    GetPage(
      name: buzz32,
      page: () => Buzz32Screen(),
      bindings: [
        Buzz32Binding(),
      ],
    ),
    GetPage(
      name: likerdata,
      page: () => const LikeDataScreen(),
      bindings: [
        LikeDataBinding(),
      ],
    ),
    GetPage(
      name: commentsdata,
      page: () => const CommentsDataScreen(),
      bindings: [
        CommentsDataBinding(),
      ],
    ),
    GetPage(
      name: awardCertificate,
      page: () => AwardCertificateScreen(),
      bindings: [
        AwardCertificateBinding(),
      ],
    ),
    GetPage(
      name: viewcertificatescreen,
      page: () => const ViewCertificateScreen(),
      bindings: [
        ViewCertificateBinding(),
      ],
    ),
    GetPage(
      name: typecviewdetailspending,
      page: () => const TypeCViewDetailsPendingforapprovalScreen(),
      bindings: [
        TypeCViewDetailsPendingforapprovalBinding(),
      ],
    ),
    GetPage(
      name: passwordreset,
      page: () => const PasswordResetScreen(),
      bindings: [
        PasswordResetBinding(),
      ],
    ),
    GetPage(
      name: emailpreferencesunsubscribe,
      page: () => const EmailPreferencesUnsubscribeScreen(),
      bindings: [
        EmailPreferencesUnsubscribeBinding(),
      ],
    ),
    GetPage(
      name: businesshierarchy,
      page: () => const BusinessHierarchyScreen(),
      bindings: [
        BusinessHierarchyBinding(),
      ],
    ),
    GetPage(
      name: mywallettransaction,
      page: () => const MyWalletScreen(),
      bindings: [
        MyWalletBinding(),
      ],
    ),
    GetPage(
      name: mybudgetviewdetails,
      page: () => const MyBudgetViewDetailsScreen(),
      bindings: [
        MyBudgetViewDetailsBinding(),
      ],
    ),
    GetPage(
      name: mybudgetauditdetails,
      page: () => const AuditDetailsScreen(),
      bindings: [
        AuditDetailsBinding(),
      ],
    ),
    GetPage(
      name: myordersvouchertype3,
      page: () => const MyOrdersVoucherType3Screen(),
      bindings: [
        MyOrdersVoucherType3Binding(),
      ],
    ),
    GetPage(
      name: myprofile,
      page: () => const MyProfileScreen(),
      bindings: [
        MyProfileBinding(),
      ],
    ),
    GetPage(
      name: helpandsupportlandingpage,
      page: () => const HelpandSupportLandingPageScreen(),
      bindings: [
        HelpandSupportLandingPageBinding(),
      ],
    ),
    GetPage(
      name: helpandsupporthelpmanual1,
      page: () => const HelpandSupportHelpManual1Screen(),
      bindings: [
        HelpandSupportHelpManual1Binding(),
      ],
    ),
    GetPage(
      name: helpandsupporthelpmanual3,
      page: () => const HelpandSupportHelpManual3Screen(),
      bindings: [
        HelpandSupportHelpManual3Binding(),
      ],
    ),
    GetPage(
      name: helpandsupporthelpmanual4,
      page: () => const HelpandSupportHelpManual4Screen(),
      bindings: [
        HelpandSupportHelpManual4Binding(),
      ],
    ),
    GetPage(
      name: emailpreference,
      page: () => const EmailPreferenceScreen(),
      bindings: [
        EmailPreferenceBinding(),
      ],
    ),
    GetPage(
      name: panprofile,
      page: () => const PanProfileSceen(),
      bindings: [
        PanProfileBinding(),
      ],
    ),
    GetPage(
      name: mytdscertificate,
      page: () => const MyTdsCertificateScreen(),
      bindings: [
        MyTdsCertificateBinding(),
      ],
    ),
    GetPage(
      name: helpandsupportcustomersupport4,
      page: () => const HelpandSupportCustomerSupport4Screen(),
      bindings: [
        HelpandSupportCustomerSupport4Binding(),
      ],
    ),
    GetPage(
      name: helpandsupportscheduledupgrade,
      page: () => const HelpandSupportScheduledUpgradeScreen(),
      bindings: [
        HelpandSupportScheduledUpgradeBinding(),
      ],
    ),
    GetPage(
      name: helpandsupportaboutmyincentives,
      page: () => const HelpandSupportAboutMyIncentivesScreen(),
      bindings: [
        HelpandSupportAboutMyIncentivesBinding(),
      ],
    ),
    GetPage(
      name: rewardssuperchequescredit,
      page: () => const RewardsSuperchequesCreditScreen(),
      bindings: [
        RewardsSuperchequesCreditBinding(),
      ],
    ),
    GetPage(
      name: paytmprofile,
      page: () => const PaytmProfileScreen(),
      bindings: [
        PaytmProfileBinding(),
      ],
    ),
    GetPage(
      name: upiprofile,
      page: () => const UpiProfileScreen(),
      bindings: [
        UpiProfileBinding(),
      ],
    ),
    GetPage(
      name: verificationcode,
      page: () => const VerificationCodeScreen(),
      bindings: [
        VerificationCodeBinding(),
      ],
    ),
    GetPage(
      name: rewards,
      page: () => const RewardsScreen(),
      bindings: [
        RewardsBinding(),
      ],
    ),
    GetPage(
      name: supercheque,
      page: () => const SuperChequeScreen(),
      bindings: [
        SuperChequeBinding(),
      ],
    ),
    GetPage(
      name: scanqrcode,
      page: () => const ScanQrCodeScreen(),
      bindings: [
        ScanQrCodeBinding(),
      ],
    ),
    GetPage(
      name: qrcodedata,
      page: () => const QRCodeDataScreen(),
      bindings: [
        QRCodeDataBinding(),
      ],
    ),
    GetPage(
      name: myapprovaltabbar,
      page: () => MyApprovalTabBarScreens(),
      bindings: [
        ApprovalTabBarBindings(),
      ],
    ),
    GetPage(
      name: requestpendingg,
      page: () => RequestPendingViewDetailsScreen(),
      bindings: [
        RequestPendingViewDetailsBinding(),
      ],
    ),
    GetPage(
      name: approveddetails,
      page: () => ApprovedViewDetailsScreen(),
      bindings: [
        ApprovedViewDetailsBinding(),
      ],
    ),
    GetPage(
      name: userapprovals,
      page: () => UserApprovalScreen(),
      bindings: [
        UserApprovalsBinding(),
      ],
    ),
    GetPage(
      name: approvalcampaignapproval,
      page: () => ApprovalCampaignApprovalScreen(),
      bindings: [
        CampaignApprovalBinding(),
      ],
    ),
    GetPage(
      name: myordersvouchertype,
      page: () => const MyOrderVoucherTypeScreen(),
      bindings: [
        MyOrderViewDetailsVoucherTypeBinding(),
      ],
    ),
    GetPage(
      name: myorders,
      page: () => const MyOrderScreen(),
      bindings: [
        MyOrderBinding(),
      ],
    ),
    GetPage(
      name: myordersviewdetails,
      page: () => const MyOrderViewDetailsScreen(),
      bindings: [
        MyOrderViewDetailsbinding(),
      ],
    ),
    GetPage(
      name: banktransfer,
      page: () => const BankTransferScreen(),
      bindings: [
        BankTransferBinding(),
      ],
    ),
    GetPage(
      name: helpandsupportcustomersupport2,
      page: () => const HelpandSupportCustomerSupport2Screen(),
      bindings: [
        HelpandSupportCustomerSupport2Binding(),
      ],
    ),
    GetPage(
      name: banktransferflexi,
      page: () => const BankTransferFlexiScreen(),
      bindings: [
        BankTransferFlexiBinding(),
      ],
    ),
    GetPage(
      name: banktransferflexi2,
      page: () => const BankTransferFlexi2Screen(),
      bindings: [
        BankTransferFlexi2Binding(),
      ],
    ),
    GetPage(
      name: cashpayout,
      page: () => const CashPayoutScreen(),
      bindings: [
        CashPayoutBinding(),
      ],
    ),
    GetPage(
      name: product,
      page: () => const ProductScreen(),
      bindings: [
        ProductBinding(),
      ],
    ),
    GetPage(
      name: helpandsupportcustomersupport5,
      page: () => const HelpandSupportCustomerSupport5Screen(),
      bindings: [
        HelpandSupportCustomerSupport5Binding(),
      ],
    ),
    GetPage(
      name: claimapprovalviewdetails,
      page: () => const ClaimApproval1ViewDetailsScreen(),
      bindings: [
        ClaimApproval1Binding(),
      ],
    ),
    GetPage(
      name: reporteeviewdetails,
      page: () => const ReporteeAdditionApprovalScreen(),
      bindings: [
        ReporteeAdditionApprovalBinding(),
      ],
    ),
    GetPage(
      name: programviewdetails,
      page: () => const ProgramApprovalScreen(),
      bindings: [
        ProgramApprovalBinding(),
      ],
    ),
    GetPage(
      name: incentiveviewdetails,
      page: () => const IncentiveApprovalScreen(),
      bindings: [
        IncentiveApprovalBinding(),
      ],
    ),
    GetPage(
      name: approvalviewdetails,
      page: () => const ClaimApprovalViewDetailsScreen(),
      bindings: [
        ClaimApprovalViewDetailsBinding(),
      ],
    ),
    GetPage(
      name: selectwalletviewdetails,
      page: () => const SelectWalletViewDetailsScreen(),
      bindings: [
        SelectWalletViewDetailsBinding(),
      ],
    ),
    GetPage(
      name: pointsreceivedorderviewdetails,
      page: () => const PointsReceivedOrderViewDetailsScreen(),
      bindings: [
        PointsReceivedOrderViewDetailsBinding(),
      ],
    ),
    GetPage(
      name: giftCardviewdetails,
      page: () => const GiftCardViewDetailsScreen(),
      bindings: [
        GiftCardViewDetailsBinding(),
      ],
    ),
    GetPage(
      name: quizzes10,
      page: () => const Quizzes10Screen(),
      bindings: [
        Quizzes10Binding(),
      ],
    ),
    GetPage(
      name: successfulreferralsviewdetails,
      page: () => const SuccessfulReferralsViewDetailsScreen(),
      bindings: [
        SuccessfulReferralsViewDetailsBinding(),
      ],
    ),
    GetPage(
      name: successfulreferralspoints,
      page: () => const SuccessfulReferralsPointsScreen(),
      bindings: [
        SuccessfulReferralsPointsBinding(),
      ],
    ),
    GetPage(
      name: birthdaytabbar,
      page: () => BirthdayTabBarScreens(),
      bindings: [
        BirthdayTabBarBinding(),
      ],
    ),
    GetPage(
      name: anniversariestabbar,
      page: () => AnniversariesTabBarScreens(),
      bindings: [
        AnniversariesTabBarBinding(),
      ],
    ),
    GetPage(
      name: mybudgetbalance,
      page: () => const MyBudgetBalanceScreen(),
      bindings: [
        MyBudgetBalanceBinding(),
      ],
    ),
    GetPage(
      name: productreferreltabbar,
      page: () => const ProductReferrelTabbarScreen(),
      bindings: [
        ProductReferrelTabbarBinding(),
      ],
    ),
    GetPage(
      name: allreferralsviewdetails,
      page: () => const AllReferralsViewDetailsScreen(),
      bindings: [
        AllReferralsViewDetailsBinding(),
      ],
    ),
    GetPage(
      name: quizzes16,
      page: () => const Quizzes16Screen(),
      bindings: [
        Quizzes16Binding(),
      ],
    ),
    GetPage(
      name: earnedpointsviewdetails,
      page: () => const EarnedPointsViewDetailsScreen(),
      bindings: [
        EarnedPointsViewDetailsBinding(),
      ],
    ),
    GetPage(
      name: campaigndetailsallreferrals,
      page: () => const CampaignDetailsAllReferralsScreen(),
      bindings: [
        CampaignDetailsAllreferralsBinding(),
      ],
    ),
    GetPage(
      name: redeemcodeearnedpoints,
      page: () => const RedeemCodeEarnedPointsScreen(),
      bindings: [
        RedeemCodeEarnedPointsBinding(),
      ],
    ),
    GetPage(
      name: newstabbar,
      page: () => NewsTabBarScreens(),
      bindings: [
        NewsTabBarBinding(),
      ],
    ),
    GetPage(
      name: createnews,
      page: () => CreateNewsScreen(),
      bindings: [
        CreaateNewsBinding(),
      ],
    ),
    GetPage(
      name: knowladgetabbar,
      page: () => KnowledgeTabbarScreens(),
      bindings: [
        KnowledgeTabbarScreensBinding(),
      ],
    ),
    GetPage(
      name: createarticle,
      page: () => CreateArticleScreen(),
      bindings: [
        AwCreateArticleBinding(),
      ],
    ),
    GetPage(
      name: galleryscreen,
      page: () => const GalleryScreen(),
      bindings: [
        GalleryBinding(),
      ],
    ),
    GetPage(
      name: creategalleryscreen,
      page: () => CreateGalleryScreen(),
      bindings: [
        CreateGalleryBinding(),
      ],
    ),
    GetPage(
      name: referafriend,
      page: () => const ReferAFriendScreen(),
      bindings: [
        ReferAFriendBinding(),
      ],
    ),
    GetPage(
      name: succesfulreferrel,
      page: () => const SuccesfulreferrelScreen(),
      bindings: [
        SuccesfullreferrelBinding(),
      ],
    ),
    GetPage(
      name: redeemcode,
      page: () => const Redeemcode1Screen(),
      bindings: [
        Redeemcode1Binding(),
      ],
    ),
    GetPage(
      name: quizzesTabBarScreen,
      page: () => const QuizzesTabBarScreen(),
      bindings: [
        QuizzesTabbarBindings(),
      ],
    ),
    GetPage(
      name: quizzesPostScreen,
      page: () => QuizzePostScreen(),
      bindings: [
        QuizzesPostBindings(),
      ],
    ),
    GetPage(
      name: quizzesScreen,
      page: () => const QuizzeScreen(),
      bindings: [
        QuizzesBinding(),
      ],
    ),
    GetPage(
      name: liveQuizScreen,
      page: () => LiveQuizScreen(),
      bindings: [
        LiveQuizBinding(),
      ],
    ),
    GetPage(
      name: upcomingQuizScreen,
      page: () => const UpcomingQuizScreen(),
      bindings: [
        UpcomingQuizBinding(),
      ],
    ),
    GetPage(
      name: quizDetailScreen,
      page: () => const QuizzesDetailsScreen(),
      bindings: [
        QuizzesDetailsBinding(),
      ],
    ),
    GetPage(
      name: generalKnowledge,
      page: () => const GeneralKnowledgeScreen(),
      bindings: [GeneralKnowledgeBinding()],
    ),
    GetPage(
      name: voucharDetails,
      page: () => VoucharViewScreen(),
      bindings: [
        voucharBindings(),
      ],
    ),
    GetPage(
      name: orderOtpScreen,
      page: () => OrderOtpScreen(),
      bindings: [
        OtpBindings(),
      ],
    ),
    GetPage(
      name: qrcodescnner,
      page: () => const Qrcodescanner(),
      bindings: [
        QrcodescannerBinding(),
      ],
    ),
    GetPage(
      name: typegcampaigndetails,
      page: () => const TypeGCampaignDetailsScreen(),
      bindings: [
        TypeGCampaignDetailsBinding(),
      ],
    ),
    GetPage(
      name: customersupport1,
      page: () => const CustomerSupport1Screen(),
      bindings: [
        CustomerSupport1Binding(),
      ],
    ),
    GetPage(
      name: helpandsupportcustomersupport1,
      page: () => const CustomerSupport1Screen(),
      bindings: [
        CustomerSupport1Binding(),
      ],
    ),
    GetPage(
      name: editticket,
      page: () => const EditTicketScreen(),
      bindings: [
        EditTicketBinding(),
      ],
    ),

    ///////////////Tierscreen
    GetPage(
      name: viewtierscreen,
      page: () => const TierScreen(),
      bindings: [
        ViewTierBinding(),
      ],
    ),
    GetPage(
      name: audittrailscreen,
      page: () => const AuditTrailScreen(),
      bindings: [
        AuditTrailBinding(),
      ],
    ),
    GetPage(
      name: qrcodeEnterscnner,
      page: () => const QrcodeEnterscanner(),
      bindings: [
        QrcodescannerEnterBinding(),
      ],
    ),
  ];
}
