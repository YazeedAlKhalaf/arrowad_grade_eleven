// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:arrowad_grade_eleven/src/app/services/auth_service.dart' as _i3;
import 'package:arrowad_grade_eleven/src/app/services/firebase_messaging_service.dart'
    as _i4;
import 'package:arrowad_grade_eleven/src/app/services/firebase_service.dart'
    as _i5;
import 'package:arrowad_grade_eleven/src/app/services/firestorage_service.dart'
    as _i6;
import 'package:arrowad_grade_eleven/src/app/services/firestore_service.dart'
    as _i7;
import 'package:arrowad_grade_eleven/src/app/services/router_service.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt initLocator({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AuthService>(() => _i3.AuthService());
    gh.lazySingleton<_i4.FirebaseMessagingService>(
        () => _i4.FirebaseMessagingService());
    gh.lazySingleton<_i5.FirebaseService>(() => _i5.FirebaseService());
    gh.lazySingleton<_i6.FirestorageService>(() => _i6.FirestorageService());
    gh.lazySingleton<_i7.FirestoreService>(() => _i7.FirestoreService());
    gh.lazySingleton<_i8.RouterService>(() => _i8.RouterService());
    return this;
  }
}
