import 'package:buy_it/data/model/product.dart';
import 'package:buy_it/services/fire_store.dart';
import 'package:flutter/material.dart';

class EditProductsPage extends StatefulWidget {
  static String id = '/edit_products_page';

  const EditProductsPage({Key key}) : super(key: key);

  @override
  _EditProductsPageState createState() => _EditProductsPageState();
}

class _EditProductsPageState extends State<EditProductsPage> {
  final _fireStore = FireStore();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: _fireStore.loadProducts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return _loadingState(height);
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return Text(snapshot.data[index].productName);
            },
            itemCount: snapshot.data.length,
          );
        },
      ),
    );
  }

  Widget _loadingState(double height) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: height * .1),
          CircularProgressIndicator(),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            'Loading...',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
