class Weapons {
  final String displayName;
  final String displayIcon;
  final WeaponsStats weaponStats;
  final ShopData shopData;
  final List<Skins> skins;

  Weapons({
    required this.displayName,
    required this.displayIcon,
    required this.weaponStats,
    required this.shopData,
    required this.skins,
  });

  factory Weapons.fromJson(Map<String, dynamic> json) {
    WeaponsStats weaponStats = WeaponsStats.fromJson(json['weaponStats'] ?? {});
    // ShopData? shopData;

    return Weapons(
      displayName: json['displayName'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
      weaponStats: weaponStats,
      shopData: ShopData.fromJson(json['shopData'] ?? {}),
      skins: (json['skins'] as List<dynamic>)
          .map((skin) => Skins.fromJson(skin))
          .toList(),
    );
  }
}

class WeaponsStats {
  final double fireRate;
  final int magazineSize;
  final double runSpeedMultiplier;
  final double equipTimeSeconds;
  final double reloadTimeSeconds;
  final double firstBulletAccuracy;
  final List<DamageRange> damageRange;

  WeaponsStats({
    required this.fireRate,
    required this.magazineSize,
    required this.runSpeedMultiplier,
    required this.equipTimeSeconds,
    required this.reloadTimeSeconds,
    required this.firstBulletAccuracy,
    required this.damageRange,
  });

  factory WeaponsStats.fromJson(Map<String, dynamic> json) {
    return WeaponsStats(
      fireRate: (json['fireRate'] ?? 0).toDouble(),
      magazineSize: json['magazineSize'] ?? 0,
      runSpeedMultiplier: (json['runSpeedMultiplier'] ?? 0).toDouble(),
      equipTimeSeconds: (json['equipTimeSeconds'] ?? 0).toDouble(),
      reloadTimeSeconds: (json['reloadTimeSeconds'] ?? 0).toDouble(),
      firstBulletAccuracy: (json['firstBulletAccuracy'] ?? 0).toDouble(),
      damageRange: (json['damageRanges'] as List<dynamic>?)
          ?.map((range) => DamageRange.fromJson(range))
          .toList() ?? [],
    );
  }
}

class DamageRange {
  final int rangeStartMeters;
  final int rangeEndMeters;
  final double headDamage;
  final double bodyDamage;
  final double legDamage;

  DamageRange({
    required this.rangeStartMeters,
    required this.rangeEndMeters,
    required this.headDamage,
    required this.bodyDamage,
    required this.legDamage,
  });

  factory DamageRange.fromJson(Map<String, dynamic> json) {
    return DamageRange(
      rangeStartMeters: json['rangeStartMeters'] ?? 0,
      rangeEndMeters: json['rangeEndMeters'] ?? 0,
      headDamage: (json['headDamage'] ?? 0).toDouble(),
      bodyDamage: (json['bodyDamage'] ?? 0).toDouble(),
      legDamage: (json['legDamage'] ?? 0).toDouble(),
    );
  }
}

class ShopData {
  final int costData;
  final String category;

  ShopData({
    required this.costData,
    required this.category,
  });

  factory ShopData.fromJson(Map<String, dynamic> json) {
    return ShopData(
      costData: json['cost'] ?? 0,
      category: json['category'] ?? '',
    );
  }
}

class Skins {
  final String displayName;
  final String displayIcon;

  Skins({
    required this.displayName,
    required this.displayIcon,
  });

  factory Skins.fromJson(Map<String, dynamic> json) {
    return Skins(
      displayName: json['displayName'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
    );
  }
}
