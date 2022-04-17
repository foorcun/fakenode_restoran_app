import 'package:fakenode_restoran_app/core/utils/json_helper.dart';
import 'package:fakenode_restoran_app/features/restoran/data/models/restoran_model.dart';
import 'package:http/http.dart' as http;
// import '../core/utils/json_helper.dart';

class RestoranApi {
  static Future getRestoranlar() async {
    // Uri myUri = Uri.parse("http://localhost:3000/categories");

    // Uri myUri = Uri.parse("http://10.0.2.2:3000/categories");

    Uri myUri = Uri.parse("http://127.0.0.1:3000/restoranlar");

    http.Response response = await http.get(myUri);

    List listJson = JsonHelper.convertResponseToList(response.body);

    print("json list length " + listJson.length.toString());

    print(listJson[0].toString());

    List<RestoranModel> entityList = [];

    for (var i = 0; i < listJson.length; i++) {
      entityList.add(RestoranModel.fromJson(listJson[i]));

      print("asdf");
    }

    return entityList;

    //return http.get(myUri);
  }
}
