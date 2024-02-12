class Post {
  int? id;
  int? userId;
  int? catigoryId;
  String? title;
  String? details;
  String? image;
  String? likes;
  String? comment;
  String? createdAt;
  String? updatedAt;

  Post(
      {this.id,
      this.userId,
      this.catigoryId,
      this.title,
      this.details,
      this.image,
      this.likes,
      this.comment,
      this.createdAt,
      this.updatedAt});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    catigoryId = json['catigory_id'];
    title = json['title'];
    details = json['details'];
    image = json['image'];
    likes = json['likes'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['catigory_id'] = this.catigoryId;
    data['title'] = this.title;
    data['details'] = this.details;
    data['image'] = this.image;
    data['likes'] = this.likes;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
