class Post {
  int? id;
  int? userId;
  int? catigoryId;
  String? title;
  String? wilaya;
  String? price;
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
      this.wilaya,
      this.price,
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
    wilaya = json['wilaya'];
    price = json['price'];
    details = json['details'];
    image = json['image'];
    likes = json['likes'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['catigory_id'] = catigoryId;
    data['title'] = title;
    data['details'] = details;
    data['image'] = image;
    data['likes'] = likes;
    data['comment'] = comment;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
