// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:admin_panel/interseptor/environment/event_bus/event_bus.dart'
    as _i4;
import 'package:admin_panel/interseptor/profile/teacher_profile/data/teacher_profile_repository.dart'
    as _i9;
import 'package:admin_panel/interseptor/profile/teacher_profile/teacher_profile_manager.dart'
    as _i8;
import 'package:admin_panel/interseptor/profile/user_data.dart' as _i6;
import 'package:admin_panel/interseptor/profile_manager.dart' as _i5;
import 'package:admin_panel/interseptor/profile_repository.dart' as _i7;
import 'package:admin_panel/interseptor/register_modules.dart' as _i10;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    gh.singleton<_i3.Dio>(registerModules.dio);
    gh.singleton<_i4.IEventBus>(registerModules.eventBus);
    gh.singleton<_i5.IProfile<_i6.UserData>>(registerModules.profile);
    gh.singleton<_i7.IProfileRepository<_i6.UserData>>(
        registerModules.profileRepository);
    gh.singleton<_i8.TeacherProfileManager>(
        registerModules.teacherProfileManager);
    gh.singleton<_i9.TeacherProfileRepository>(
        registerModules.teacherProfileRepository);
    return this;
  }
}

class _$RegisterModules extends _i10.RegisterModules {}
