class ScheduledUpgrade {
  String? programManual;
  String? scheduledUpgrade;
  String? aboutBuzzz;
  String? helpManual;

  ScheduledUpgrade({
    this.programManual,
    this.scheduledUpgrade,
    this.aboutBuzzz,
    this.helpManual,
  });

  factory ScheduledUpgrade.fromJson(Map<String, dynamic> json) {
    return ScheduledUpgrade(
      programManual: json['program_manual'],
      scheduledUpgrade: json['scheduled_upgrade'],
      aboutBuzzz: json['about_buzzz'],
      helpManual: json['help_manual'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'program_manual': programManual,
      'scheduled_upgrade': scheduledUpgrade,
      'about_buzzz': aboutBuzzz,
      'help_manual': helpManual,
    };
  }
}
