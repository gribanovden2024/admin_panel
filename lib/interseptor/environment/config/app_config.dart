import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

@freezed
class AppConfig with _$AppConfig {
  factory AppConfig({
    required String baseUrl,
    required String stageUrl,
    required String prodUrl,
    required String testUrl,
    required String proxyUrl,
    required String proxyStageUrl,
    required String proxyProdUrl,
    required String proxyTestUrl,
    required DebugConfig config,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}

@freezed
class DebugConfig with _$DebugConfig {
  factory DebugConfig({
    required bool debugShowMaterialGrid,
    required bool showPerformanceOverlay,
    required bool checkerboardRasterCacheImages,
    required bool checkerboardOffscreenLayers,
    required bool showSemanticsDebugger,
    required bool debugShowCheckedModeBanner,
  }) = _DebugConfig;

  factory DebugConfig.fromJson(Map<String, dynamic> json) =>
      _$DebugConfigFromJson(json);
}
