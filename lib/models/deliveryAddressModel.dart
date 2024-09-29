class DeliveryAddressModel {
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? altMobileNo;
  String? society;
  String? streem;
  String? landmark;
  String? city;
  String? area;
  String? pincode;
  String? addressTypeStr;

  DeliveryAddressModel(
      {this.firstName,
      this.lastName,
      this.addressTypeStr,
      this.altMobileNo,
      this.area,
      this.city,
      this.landmark,
      this.mobileNo,
      this.pincode,
      this.society,
      this.streem});
}
