class Item {
  late final String id;
  late final String name;
  late final String desc;
  late final num price;
  late final String color;
  late final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

final product = [
  Item(
      id: "Codepur001",
      name: "iPhone 12 Pro",
      desc: "Apple iPhone 12th generation",
      price: 999,
      color: "#33505a",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc"),
];
