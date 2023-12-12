class PlayerCards {
  final String displayName;
  final String largeArt;
  final String wideArt;

  PlayerCards({
    required this.displayName,
    required this.largeArt,
    required this.wideArt,
  });

  factory PlayerCards.fromJson(Map<String, dynamic> json) {
    return PlayerCards(
      displayName: json['displayName'],
      largeArt: json['largeArt'],
      wideArt: json['wideArt'],
    );
  }
}
