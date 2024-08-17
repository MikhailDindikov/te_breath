class TeNoteModel {
  final int id;
  final DateTime noteDate;
  final int noteBeingType;
  final String noteReason;
  final String noteFood;
  final String noteLocation;
  final String noteAllergen;
  final String notePlants;
  final String noteAnimals;

  const TeNoteModel(
      {required this.id,
      required this.noteDate,
      required this.noteBeingType,
      required this.noteReason,
      required this.noteFood,
      required this.noteLocation,
      required this.noteAllergen,
      required this.notePlants,
      required this.noteAnimals});

  factory TeNoteModel.fromMap(Map<String, dynamic> map) {
    final teDate = DateTime(
        int.parse(map['year'].toString()),
        int.parse(map['month'].toString()),
        int.parse(map['day'].toString()),
      );
    return TeNoteModel(
      id: int.parse(map['id'].toString()),
      noteDate: teDate,
      noteBeingType: int.parse(map['beingType'].toString()),
      noteReason: map['reasons'].toString(),
      noteFood: map['food'].toString(),
      noteLocation: map['location'].toString(),
      noteAllergen: map['allergen'].toString(),
      notePlants: map['plants'].toString(),
      noteAnimals: map['animals'].toString(),
    );
  }

  String get textDate =>
      '${noteDate.day < 10 ? '0${noteDate.day}' : noteDate.day}.${noteDate.month < 10 ? '0${noteDate.month}' : noteDate.month}.${noteDate.year}';

  Map<String, dynamic> toMap() => {
        'day': noteDate.day.toString(),
        'month': noteDate.month.toString(),
        'year': noteDate.year.toString(),
        'beingType': noteBeingType.toString(),
        'reasons': noteReason,
        'food': noteFood,
        'location': noteLocation,
        'allergen': noteAllergen,
        'plants': notePlants,
        'animals': noteAnimals,
      };
}
