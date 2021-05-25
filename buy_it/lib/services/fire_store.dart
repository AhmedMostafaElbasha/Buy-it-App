import 'package:buy_it/data/model/product.dart';
import 'package:buy_it/firestore_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void addProduct(Product product) {
    _firestore.collection(storeProductCategory).add(
      {
        storeProductName: product.productName,
        storeProductPrice: product.productPrice,
        storeProductDescription: product.productDescription,
        storeProductCategory: product.productCategory,
        storeProductImagePath: product.productImagePath,
      },
    );
  }

  Future<List<Product>> loadProducts() async {
    var snapshot = await _firestore.collection(storeProductCategory).get();
    List<Product> _products = [];

    for (var document in snapshot.docs) {
      var data = document.data();

      _products.add(
        Product(
          productName: data[storeProductName],
          productPrice: data[storeProductPrice],
          productDescription: data[storeProductDescription],
          productCategory: data[storeProductCategory],
          productImagePath: data[storeProductImagePath],
        ),
      );
    }
    return _products;
  }
}
