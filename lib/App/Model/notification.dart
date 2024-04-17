class Notificationapp {
  int? id;
  String? title;
  String? details;
  String? userId;
  String? postId;
  String? createdAt;
  String? issee;

  String? updatedAt;

  Notificationapp(
      {this.id,
      this.title,
      this.details,
      this.userId,
      this.postId,
      this.issee,
      this.createdAt,
      this.updatedAt});

  Notificationapp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    details = json['details'];
    userId = json['user_id'];
    postId = json['post_id'];
    issee = json['issee'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['details'] = this.details;
    data['user_id'] = this.userId;
    data['post_id'] = this.postId;
    data['issee'] = this.issee;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
