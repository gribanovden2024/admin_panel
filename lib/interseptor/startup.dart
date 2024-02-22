import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'environment.dart';

class StartUpWidget extends StatelessWidget {
  const StartUpWidget({
    super.key,
    required this.container,
    required this.environment,
    required this.child,
  });

  final GetIt container;
  final Environment environment;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StartUpDomains(
      container: container,
      child: EnvironmentProvider(
        environment: environment,
        dio: container.get(),
        child: StartUpWidgetConfig(child: child),
      ),
    );
  }
}
class StartUpDomains extends StatelessWidget {
  const StartUpDomains({
    required this.child,
    super.key,
    required this.container,
  });

  final GetIt container;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => container,
      child: child,
    );
  }
}
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
class StartUpWidgetConfig extends StatelessWidget {
  const StartUpWidgetConfig({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
