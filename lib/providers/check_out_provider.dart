import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoteteee/message/toastmesss.dart';
import 'package:demoteteee/models/deliveryAddressModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../View/screen/check_out/delivery_details/add_delivery_address/add_delivery_adderss.dart';

class CheckOutProvider with ChangeNotifier {
  DeliveryAddressModel deliveryAddressModel = DeliveryAddressModel();

  bool isLoading = false;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController altMobileNo = TextEditingController();
  TextEditingController society = TextEditingController();
  TextEditingController streem = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController pincode = TextEditingController();
  LocationData? setLocation;

  void validator(BuildContext context, myType) async {
    print("setlocation-------------------->>>  ${setLocation}");
    if (firstName.text.isEmpty) {
      ToastUtil.showError("First name is empty");
    } else if (lastName.text.isEmpty) {
      ToastUtil.showError("Last name is empty");
    } else if (mobileNo.text.isEmpty) {
      ToastUtil.showError("Mobile number is empty");
    } else if (altMobileNo.text.isEmpty) {
      ToastUtil.showError("Alternative mobile number is empty");
    } else if (society.text.isEmpty) {
      ToastUtil.showError("Society is empty");
    } else if (streem.text.isEmpty) {
      ToastUtil.showError("Street is empty");
    } else if (landmark.text.isEmpty) {
      ToastUtil.showError("Landmark is empty");
    } else if (city.text.isEmpty) {
      ToastUtil.showError("City is empty");
    } else if (area.text.isEmpty) {
      ToastUtil.showError("Area is empty");
    } else if (pincode.text.isEmpty) {
      ToastUtil.showError("PinCode is empty");
    } else if (setLocation == null) {
      ToastUtil.showError("setLocation is empty");
    } else {
      isLoading = true;
      notifyListeners();

      // Mapping the enum to a string for Firestore
      String addressTypeStr;
      if (myType == AddressType.Home) {
        addressTypeStr = "Home";
      } else if (myType == AddressType.Work) {
        addressTypeStr = "Work";
      } else {
        addressTypeStr = "Other";
      }

      await FirebaseFirestore.instance
          .collection("AddDeliveryAdddress")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "firstName": firstName.text,
        "lastName": lastName.text,
        "mobileNo": mobileNo.text,
        "altMobileNo": altMobileNo.text,
        "society": society.text,
        "streem": streem.text,
        "landmark": landmark.text,
        "city": city.text,
        "area": area.text,
        "pincode": pincode.text,
        "addressType": addressTypeStr,
        "longitude": setLocation!.longitude,
        "latitude": setLocation!.latitude,
      }).then((_) {
        isLoading = false;
        notifyListeners();
        ToastUtil.showSuccess("Delivery Address added");
        Get.back();
      }).catchError((error) {
        isLoading = false;
        notifyListeners();
        ToastUtil.showError("Failed to add address: $error");
      });
    }
  }

/////////////////////get address deails////////////////////////////////////
  List<DeliveryAddressModel> deliveryModelDatalsit = [];
  getDeliveryAddressData() async {
    List<DeliveryAddressModel> newDeliveryList = [];
    DocumentSnapshot addressDB = await FirebaseFirestore.instance
        .collection("AddDeliveryAdddress")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (addressDB.exists) {
      deliveryAddressModel = DeliveryAddressModel(
        firstName: addressDB.get("firstName"),
        lastName: addressDB.get("lastName"),
        mobileNo: addressDB.get("mobileNo"),
        altMobileNo: addressDB.get("altMobileNo"),
        society: addressDB.get("society"),
        streem: addressDB.get("streem"),
        landmark: addressDB.get("landmark"),
        city: addressDB.get("city"),
        area: addressDB.get("area"),
        pincode: addressDB.get("pincode"),
      );
      newDeliveryList.add(deliveryAddressModel);
      notifyListeners();
    }
    deliveryModelDatalsit = newDeliveryList;
    notifyListeners();
  }

  List<DeliveryAddressModel> get getDatalstDeliveryAddress {
    return deliveryModelDatalsit;
  }
}
