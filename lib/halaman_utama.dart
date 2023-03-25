import 'package:flutter/material.dart';
import 'package:praktpm_quiz/halaman_detail.dart';
import 'package:praktpm_quiz/disease_data.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Disease'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: listDisease.length,
        itemBuilder: (context, index) {
          final Diseases disease = listDisease[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HalamanDetail(
                  disease: disease,
                  favorite: [],
                );
              }));
            },
            child: Card(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Image.network(disease.imgUrls),
                  ),
                  textutama(disease.name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget textutama(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}