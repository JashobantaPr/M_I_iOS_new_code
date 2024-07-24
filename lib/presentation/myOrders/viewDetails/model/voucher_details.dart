class VoucherDetailsModel {

  Order? order;
  Vouchers? vouchers;

  VoucherDetailsModel({this.order, this.vouchers});

  VoucherDetailsModel.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    vouchers = json['vouchers'] != null
        ? new Vouchers.fromJson(json['vouchers'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    if (this.vouchers != null) {
      data['vouchers'] = this.vouchers!.toJson();
    }
    return data;
  }
}

class Order {
  String? productCode;
  String? productName;
  String? descr;
  String? ordersOrderId;
  String? tolClientName;

  Order(
      {this.productCode,
      this.productName,
      this.descr,
      this.ordersOrderId,
      this.tolClientName});

  Order.fromJson(Map<String, dynamic> json) {
    productCode = json['product_code'];
    productName = json['product_name'];
    descr = json['descr'];
    ordersOrderId = json['orders_order_id'];
    tolClientName = json['tol_client_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_code'] = this.productCode;
    data['product_name'] = this.productName;
    data['descr'] = this.descr;
    data['orders_order_id'] = this.ordersOrderId;
    data['tol_client_name'] = this.tolClientName;
    return data;
  }
}

class Vouchers {
  String? status;
  String? referenceNumber;
  String? companyName;
  List<EvDetails>? evDetails;

  Vouchers(
      {this.status, this.referenceNumber, this.companyName, this.evDetails});

  Vouchers.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    referenceNumber = json['reference_number'];
    companyName = json['company_name'];
    if (json['ev_details'] != null) {
      evDetails = <EvDetails>[];
      json['ev_details'].forEach((v) {
        evDetails!.add(new EvDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['reference_number'] = this.referenceNumber;
    data['company_name'] = this.companyName;
    if (this.evDetails != null) {
      data['ev_details'] = this.evDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EvDetails {
  String? evoucherKey;
  String? validityDate;
  String? pin;
  String? ucrNumber;

  EvDetails({this.evoucherKey, this.validityDate, this.pin, this.ucrNumber});

  EvDetails.fromJson(Map<String, dynamic> json) {
    evoucherKey = json['evoucher_key'];
    validityDate = json['validity_date'];
    pin = json['pin'];
    ucrNumber = json['ucr_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['evoucher_key'] = this.evoucherKey;
    data['validity_date'] = this.validityDate;
    data['pin'] = this.pin;
    data['ucr_number'] = this.ucrNumber;
    return data;
  }
}
