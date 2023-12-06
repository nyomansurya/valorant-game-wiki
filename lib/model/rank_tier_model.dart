class RankTier {
  final String tierName;
  final String icon;
  final String divisionName;

  RankTier({
    required this.tierName,
    required this.icon,
    required this.divisionName,
  });

  factory RankTier.fromJson(Map<String, dynamic> json) {
    return RankTier(
      tierName: json['tierName'],
      icon: json['largeIcon'] ?? '',
      divisionName: json['divisionName'],
    );
  }
}
