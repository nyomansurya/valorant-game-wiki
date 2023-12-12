class GunBuddies {
  final String displayName;
  final String displayIcon;

  GunBuddies({
    required this.displayName,
    required this.displayIcon,
  });

  factory GunBuddies.fromJson(Map<String, dynamic> json) {
    return GunBuddies(
      displayName: json['displayName'],
      displayIcon: json['displayIcon'],
    );
  }
}
