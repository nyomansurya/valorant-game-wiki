class Maps {
  final String displayName;
  final String narrativeDescription;
  final String coordinates;
  final String mapDisplay;
  final String mapListIcon;
  final String mapsBackground;

  Maps({
    required this.displayName,
    required this.narrativeDescription,
    required this.coordinates,
    required this.mapDisplay,
    required this.mapListIcon,
    required this.mapsBackground,
  });

  factory Maps.fromJson(Map<String, dynamic> json) {
    return Maps(
      displayName: json['displayName'] ?? '',
      narrativeDescription: json['narrativeDescription'] ?? '',
      coordinates: json['coordinates'] ?? '',
      mapDisplay: json['displayIcon'] ?? '',
      mapListIcon: json['listViewIcon'] ?? '',
      mapsBackground: json['splash'] ?? '',
    );
  }
}
