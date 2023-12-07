class Spray {
  final String displayName;
  final bool isNullSpray;
  final String displayIcon;
  final String fullTransparentIcon;

  Spray({
    required this.displayName,
    required this.isNullSpray,
    required this.displayIcon,
    required this.fullTransparentIcon,
  });

  factory Spray.fromJson(Map<String, dynamic> json) {
    return Spray(
      displayName: json['displayName'],
      isNullSpray: json['isNullSpray'] ?? true,
      displayIcon: json['displayIcon'],
      fullTransparentIcon: json['fullTransparentIcon'] ?? '',
    );
  }
}
