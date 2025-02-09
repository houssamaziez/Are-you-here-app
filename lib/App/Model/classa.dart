class Classa {
  int? id;
  String? name;
  int? lavelId;
  String? createdAt;
  String? updatedAt;

  Classa({this.id, this.name, this.lavelId, this.createdAt, this.updatedAt});

  Classa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lavelId = json['lavel_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lavel_id'] = this.lavelId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
