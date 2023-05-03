import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StateLogger extends ProviderObserver {
  const StateLogger();
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint('''
      {
            provider: ${provider.name ?? provider.runtimeType},
            oldValue: $previousValue,
            newValue: $newValue
      }
              ''');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }
}
