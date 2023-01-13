import 'package:flutter/material.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.primaryColor,
    required this.danger,
  });

  final Color? primaryColor;
  final Color? danger;

  @override
  ThemeExtension<AppColors> copyWith({Color? primaryColor, Color? danger}) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      danger: danger ?? this.danger,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      danger: Color.lerp(danger, other.danger, t),
    );
  }

  // Optional
  @override
  String toString() => 'MyColors(brandColor: $primaryColor, danger: $danger)';
}
