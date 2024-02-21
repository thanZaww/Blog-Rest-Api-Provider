class GetOnePostResponse {
  int? id;
  String? title;
  String? body;
  String? photo;

  GetOnePostResponse({this.id, this.title, this.body, this.photo});

  factory GetOnePostResponse.fromJson(Map<String, dynamic> json) {
    return GetOnePostResponse(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['photo'] = photo;
    return data;
  }
}
