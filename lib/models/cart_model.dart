class CartItem {
  final String id; // Add this line
  final String itemName;
  final int quantity;
  final String itemPrice;
  final String itemImagePath;

  CartItem({
    required this.id, // Add this line
    required this.itemName,
    required this.quantity,
    required this.itemPrice,
    required this.itemImagePath,
  });
}
