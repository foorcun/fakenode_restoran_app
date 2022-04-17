import 'package:fakenode_restoran_app/core/utils/json_helper.dart';
import 'package:fakenode_restoran_app/features/restoran/data/models/restoran_model.dart';
import 'package:fakenode_restoran_app/features/restoran/domain/entities/restoran.dart';
import 'package:http/http.dart' as http;

class RestoranService {
  Uri theUri = Uri.parse("http://127.0.0.1:3000/restoranlar");

  Future<List<Restoran>> getAllRestoran() async {
    print("RestoranService getAll");

    Uri myUri = Uri.parse("http://127.0.0.1:3000/restoranlar");

    http.Response response = await http.get(myUri);

    List listJson = JsonHelper.convertResponseToList(response.body);
    //print("json list length " + listJson.length.toString());
    //print(listJson[0].toString());
    List<RestoranModel> theList = [];
    for (var i = 0; i < listJson.length; i++) {
      theList.add(RestoranModel.fromJson(listJson[i]));
    }
    print("RestoranService theList " + theList.toString());
    return theList;
  }

  Future<void> addRestoran(Restoran r) async {
    var response = await http.post(theUri, body: {
      "restoranName": r.restoranName,
    });
    // print(response.body);
  }
}
