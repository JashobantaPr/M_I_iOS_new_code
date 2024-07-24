
class MyOrdersModel {
  String? ordersIdPk;
  String? memberIdFk;
  String? orderPlacedBy;
  String? orderRequestNo;
  String? ordersOrderId;
  String? ordersBillToName;
  String? ordersBillToAddress1;
  String? ordersBillToAddress2;
  String? ordersBillToCity;
  String? ordersBillToState;
  String? ordersBillToZip;
  String? ordersBillToCountry;
  String? ordersBillToTelephone;
  String? ordersBillToEmail;
  String? ordersShipToName;
  String? ordersShipToAddress1;
  String? ordersShipToAddress2;
  String? ordersShipToCity;
  String? ordersShipToState;
  String? ordersShipToZip;
  String? ordersShipToCountry;
  String? ordersShipToMobileno;
  String? points;
  String? ordersIpAddress;
  String? ordersStatus;
  String? ordersRecordDate;
  String? otp;
  String? productCode;
  String? productName;
  String? productCategory;
  String? smallImageLink;
  String? productPoints;
  String? quantity;
  String? sitePrice;
  String? baseCurrency;
  String? walletTypeName;
  String? walletName;
  String? tdsPercent;
  String? tdsPoint;
  String? bankReferenceNo;
  String? transactionComment;
  String? orderTypeId;
  String? orderTypeName;
  String? frIdPk;
  String? frCode;
  String? frIdFk;
  String? totalProcessingFees;

  MyOrdersModel(
      {this.ordersIdPk,
      this.memberIdFk,
      this.orderPlacedBy,
      this.orderRequestNo,
      this.ordersOrderId,
      this.ordersBillToName,
      this.ordersBillToAddress1,
      this.ordersBillToAddress2,
      this.ordersBillToCity,
      this.ordersBillToState,
      this.ordersBillToZip,
      this.ordersBillToCountry,
      this.ordersBillToTelephone,
      this.ordersBillToEmail,
      this.ordersShipToName,
      this.ordersShipToAddress1,
      this.ordersShipToAddress2,
      this.ordersShipToCity,
      this.ordersShipToState,
      this.ordersShipToZip,
      this.ordersShipToCountry,
      this.ordersShipToMobileno,
      this.points,
      this.ordersIpAddress,
      this.ordersStatus,
      this.ordersRecordDate,
      this.otp,
      this.productCode,
      this.productName,
      this.productCategory,
      this.smallImageLink,
      this.productPoints,
      this.quantity,
      this.sitePrice,
      this.baseCurrency,
      this.walletTypeName,
      this.walletName,
      this.tdsPercent,
      this.tdsPoint,
      this.bankReferenceNo,
      this.transactionComment,
      this.orderTypeId,
      this.orderTypeName,
      this.frIdPk,
      this.frCode,
      this.frIdFk,
      this.totalProcessingFees});

