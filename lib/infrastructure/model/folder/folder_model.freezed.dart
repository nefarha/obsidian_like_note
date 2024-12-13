// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FolderModel _$FolderModelFromJson(Map<String, dynamic> json) {
  return _FolderModel.fromJson(json);
}

/// @nodoc
mixin _$FolderModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get dateTime => throw _privateConstructorUsedError;

  /// Serializes this FolderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FolderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FolderModelCopyWith<FolderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderModelCopyWith<$Res> {
  factory $FolderModelCopyWith(
          FolderModel value, $Res Function(FolderModel) then) =
      _$FolderModelCopyWithImpl<$Res, FolderModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String dateTime});
}

/// @nodoc
class _$FolderModelCopyWithImpl<$Res, $Val extends FolderModel>
    implements $FolderModelCopyWith<$Res> {
  _$FolderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FolderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FolderModelImplCopyWith<$Res>
    implements $FolderModelCopyWith<$Res> {
  factory _$$FolderModelImplCopyWith(
          _$FolderModelImpl value, $Res Function(_$FolderModelImpl) then) =
      __$$FolderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String dateTime});
}

/// @nodoc
class __$$FolderModelImplCopyWithImpl<$Res>
    extends _$FolderModelCopyWithImpl<$Res, _$FolderModelImpl>
    implements _$$FolderModelImplCopyWith<$Res> {
  __$$FolderModelImplCopyWithImpl(
      _$FolderModelImpl _value, $Res Function(_$FolderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FolderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dateTime = null,
  }) {
    return _then(_$FolderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0)
class _$FolderModelImpl implements _FolderModel {
  const _$FolderModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.dateTime});

  factory _$FolderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FolderModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String dateTime;

  @override
  String toString() {
    return 'FolderModel(id: $id, name: $name, dateTime: $dateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, dateTime);

  /// Create a copy of FolderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FolderModelImplCopyWith<_$FolderModelImpl> get copyWith =>
      __$$FolderModelImplCopyWithImpl<_$FolderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FolderModelImplToJson(
      this,
    );
  }
}

abstract class _FolderModel implements FolderModel {
  const factory _FolderModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String dateTime}) = _$FolderModelImpl;

  factory _FolderModel.fromJson(Map<String, dynamic> json) =
      _$FolderModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get dateTime;

  /// Create a copy of FolderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FolderModelImplCopyWith<_$FolderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
