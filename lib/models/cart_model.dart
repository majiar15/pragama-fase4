class CartModel {
    List<ProductCartModel> products;

    CartModel({
        required this.products,
    });
}

class ProductCartModel {
  int productId;
  String title;
  double price;
  String image;
  int quantity;

  ProductCartModel({
    required this.productId,
    required this.title,
    required this.price,
    required this.image,
    this.quantity = 1,
  });
}
