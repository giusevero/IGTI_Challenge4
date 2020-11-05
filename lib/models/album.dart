class Album {
  int id;
  int userId;
  String title;

  Album.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        title = json['title'];
}
