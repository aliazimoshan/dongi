// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExpenseState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExpenseInitState value) init,
    required TResult Function(ExpenseLoadingState value) loading,
    required TResult Function(ExpenseLoadedState value) loaded,
    required TResult Function(ExpenseErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExpenseInitState value)? init,
    TResult? Function(ExpenseLoadingState value)? loading,
    TResult? Function(ExpenseLoadedState value)? loaded,
    TResult? Function(ExpenseErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExpenseInitState value)? init,
    TResult Function(ExpenseLoadingState value)? loading,
    TResult Function(ExpenseLoadedState value)? loaded,
    TResult Function(ExpenseErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseStateCopyWith<$Res> {
  factory $ExpenseStateCopyWith(
          ExpenseState value, $Res Function(ExpenseState) then) =
      _$ExpenseStateCopyWithImpl<$Res, ExpenseState>;
}

/// @nodoc
class _$ExpenseStateCopyWithImpl<$Res, $Val extends ExpenseState>
    implements $ExpenseStateCopyWith<$Res> {
  _$ExpenseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ExpenseInitStateCopyWith<$Res> {
  factory _$$ExpenseInitStateCopyWith(
          _$ExpenseInitState value, $Res Function(_$ExpenseInitState) then) =
      __$$ExpenseInitStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExpenseInitStateCopyWithImpl<$Res>
    extends _$ExpenseStateCopyWithImpl<$Res, _$ExpenseInitState>
    implements _$$ExpenseInitStateCopyWith<$Res> {
  __$$ExpenseInitStateCopyWithImpl(
      _$ExpenseInitState _value, $Res Function(_$ExpenseInitState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ExpenseInitState implements ExpenseInitState {
  const _$ExpenseInitState();

  @override
  String toString() {
    return 'ExpenseState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExpenseInitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
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
    required TResult Function(ExpenseInitState value) init,
    required TResult Function(ExpenseLoadingState value) loading,
    required TResult Function(ExpenseLoadedState value) loaded,
    required TResult Function(ExpenseErrorState value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExpenseInitState value)? init,
    TResult? Function(ExpenseLoadingState value)? loading,
    TResult? Function(ExpenseLoadedState value)? loaded,
    TResult? Function(ExpenseErrorState value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExpenseInitState value)? init,
    TResult Function(ExpenseLoadingState value)? loading,
    TResult Function(ExpenseLoadedState value)? loaded,
    TResult Function(ExpenseErrorState value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class ExpenseInitState implements ExpenseState {
  const factory ExpenseInitState() = _$ExpenseInitState;
}

/// @nodoc
abstract class _$$ExpenseLoadingStateCopyWith<$Res> {
  factory _$$ExpenseLoadingStateCopyWith(_$ExpenseLoadingState value,
          $Res Function(_$ExpenseLoadingState) then) =
      __$$ExpenseLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExpenseLoadingStateCopyWithImpl<$Res>
    extends _$ExpenseStateCopyWithImpl<$Res, _$ExpenseLoadingState>
    implements _$$ExpenseLoadingStateCopyWith<$Res> {
  __$$ExpenseLoadingStateCopyWithImpl(
      _$ExpenseLoadingState _value, $Res Function(_$ExpenseLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ExpenseLoadingState implements ExpenseLoadingState {
  const _$ExpenseLoadingState();

  @override
  String toString() {
    return 'ExpenseState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExpenseLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExpenseInitState value) init,
    required TResult Function(ExpenseLoadingState value) loading,
    required TResult Function(ExpenseLoadedState value) loaded,
    required TResult Function(ExpenseErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExpenseInitState value)? init,
    TResult? Function(ExpenseLoadingState value)? loading,
    TResult? Function(ExpenseLoadedState value)? loaded,
    TResult? Function(ExpenseErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExpenseInitState value)? init,
    TResult Function(ExpenseLoadingState value)? loading,
    TResult Function(ExpenseLoadedState value)? loaded,
    TResult Function(ExpenseErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ExpenseLoadingState implements ExpenseState {
  const factory ExpenseLoadingState() = _$ExpenseLoadingState;
}

/// @nodoc
abstract class _$$ExpenseLoadedStateCopyWith<$Res> {
  factory _$$ExpenseLoadedStateCopyWith(_$ExpenseLoadedState value,
          $Res Function(_$ExpenseLoadedState) then) =
      __$$ExpenseLoadedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExpenseLoadedStateCopyWithImpl<$Res>
    extends _$ExpenseStateCopyWithImpl<$Res, _$ExpenseLoadedState>
    implements _$$ExpenseLoadedStateCopyWith<$Res> {
  __$$ExpenseLoadedStateCopyWithImpl(
      _$ExpenseLoadedState _value, $Res Function(_$ExpenseLoadedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ExpenseLoadedState implements ExpenseLoadedState {
  const _$ExpenseLoadedState();

  @override
  String toString() {
    return 'ExpenseState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExpenseLoadedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
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
    required TResult Function(ExpenseInitState value) init,
    required TResult Function(ExpenseLoadingState value) loading,
    required TResult Function(ExpenseLoadedState value) loaded,
    required TResult Function(ExpenseErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExpenseInitState value)? init,
    TResult? Function(ExpenseLoadingState value)? loading,
    TResult? Function(ExpenseLoadedState value)? loaded,
    TResult? Function(ExpenseErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExpenseInitState value)? init,
    TResult Function(ExpenseLoadingState value)? loading,
    TResult Function(ExpenseLoadedState value)? loaded,
    TResult Function(ExpenseErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ExpenseLoadedState implements ExpenseState {
  const factory ExpenseLoadedState() = _$ExpenseLoadedState;
}

/// @nodoc
abstract class _$$ExpenseErrorStateCopyWith<$Res> {
  factory _$$ExpenseErrorStateCopyWith(
          _$ExpenseErrorState value, $Res Function(_$ExpenseErrorState) then) =
      __$$ExpenseErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ExpenseErrorStateCopyWithImpl<$Res>
    extends _$ExpenseStateCopyWithImpl<$Res, _$ExpenseErrorState>
    implements _$$ExpenseErrorStateCopyWith<$Res> {
  __$$ExpenseErrorStateCopyWithImpl(
      _$ExpenseErrorState _value, $Res Function(_$ExpenseErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ExpenseErrorState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ExpenseErrorState implements ExpenseErrorState {
  const _$ExpenseErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ExpenseState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseErrorStateCopyWith<_$ExpenseErrorState> get copyWith =>
      __$$ExpenseErrorStateCopyWithImpl<_$ExpenseErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
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
    required TResult Function(ExpenseInitState value) init,
    required TResult Function(ExpenseLoadingState value) loading,
    required TResult Function(ExpenseLoadedState value) loaded,
    required TResult Function(ExpenseErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExpenseInitState value)? init,
    TResult? Function(ExpenseLoadingState value)? loading,
    TResult? Function(ExpenseLoadedState value)? loaded,
    TResult? Function(ExpenseErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExpenseInitState value)? init,
    TResult Function(ExpenseLoadingState value)? loading,
    TResult Function(ExpenseLoadedState value)? loaded,
    TResult Function(ExpenseErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ExpenseErrorState implements ExpenseState {
  const factory ExpenseErrorState(final String message) = _$ExpenseErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$ExpenseErrorStateCopyWith<_$ExpenseErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
