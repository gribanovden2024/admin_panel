
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';


abstract class IUserData {
  IUserData({
    this.userId,
  });

  final String? userId;
}

@freezed
class UserData extends IUserData with _$UserData {
  factory UserData({
    String? userId,
    String? name,
    int? group,
    int? subGroup,
    int? course,
    bool? acceptPolitics,

  }) = _UserData;
}
