class ValorantAgent {
  final String uuid;
  final String displayName;
  final String description;
  final String developerName;
  final List<String> characterTags;
  final String displayIcon;
  final String displayIconSmall;
  final String bustPortrait;
  final String fullPortrait;
  final String fullPortraitV2;
  final String killfeedPortrait;
  final String background;
  final List<String> backgroundGradientColors;
  final String assetPath;
  final bool isFullPortraitRightFacing;
  final bool isPlayableCharacter;
  final bool isAvailableForTest;
  final bool isBaseContent;
  final Map<String, String> role;
  final List<ValorantAbility> abilities;

  ValorantAgent({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.developerName,
    required this.characterTags,
    required this.displayIcon,
    required this.displayIconSmall,
    required this.bustPortrait,
    required this.fullPortrait,
    required this.fullPortraitV2,
    required this.killfeedPortrait,
    required this.background,
    required this.backgroundGradientColors,
    required this.assetPath,
    required this.isFullPortraitRightFacing,
    required this.isPlayableCharacter,
    required this.isAvailableForTest,
    required this.isBaseContent,
    required this.role,
    required this.abilities,
  });

  factory ValorantAgent.fromJson(Map<String, dynamic> json) {
    List<String> tags = [];
    Map<String, String> role = {};

    dynamic characterRole = json['role'];
    dynamic characterTags = json['characterTags'];

    if (characterTags != null) {
      if (characterTags is List) {
        tags = List<String>.from(characterTags);
      } else if (characterTags is String) {
        tags.add(characterTags);
      }
    }

    if (characterRole != null){
        role = Map<String, String>.from(characterRole);
    }

    return ValorantAgent(
      uuid: json['uuid'] ?? '',
      displayName: json['displayName'] ?? '',
      description: json['description'] ?? '',
      developerName: json['developerName'] ?? '',
      characterTags: tags,
      displayIcon: json['displayIcon'] ?? '',
      displayIconSmall: json['displayIconSmall'] ?? '',
      bustPortrait: json['bustPortrait'] ?? '',
      fullPortrait: json['fullPortrait'] ?? '',
      fullPortraitV2: json['fullPortraitV2'] ?? '',
      killfeedPortrait: json['killfeedPortrait'] ?? '',
      background: json['background'] ?? '',
      backgroundGradientColors:
          List<String>.from(json['backgroundGradientColors'] ?? []),
      assetPath: json['assetPath'] ?? '',
      isFullPortraitRightFacing: json['isFullPortraitRightFacing'] ?? false,
      isPlayableCharacter: json['isPlayableCharacter'] ?? false,
      isAvailableForTest: json['isAvailableForTest'] ?? false,
      isBaseContent: json['isBaseContent'] ?? false,
      role: role,
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => ValorantAbility.fromJson(e))
          .toList(),
    );
  }
}

// class ValorantRole {
//   final String uuid;
//   final String displayName;
//   final String description;
//   final String displayIcon;
//   final String assetPath;

//   ValorantRole({
//     required this.uuid,
//     required this.displayName,
//     required this.description,
//     required this.displayIcon,
//     required this.assetPath,
//   });

//   factory ValorantRole.fromJson(Map<String, dynamic> json) {
//     return ValorantRole(
//       uuid: json['uuid'] ?? '',
//       displayName: json['displayName'] ?? '',
//       description: json['description'] ?? '',
//       displayIcon: json['displayIcon'] ?? '',
//       assetPath: json['assetPath'] ?? '',
//     );
//   }
// }

class ValorantAbility {
  final String slot;
  final String displayName;
  final String description;
  final String displayIcon;

  ValorantAbility({
    required this.slot,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  factory ValorantAbility.fromJson(Map<String, dynamic> json) {
    return ValorantAbility(
      slot: json['slot'] ?? '',
      displayName: json['displayName'] ?? '',
      description: json['description'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
    );
  }
}
