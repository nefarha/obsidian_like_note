import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'folder_model.freezed.dart';
part 'folder_model.g.dart';

@freezed
abstract class FolderModel with _$FolderModel {
  @HiveType(typeId: 0, adapterName: 'FolderAdapter')
  const factory FolderModel({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required DateTime dateTime,
  }) = _FolderModel;

  factory FolderModel.fromJson(Map<String, dynamic> json) =>
      _$FolderModelFromJson(json);
}
