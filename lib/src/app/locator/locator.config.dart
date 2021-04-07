// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../services/auth_service.dart' as _i3;
import '../services/firebase_messaging_service.dart' as _i4;
import '../services/firebase_service.dart' as _i5;
import '../services/firestorage_service.dart' as _i6;
import '../services/firestore_service.dart' as _i7;
import '../services/router_service.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initLocator(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AuthService>(() => _i3.AuthService());
  gh.lazySingleton<_i4.FirebaseMessagingService>(
      () => _i4.FirebaseMessagingService());
  gh.lazySingleton<_i5.FirebaseService>(() => _i5.FirebaseService());
  gh.lazySingleton<_i6.FirestorageService>(() => _i6.FirestorageService());
  gh.lazySingleton<_i7.FirestoreService>(() => _i7.FirestoreService());
  gh.lazySingleton<_i8.RouterService>(() => _i8.RouterService());
  return get;
}
