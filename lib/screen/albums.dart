import 'package:flutter/material.dart';
import 'package:igti_challenge/models/album.dart';
import 'package:igti_challenge/screen/photos.dart';
import 'package:igti_challenge/service/service.dart';

class Albums extends StatefulWidget {
  @override
  _AlbumsState createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  final Service service = Service();
  List<Album> _albums = List<Album>();

  @override
  void initState() {
    super.initState();
    service.getAlbums().then((value) {
      setState(() {
        _albums = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Albums'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white70,
        child: FutureBuilder<List<Album>>(
          future: service.getAlbums(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Photos(snapshot.data[index].id)));
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('${snapshot.data[index].title}'),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro ao carregar álbuns'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
