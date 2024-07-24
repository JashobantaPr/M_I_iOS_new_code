class MyHierarchy {
  List<HierarchyItem>? myHierarchy;

  MyHierarchy({
    this.myHierarchy,
  });

  factory MyHierarchy.fromJson(Map<String, dynamic> json) {
    return MyHierarchy(
      myHierarchy: (json['myHierarchy'] as List<dynamic>?)
          ?.map((item) => HierarchyItem.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'myHierarchy': myHierarchy?.map((item) => item.toJson()).toList(),
    };
  }
}

class HierarchyItem {
  String? level1;
  String? level2;
  String? level3;
  String? level4;

  HierarchyItem({
    this.level1,
    this.level2,
    this.level3,
    this.level4,
  });

  factory HierarchyItem.fromJson(Map<String, dynamic> json) {
    return HierarchyItem(
      level1: json['1'],
      level2: json['2'],
      level3: json['3'],
      level4: json['4'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '1': level1,
      '2': level2,
      '3': level3,
      '4': level4,
    };
  }
}
