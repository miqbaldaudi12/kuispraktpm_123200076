import 'package:flutter/material.dart';
import 'package:praktpm_quiz/disease_data.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  final Diseases? disease;
  final List<Diseases> favorite;
  const HalamanDetail({Key? key, required this.favorite, required this.disease})
      : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isFavorite = false;
  setFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        widget.favorite.add(widget.disease!);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Ditambahkan ke daftar Favorit'),
            duration: Duration(
              seconds: 2,
            ),
          ),
        );
      } else {
        widget.favorite.remove(widget.disease!);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Dihapus dari daftar Favorit'),
            duration: Duration(
              seconds: 2,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ' + widget.disease!.name),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setFavorite();
            },
            icon: (isFavorite)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 2 / 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.network(widget.disease!.imgUrls),
                  ),
                ],
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              textBesarBanget(widget.disease!.name),
              textBesar('Disease Name'),
              textSedang(widget.disease!.name),
              textBesar('Plant Name'),
              textSedang(widget.disease!.plantName),
              textBesar('Ciri-Ciri :'),
              for (var ciri in widget.disease!.nutshell) Text(ciri + "."),
              textBesar('Disease ID'),
              textSedang(widget.disease!.id),
              textBesar('Symptom'),
              Text(widget.disease!.symptom),
            ]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          launchUrl(Uri.parse(widget.disease!.imgUrls));
        },
        child: const Icon(
          Icons.link,
        ),
      ),
    );
  }

  Widget textBesarBanget(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget textBesar(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget textSedang(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
    );
  }
}