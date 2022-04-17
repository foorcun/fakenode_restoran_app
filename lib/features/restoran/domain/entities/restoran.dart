import 'dart:convert';

// {
//   "id":1,
//   "restoranName":"Kedi Cafe",
//   "olusturan": "foorcun",
//   "imgUrl":"assets/images/cat_cafe.png"
// }

class Restoran {
  // filed variabllerl gir ve generate class members
  late int id;
  late String restoranName;
  // late String olusturanName;
  // late String imgUrl;

  Restoran({
    required this.id,
    required this.restoranName,
  });
}
