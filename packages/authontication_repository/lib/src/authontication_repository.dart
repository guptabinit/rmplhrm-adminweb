import 'package:authontication_repository/authontication_repository.dart';
import 'package:cache/cache.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class SignInWithEmailAndPasswordFailure implements Exception {
  const SignInWithEmailAndPasswordFailure([
    this.message = 'Something went wrong',
  ]);

  factory SignInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email:':
        return const SignInWithEmailAndPasswordFailure('Invalid email address');
      case 'user-disabled':
        return const SignInWithEmailAndPasswordFailure('User is disabled');
      case 'user-not-found':
        return const SignInWithEmailAndPasswordFailure('User not found');
      case 'wrong-password':
        return const SignInWithEmailAndPasswordFailure('Wrong password');
      default:
        return const SignInWithEmailAndPasswordFailure();
    }
  }

  final String message;
}

class SignOutFailure implements Exception {}

class AuthonticationRepository {
  AuthonticationRepository({
    CacheClient? cache,
    firebase_auth.FirebaseAuth? firebaseAuth,
  })  : _cache = cache ?? CacheClient(),
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      _cache.write(key: _userCacheKey, value: user);
      return user;
    });
  }

  User get currentUser => _cache.read(key: _userCacheKey) ?? User.empty;

  Future<void> loginWithEmailAndPasswordFailure({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignInWithEmailAndPasswordFailure();
    }
  }

  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (_) {
      throw SignOutFailure();
    }
  }

  static const _userCacheKey = '__user_cache_key__';

  final CacheClient _cache;
  final firebase_auth.FirebaseAuth _firebaseAuth;
}

extension on firebase_auth.User {
  User get toUser {
    return User(
      id: uid,
      email: email,
      name: displayName,
    );
  }
}
