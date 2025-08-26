class Match {
  final String id;
  final String userAId;
  final String userBId;
  final DateTime matchedOn;

  Match({
    required this.id,
    required this.userAId,
    required this.userBId,
    DateTime? matchedOn,
  }) : matchedOn = matchedOn ?? DateTime.now();
}

