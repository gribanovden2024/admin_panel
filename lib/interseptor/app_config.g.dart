// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppConfigImpl _$$AppConfigImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigImpl(
      baseUrl: json['baseUrl'] as String,
      stageUrl: json['stageUrl'] as String,
      prodUrl: json['prodUrl'] as String,
      testUrl: json['testUrl'] as String,
      proxyUrl: json['proxyUrl'] as String,
      proxyStageUrl: json['proxyStageUrl'] as String,
      proxyProdUrl: json['proxyProdUrl'] as String,
      proxyTestUrl: json['proxyTestUrl'] as String,
      config: DebugConfig.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppConfigImplToJson(_$AppConfigImpl instance) =>
    <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'stageUrl': instance.stageUrl,
      'prodUrl': instance.prodUrl,
      'testUrl': instance.testUrl,
      'proxyUrl': instance.proxyUrl,
      'proxyStageUrl': instance.proxyStageUrl,
      'proxyProdUrl': instance.proxyProdUrl,
      'proxyTestUrl': instance.proxyTestUrl,
      'config': instance.config,
    };

_$DebugConfigImpl _$$DebugConfigImplFromJson(Map<String, dynamic> json) =>
    _$DebugConfigImpl(
      debugShowMaterialGrid: json['debugShowMaterialGrid'] as bool,
      showPerformanceOverlay: json['showPerformanceOverlay'] as bool,
      checkerboardRasterCacheImages:
          json['checkerboardRasterCacheImages'] as bool,
      checkerboardOffscreenLayers: json['checkerboardOffscreenLayers'] as bool,
      showSemanticsDebugger: json['showSemanticsDebugger'] as bool,
      debugShowCheckedModeBanner: json['debugShowCheckedModeBanner'] as bool,
    );

Map<String, dynamic> _$$DebugConfigImplToJson(_$DebugConfigImpl instance) =>
    <String, dynamic>{
      'debugShowMaterialGrid': instance.debugShowMaterialGrid,
      'showPerformanceOverlay': instance.showPerformanceOverlay,
      'checkerboardRasterCacheImages': instance.checkerboardRasterCacheImages,
      'checkerboardOffscreenLayers': instance.checkerboardOffscreenLayers,
      'showSemanticsDebugger': instance.showSemanticsDebugger,
      'debugShowCheckedModeBanner': instance.debugShowCheckedModeBanner,
    };
