class Photo {
  int id;
  int albumId;
  String title;
  String url;
  String thumbnailUrl;

  Photo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        albumId = json['albumId'],
        title = json['title'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];
}
