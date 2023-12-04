import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'datamodel.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State createState() => _HomeState();
}

class _HomeState extends State {
  bool _isLoading = true;
  String noImage = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/240px-No_image_available.svg.png";
 
  @override
  void initState() {
    super.initState();
    _getData();
  }
 
  DataModel? dataFromAPI;
  _getData() async {
    try {
      String url = "https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=6ead8cac932d48498edb338b25c263fa";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = DataModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REST API News"),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(100.100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [            
                      Image.network(
                        (dataFromAPI!.articles[index].urlToImage ?? 
                        noImage),
                        width: 150,
                      ),
                      Text(dataFromAPI!.articles[index].title.toString()),
                      Text("${dataFromAPI!.articles[index].description.toString()}"),
                    ],
                  ),
              );
            },
          itemCount: dataFromAPI!.articles.length,
        ),
    );
  }
}