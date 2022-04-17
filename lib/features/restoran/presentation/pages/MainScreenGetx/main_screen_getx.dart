import 'package:fakenode_restoran_app/features/restoran/domain/entities/restoran.dart';
import 'package:fakenode_restoran_app/features/restoran/presentation/api/restoran_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreenGetx extends StatelessWidget {
  const MainScreenGetx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: RestoranApi.getRestoranlar(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Beklenmeyen bir hata oluştu..."),
              );
            } else if (snapshot.hasData) {
              List<Restoran> data = snapshot.data as List<Restoran>;
              return ListView.builder(
                  // itemCount: 2,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(data[index].restoranName),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
