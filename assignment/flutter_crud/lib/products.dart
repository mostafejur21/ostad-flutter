class Products {
  final String id,
      productName,
      productsCode,
      image,
      unitPrice,
      totalPrice,
      createdAt,
      quantity;

  Products(this.id, this.productName, this.productsCode, this.createdAt,
      this.image, this.unitPrice, this.totalPrice, this.quantity);

  factory Products.toJson(Map<String, dynamic> e) {
    return Products(
      e["_id"],
      e['ProductName'],
      e['ProductCode'],
      e['UnitPrice'],
      e['Img'],
      e['TotalPrice'],
      e['CreatedDate'],
      e['Qty'],
    );
  }
}
