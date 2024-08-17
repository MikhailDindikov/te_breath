class TeReminderModel {
  final int id;
  final String reminderName;
  final String reminderDosage;
  final int reminderTimerType;
  final String reminderSpecifyTime;
  final String reminderNotes;
  final int reminderIconType;

  const TeReminderModel({
    required this.id,
    required this.reminderName,
    required this.reminderDosage,
    required this.reminderTimerType,
    required this.reminderSpecifyTime,
    required this.reminderNotes,
    required this.reminderIconType,
  });

  factory TeReminderModel.fromMap(Map<String, dynamic> map) => TeReminderModel(
        id: int.parse(map['id'].toString()),
        reminderName: map['name'].toString(),
        reminderDosage: map['dosage'].toString(),
        reminderTimerType: int.parse(map['timerType'].toString()),
        reminderSpecifyTime: map['specifyTime'].toString(),
        reminderNotes: map['notes'].toString(),
        reminderIconType: int.parse(map['iconType'].toString()),
      );

  Map<String, dynamic> toMap() => {
        'name': reminderName,
        'dosage': reminderDosage,
        'timerType': reminderTimerType.toString(),
        'specifyTime': reminderSpecifyTime,
        'notes': reminderNotes,
        'iconType': reminderIconType.toString(),
      };
}
