/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/connectivity.svg
  String get connectivity => 'assets/icons/connectivity.svg';

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/info-circle.png
  AssetGenImage get infoCircle =>
      const AssetGenImage('assets/icons/info-circle.png');

  /// File path: assets/icons/key.png
  AssetGenImage get key => const AssetGenImage('assets/icons/key.png');

  /// File path: assets/icons/lock.png
  AssetGenImage get lock => const AssetGenImage('assets/icons/lock.png');

  /// File path: assets/icons/logout.png
  AssetGenImage get logout => const AssetGenImage('assets/icons/logout.png');

  /// File path: assets/icons/memory.svg
  String get memory => 'assets/icons/memory.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// File path: assets/icons/tools.svg
  String get tools => 'assets/icons/tools.svg';

  /// List of all assets
  List<dynamic> get values => [
    connectivity,
    home,
    infoCircle,
    key,
    lock,
    logout,
    memory,
    profile,
    tools,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/common
  $AssetsImagesCommonGen get common => const $AssetsImagesCommonGen();
}

class $AssetsLogosGen {
  const $AssetsLogosGen();

  /// File path: assets/logos/appLogo.png
  AssetGenImage get appLogo => const AssetGenImage('assets/logos/appLogo.png');

  /// List of all assets
  List<AssetGenImage> get values => [appLogo];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/splash_deco_trade_hub.svg
  String get splashDecoTradeHub => 'assets/svg/splash_deco_trade_hub.svg';

  /// List of all assets
  List<String> get values => [splashDecoTradeHub];
}

class $AssetsImagesCommonGen {
  const $AssetsImagesCommonGen();

  /// File path: assets/images/common/placeholder_image.png
  AssetGenImage get placeholderImage =>
      const AssetGenImage('assets/images/common/placeholder_image.png');

  /// List of all assets
  List<AssetGenImage> get values => [placeholderImage];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogosGen logos = $AssetsLogosGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