  MyOrdersModel.fromJson(Map<String, dynamic> json) {
    ordersIdPk = json['orders_id_pk'];
    memberIdFk = json['member_id_fk'];
    orderPlacedBy = json['order_placed_by'];
    orderRequestNo = json['order_request_no'];
    ordersOrderId = json['orders_order_id'];
    ordersBillToName = json['orders_bill_to_name'];
    ordersBillToAddress1 = json['orders_bill_to_address1'];
    ordersBillToAddress2 = json['orders_bill_to_address2'];
    ordersBillToCity = json['orders_bill_to_city'];
    ordersBillToState = json['orders_bill_to_state'];
    ordersBillToZip = json['orders_bill_to_zip'];
    ordersBillToCountry = json['orders_bill_to_country'];
    ordersBillToTelephone = json['orders_bill_to_telephone'];
    ordersBillToEmail = json['orders_bill_to_email'];
    ordersShipToName = json['orders_ship_to_name'];
    ordersShipToAddress1 = json['orders_ship_to_address1'];
    ordersShipToAddress2 = json['orders_ship_to_address2'];
    ordersShipToCity = json['orders_ship_to_city'];
    ordersShipToState = json['orders_ship_to_state'];
    ordersShipToZip = json['orders_ship_to_zip'];
    ordersShipToCountry = json['orders_ship_to_country'];
    ordersShipToMobileno = json['orders_ship_to_mobileno'];
    points = json['points'];
    ordersIpAddress = json['orders_ip_address'];
    ordersStatus = json['orders_status'];
    ordersRecordDate = json['orders_record_date'];
    otp = json['otp'];
    productCode = json['product_code'];
    productName = json['product_name'];
    productCategory = json['product_category'];
    smallImageLink = json['small_image_link'];
    productPoints = json['product_points'];
    quantity = json['quantity'];
    sitePrice = json['site_price'];
    baseCurrency = json['base_currency'];
    walletTypeName = json['wallet_type_name'];
    walletName = json['wallet_name'];
    tdsPercent = json['tds_percent'];
    tdsPoint = json['tds_point'];
    bankReferenceNo = json['bank_reference_no'];
    transactionComment = json['transaction_comment'];
    orderTypeId = json['order_type_id'];
    orderTypeName = json['order_type_name'];
    frIdPk = json['fr_id_pk'];
    frCode = json['fr_code'];
    frIdFk = json['fr_id_fk'];
    totalProcessingFees = json['total_processing_fees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id_pk'] = this.ordersIdPk;
    data['member_id_fk'] = this.memberIdFk;
    data['order_placed_by'] = this.orderPlacedBy;
    data['order_request_no'] = this.orderRequestNo;
    data['orders_order_id'] = this.ordersOrderId;
    data['orders_bill_to_name'] = this.ordersBillToName;
    data['orders_bill_to_address1'] = this.ordersBillToAddress1;
    data['orders_bill_to_address2'] = this.ordersBillToAddress2;
    data['orders_bill_to_city'] = this.ordersBillToCity;
    data['orders_bill_to_state'] = this.ordersBillToState;
    data['orders_bill_to_zip'] = this.ordersBillToZip;
    data['orders_bill_to_country'] = this.ordersBillToCountry;
    data['orders_bill_to_telephone'] = this.ordersBillToTelephone;
    data['orders_bill_to_email'] = this.ordersBillToEmail;
    data['orders_ship_to_name'] = this.ordersShipToName;
    data['orders_ship_to_address1'] = this.ordersShipToAddress1;
    data['orders_ship_to_address2'] = this.ordersShipToAddress2;
    data['orders_ship_to_city'] = this.ordersShipToCity;
    data['orders_ship_to_state'] = this.ordersShipToState;
    data['orders_ship_to_zip'] = this.ordersShipToZip;
    data['orders_ship_to_country'] = this.ordersShipToCountry;
    data['orders_ship_to_mobileno'] = this.ordersShipToMobileno;
    data['points'] = this.points;
    data['orders_ip_address'] = this.ordersIpAddress;
    data['orders_status'] = this.ordersStatus;
    data['orders_record_date'] = this.ordersRecordDate;
    data['otp'] = this.otp;
    data['product_code'] = this.productCode;
    data['product_name'] = this.productName;
    data['product_category'] = this.productCategory;
    data['small_image_link'] = this.smallImageLink;
    data['product_points'] = this.productPoints;
    data['quantity'] = this.quantity;
    data['site_price'] = this.sitePrice;
    data['base_currency'] = this.baseCurrency;
    data['wallet_type_name'] = this.walletTypeName;
    data['wallet_name'] = this.walletName;
    data['tds_percent'] = this.tdsPercent;
    data['tds_point'] = this.tdsPoint;
    data['bank_reference_no'] = this.bankReferenceNo;
    data['transaction_comment'] = this.transactionComment;
    data['order_type_id'] = this.orderTypeId;
    data['order_type_name'] = this.orderTypeName;
    data['fr_id_pk'] = this.frIdPk;
    data['fr_code'] = this.frCode;
    data['fr_id_fk'] = this.frIdFk;
    data['total_processing_fees'] = this.totalProcessingFees;
    return data;
  }
}
