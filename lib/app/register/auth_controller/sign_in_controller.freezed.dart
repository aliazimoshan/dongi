// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isGoogle) loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool isGoogle)? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isGoogle)? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInInitState value) init,
    required TResult Function(SignInLoadingState value) loading,
    required TResult Function(SignInLoadedState value) loaded,
    required TResult Function(SignInErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInInitState value)? init,
    TResult? Function(SignInLoadingState value)? loading,
    TResult? Function(SignInLoadedState value)? loaded,
    TResult? Function(SignInErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitState value)? init,
    TResult Function(SignInLoadingState value)? loading,
    TResult Function(SignInLoadedState value)? loaded,
    TResult Function(SignInErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res, SignInState>;
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res, $Val extends SignInState>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SignInInitStateCopyWith<$Res> {
  factory _$$SignInInitStateCopyWith(
          _$SignInInitState value, $Res Function(_$SignInInitState) then) =
      __$$SignInInitStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInInitStateCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInInitState>
    implements _$$SignInInitStateCopyWith<$Res> {
  __$$SignInInitStateCopyWithImpl(
      _$SignInInitState _value, $Res Function(_$SignInInitState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignInInitState implements SignInInitState {
  const _$SignInInitState();

  @override
  String toString() {
    return 'SignInState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInInitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isGoogle) loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool isGoogle)? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isGoogle)? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInInitState value) init,
    required TResult Function(SignInLoadingState value) loading,
    required TResult Function(SignInLoadedState value) loaded,
    required TResult Function(SignInErrorState value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInInitState value)? init,
    TResult? Function(SignInLoadingState value)? loading,
    TResult? Function(SignInLoadedState value)? loaded,
    TResult? Function(SignInErrorState value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitState value)? init,
    TResult Function(SignInLoadingState value)? loading,
    TResult Function(SignInLoadedState value)? loaded,
    TResult Function(SignInErrorState value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class SignInInitState implements SignInState {
  const factory SignInInitState() = _$SignInInitState;
}

/// @nodoc
abstract class _$$SignInLoadingStateCopyWith<$Res> {
  factory _$$SignInLoadingStateCopyWith(_$SignInLoadingState value,
          $Res Function(_$SignInLoadingState) then) =
      __$$SignInLoadingStateCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isGoogle});
}

/// @nodoc
class __$$SignInLoadingStateCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInLoadingState>
    implements _$$SignInLoadingStateCopyWith<$Res> {
  __$$SignInLoadingStateCopyWithImpl(
      _$SignInLoadingState _value, $Res Function(_$SignInLoadingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isGoogle = null,
  }) {
    return _then(_$SignInLoadingState(
      isGoogle: null == isGoogle
          ? _value.isGoogle
          : isGoogle // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SignInLoadingState implements SignInLoadingState {
  const _$SignInLoadingState({this.isGoogle = false});

  @override
  @JsonKey()
  final bool isGoogle;

  @override
  String toString() {
    return 'SignInState.loading(isGoogle: $isGoogle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInLoadingState &&
            (identical(other.isGoogle, isGoogle) ||
                other.isGoogle == isGoogle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isGoogle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInLoadingStateCopyWith<_$SignInLoadingState> get copyWith =>
      __$$SignInLoadingStateCopyWithImpl<_$SignInLoadingState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isGoogle) loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return loading(isGoogle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool isGoogle)? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call(isGoogle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isGoogle)? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(isGoogle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInInitState value) init,
    required TResult Function(SignInLoadingState value) loading,
    required TResult Function(SignInLoadedState value) loaded,
    required TResult Function(SignInErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInInitState value)? init,
    TResult? Function(SignInLoadingState value)? loading,
    TResult? Function(SignInLoadedState value)? loaded,
    TResult? Function(SignInErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitState value)? init,
    TResult Function(SignInLoadingState value)? loading,
    TResult Function(SignInLoadedState value)? loaded,
    TResult Function(SignInErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SignInLoadingState implements SignInState {
  const factory SignInLoadingState({final bool isGoogle}) =
      _$SignInLoadingState;

  bool get isGoogle;
  @JsonKey(ignore: true)
  _$$SignInLoadingStateCopyWith<_$SignInLoadingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInLoadedStateCopyWith<$Res> {
  factory _$$SignInLoadedStateCopyWith(
          _$SignInLoadedState value, $Res Function(_$SignInLoadedState) then) =
      __$$SignInLoadedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInLoadedStateCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInLoadedState>
    implements _$$SignInLoadedStateCopyWith<$Res> {
  __$$SignInLoadedStateCopyWithImpl(
      _$SignInLoadedState _value, $Res Function(_$SignInLoadedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignInLoadedState implements SignInLoadedState {
  const _$SignInLoadedState();

  @override
  String toString() {
    return 'SignInState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInLoadedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isGoogle) loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool isGoogle)? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isGoogle)? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInInitState value) init,
    required TResult Function(SignInLoadingState value) loading,
    required TResult Function(SignInLoadedState value) loaded,
    required TResult Function(SignInErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInInitState value)? init,
    TResult? Function(SignInLoadingState value)? loading,
    TResult? Function(SignInLoadedState value)? loaded,
    TResult? Function(SignInErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitState value)? init,
    TResult Function(SignInLoadingState value)? loading,
    TResult Function(SignInLoadedState value)? loaded,
    TResult Function(SignInErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SignInLoadedState implements SignInState {
  const factory SignInLoadedState() = _$SignInLoadedState;
}

/// @nodoc
abstract class _$$SignInErrorStateCopyWith<$Res> {
  factory _$$SignInErrorStateCopyWith(
          _$SignInErrorState value, $Res Function(_$SignInErrorState) then) =
      __$$SignInErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SignInErrorStateCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInErrorState>
    implements _$$SignInErrorStateCopyWith<$Res> {
  __$$SignInErrorStateCopyWithImpl(
      _$SignInErrorState _value, $Res Function(_$SignInErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SignInErrorState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInErrorState implements SignInErrorState {
  const _$SignInErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SignInState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInErrorStateCopyWith<_$SignInErrorState> get copyWith =>
      __$$SignInErrorStateCopyWithImpl<_$SignInErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isGoogle) loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool isGoogle)? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isGoogle)? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInInitState value) init,
    required TResult Function(SignInLoadingState value) loading,
    required TResult Function(SignInLoadedState value) loaded,
    required TResult Function(SignInErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInInitState value)? init,
    TResult? Function(SignInLoadingState value)? loading,
    TResult? Function(SignInLoadedState value)? loaded,
    TResult? Function(SignInErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitState value)? init,
    TResult Function(SignInLoadingState value)? loading,
    TResult Function(SignInLoadedState value)? loaded,
    TResult Function(SignInErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SignInErrorState implements SignInState {
  const factory SignInErrorState(final String message) = _$SignInErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$SignInErrorStateCopyWith<_$SignInErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
