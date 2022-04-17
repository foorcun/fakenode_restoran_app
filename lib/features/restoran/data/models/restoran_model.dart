import 'package:fakenode_restoran_app/features/restoran/domain/entities/restoran.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restoran_model.g.dart';

@JsonSerializable()
class RestoranModel extends Restoran {
  RestoranModel({int? id, String? restoranName})
      : super(id: id, restoranName: restoranName);

  Map<String, dynamic> toJson() => _$RestoranModelToJson(this);

  factory RestoranModel.fromJson(Map<String, dynamic> json) =>
      _$RestoranModelFromJson(json);
}
