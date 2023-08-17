class News {
  int? id;
  String? image;
  String? title;
  String? content;
  String? createdAt;
  String? updatedAt;

  News({
    this.id,
    this.image,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      content: json['content'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['image'] = image;
  //   data['title'] = title;
  //   data['content'] = content;
  //   data['created_at'] = createdAt;
  //   data['updated_at'] = updatedAt;
  //   return data;
  // }
}
