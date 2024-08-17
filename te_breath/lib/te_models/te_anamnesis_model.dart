class TeAnamnesisModel {
  final int id;
  final String anamArise;
  final String anamSymptoms;
  final String anamNumber;
  final String duration;
  final String anamFamily;

  const TeAnamnesisModel({
    required this.id,
    required this.anamArise,
    required this.anamSymptoms,
    required this.anamNumber,
    required this.duration,
    required this.anamFamily,
  });

  factory TeAnamnesisModel.fromMap(Map<String, dynamic> map) =>
      TeAnamnesisModel(
        id: int.parse(map['id'].toString()),
        anamArise: map['arise'].toString(),
        anamSymptoms: map['symptoms'].toString(),
        anamNumber: map['count'].toString(),
        duration: map['duration'].toString(),
        anamFamily: map['family'].toString(),
      );

  Map<String, dynamic> toMap() => {
        'arise': anamArise,
        'symptoms': anamSymptoms,
        'count': anamNumber,
        'duration': duration,
        'family': anamFamily,
      };
}
