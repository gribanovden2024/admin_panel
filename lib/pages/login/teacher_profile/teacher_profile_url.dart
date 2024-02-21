abstract class TeacherProfileUrl {
  static const freeToken = '/auth/token/free';

  static const emailPart1 = '/auth/email/part1';
  static const emailPart2 = '/auth/email/part2';
  static const teacherInfo = '/auth/teacher_info/';
  static const user = '/auth/user';
}

abstract class ProfileUrl {
  static const user = '/auth/user';
  static const freeToken = '/auth/token/free';
  static const refreshToken = '/auth/token/refresh';
  static const v1FreeToken = '/auth/v1/token/free';
  static const changePhone = '/auth/change_phone/';
  static const changePhoneConfirm = '/auth/confirm_change_phone/';
  static const passwordLogin = '/auth/login';
  static const studentProfile = '/student/student_profile/';
  static const studentRating = '/student/student_rating/';
  static const acceptPolitics = '/student/accept_politic/';
}
