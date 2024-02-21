// ignore_for_file: public_member_api_docs, sort_constructors_first
class GetAllPostResponse {
  int? id;
  String? title;

  GetAllPostResponse({this.id, this.title});

  factory GetAllPostResponse.fromJson(Map<String, dynamic> json) {
    return GetAllPostResponse(
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }

  @override
  String toString() => 'GetAllResponse(id: $id, title: $title)';
}
