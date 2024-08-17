class TeNotedateModel {
  final int day;
  final int beingType;

  const TeNotedateModel({
    required this.day,
    required this.beingType,
  });

  factory TeNotedateModel.fromMap(Map<String, dynamic> map) => TeNotedateModel(
        day: int.parse(map['day'].toString()),
        beingType: int.parse(map['beingType'].toString()),
      );
}
