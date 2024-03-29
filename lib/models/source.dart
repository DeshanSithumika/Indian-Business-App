class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] == null ? "" : json['id'],
      name: json['name'] == null ? "" : json['name'],
    );
  }
}
