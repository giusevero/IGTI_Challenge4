import 'package:flutter/material.dart';
import 'package:igti_challenge/models/photo.dart';
import 'package:igti_challenge/service/service.dart';

class Photos extends StatelessWidget {
  final int albumId;
  final Service service = Service();

  Photos(this.albumId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Photos'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white70,
        child: FutureBuilder<List<Photo>>(
          future: service.getPhotos(albumId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network('${snapshot.data[index].thumbnailUrl}'),
                        ListTile(
                          title: Text('${snapshot.data[index].title}'),
                        )
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro ao buscar fotos'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
