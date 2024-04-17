class Note {
  int? id;
  String? title;
  String? details;
  int? userId;
  int? notificationId;
  String? createdAt;
  String? updatedAt;

  Note(
      {this.id,
      this.title,
      this.details,
      this.userId,
      this.notificationId,
      this.createdAt,
      this.updatedAt});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    details = json['details'];
    userId = json['user_id'];
    notificationId = json['notification_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['details'] = this.details;
    data['user_id'] = this.userId;
    data['notification_id'] = this.notificationId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
