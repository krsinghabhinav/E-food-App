import 'dart:typed_data';

class ProductModel {
  String productImage;
  String productName;
  int productPrices;
  String productId;
  int productQuantity;

  ProductModel({
    this.productImage = '',
    this.productName = '',
    this.productPrices = 0,
    this.productId = '',
    this.productQuantity = 0,
  });
}
