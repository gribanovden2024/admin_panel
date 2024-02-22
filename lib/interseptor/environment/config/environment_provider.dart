import 'dart:async';

import 'package:admin_panel/interseptor/environment/config/environment.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnvironmentProvider extends StatefulWidget {
  const EnvironmentProvider({
    super.key,
    required this.environment,
    required this.dio,
    required this.child,
  });

  final Dio dio;
  final Environment environment;
  final Widget child;

  @override
  State<EnvironmentProvider> createState() => _EnvironmentProviderState();
}

class _EnvironmentProviderState extends State<EnvironmentProvider> {
  StreamSubscription? _configSubscription;

  @override
  void initState() {
    super.initState();
    _configSubscription = widget.environment.configStream
        .map((c) => c.baseUrl)
        .listen(_updateDioUrl);
  }

  @override
  void dispose() {
    _configSubscription?.cancel();
    super.dispose();
  }

  void _updateDioUrl(String url) {
    widget.dio.options.baseUrl = url;
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: widget.environment,
      child: StreamBuilder(
        stream: widget.environment.configStream.distinct(),
        initialData: widget.environment.config,
        builder: (context, snapshot) {
          final config = snapshot.data;

          if (config == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return KeyedSubtree(
            key: ValueKey(config),
            child: widget.child,
          );
        },
      ),
    );
  }
}
