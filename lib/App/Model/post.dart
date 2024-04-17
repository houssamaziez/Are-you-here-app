class Student {
  int? id;
  String? name;
  String? classs;
  String? isPresent;
  int? userId;
  int? lavelId;
  String? image;
  String? createdAt;
  String? updatedAt;

  Student(
      {this.id,
      this.name,
      this.classs,
      this.isPresent,
      this.userId,
      this.lavelId,
      this.image,
      this.createdAt,
      this.updatedAt});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    classs = json['class'];
    isPresent = json['isPresent'];
    userId = json['user_id'];
    lavelId = json['lavel_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['class'] = this.classs;
    data['isPresent'] = this.isPresent;
    data['user_id'] = this.userId;
    data['lavel_id'] = this.lavelId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
