
class TargetUserDetail {
  String? userIdFk;
  String? empIdFk;
  String? participationStatus;
  String? incentivePlan;
  String? target;
  String? programIdFk;
  String? notifyParticipant;
  String? achievement1;
  String? achievement2;
  String? achievement3;
  String? achievement4;
  String? achievement5;
  String? achievement6;
  String? achievement7;
  String? achievement8;
  String? achievement9;
  String? achievement10;
  String? desc1;
  String? desc2;
  String? desc3;
  String? desc4;
  String? desc5;
  String? desc6;
  String? desc7;
  String? desc8;
  String? desc9;
  String? desc10;
  String? totalAchievement;

  TargetUserDetail({
    this.userIdFk,
    this.empIdFk,
    this.participationStatus,
    this.incentivePlan,
    this.target,
    this.programIdFk,
    this.notifyParticipant,
    this.achievement1,
    this.achievement2,
    this.achievement3,
    this.achievement4,
    this.achievement5,
    this.achievement6,
    this.achievement7,
    this.achievement8,
    this.achievement9,
    this.achievement10,
    this.desc1,
    this.desc2,
    this.desc3,
    this.desc4,
    this.desc5,
    this.desc6,
    this.desc7,
    this.desc8,
    this.desc9,
    this.desc10,
    this.totalAchievement,
  });

  factory TargetUserDetail.fromJson(Map<String, dynamic> json) {
    return TargetUserDetail(
      userIdFk: json['user_id_fk'] ?? '',
      empIdFk: json['emp_id_fk'] ?? '',
      participationStatus: json['participation_status'] ?? '',
      incentivePlan: json['incentive_plan'] ?? '',
      target: json['target'] ?? '',
      programIdFk: json['program_id_fk'] ?? '',
      notifyParticipant: json['notify_participant'] ?? '',
      achievement1: json['achievement1'] ?? '',
      achievement2: json['achievement2'] ?? '',
      achievement3: json['achievement3'] ?? '',
      achievement4: json['achievement4'] ?? '',
      achievement5: json['achievement5'] ?? '',
      achievement6: json['achievement6'] ?? '',
      achievement7: json['achievement7'] ?? '',
      achievement8: json['achievement8'] ?? '',
      achievement9: json['achievement9'] ?? '',
      achievement10: json['achievement10'] ?? '',
      desc1: json['desc1'] ?? '',
      desc2: json['desc2'] ?? '',
      desc3: json['desc3'] ?? '',
      desc4: json['desc4'] ?? '',
      desc5: json['desc5'] ?? '',
      desc6: json['desc6'] ?? '',
      desc7: json['desc7'] ?? '',
      desc8: json['desc8'] ?? '',
      desc9: json['desc9'] ?? '',
      desc10: json['desc10'] ?? '',
      totalAchievement: json['total_achievement'] ?? '',
    );
  }

  String get targetdat {
    double data = double.tryParse(target ?? '0') ?? 0;
    return (data * 0.0).toString();
  }

  String get targetdata {
    double data = double.tryParse(target ?? '0') ?? 0;
    return (data * 0.25).toString();
  }

  String get targetdataa {
    double data = double.tryParse(target ?? '0') ?? 0;
    return (data * 0.50).toString();
  }

  String get targetdataaa {
    double data = double.tryParse(target ?? '0') ?? 0;
    return (data * 0.75).toString();
  }

  String get targetdataaaa {
    double data = double.tryParse(target ?? '0') ?? 0;
    return (data * 1).toString();
  }

  String get targetdataaaaa {
    double data = double.tryParse(target ?? '0') ?? 0;
    return (data + 0.1).toString();
  }
}
