class Catigorys {
  int? stetus;
  List<Catigory>? catigory;

  Catigorys({this.stetus, this.catigory});

  Catigorys.fromJson(Map<String, dynamic> json) {
    stetus = json['stetus'];
    if (json['Catigory'] != null) {
      catigory = <Catigory>[];
      json['Catigory'].forEach((v) {
        catigory!.add(new Catigory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stetus'] = this.stetus;
    if (this.catigory != null) {
      data['Catigory'] = this.catigory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Catigory {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? image;

  Catigory({this.id, this.name, this.createdAt, this.updatedAt, this.image});

  Catigory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    return data;
  }
}
