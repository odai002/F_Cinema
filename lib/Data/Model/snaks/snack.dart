class SnackItem {
  final String id;       // 👈 هذا المعرف الفريد
  final String name;
  final String category;
  final String image;
  final double price;

  SnackItem({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
  });

  // لو بتجيب البيانات من JSON (مثلاً API أو Firebase)
  factory SnackItem.fromJson(Map<String, dynamic> json, String id) {
    return SnackItem(
      id: id,
      name: json["name"],
      category: json["category"],
      price: (json["price"] as num).toDouble(),
      image: json["image"],
    );
  }

  // عشان ترسله كـ Map (مثلاً تحفظه في DB)
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "category": category,
      "price": price,
      "image": image,
    };
  }
}
