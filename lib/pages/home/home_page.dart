import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:h11/models/food.dart';
import 'package:h11/models/store.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {

  HomePage({Key? key}) : super(key: key);
  StoreModel _store = StoreModel();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Food'),
        ),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                    onPressed: _handleClickButton,
                    child: Text('Load Foods Data')),
              ),
            ),
            Expanded(
              child: ListView.builder(shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: widget._store.foodList.length,
                itemBuilder: (context, index) =>
                    FoodWidget(food: widget._store.foodList[index],),
              ),
            ),


          ],
        )
    );
  }
  _handleClickButton() async {
    final url = Uri.parse('https://cpsu-test-api.herokuapp.com/foods');
    var result = await http.get(url);
    var json_re = json.decode(result.body);

    widget._store.loadJson(json_re);


    setState(() {

    });


  }

}



class FoodWidget extends StatefulWidget {
  const FoodWidget({Key? key, required this.food}) : super(key: key);

  final FoodModel food;
  @override
  _FoodWidgetState createState() => _FoodWidgetState();


}

class _FoodWidgetState extends State<FoodWidget> {


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: InkWell(
        onTap: () {
          print("tapped");
        },
        child: Row(
          children: [
            Image.network('${widget.food.image_url}', width: 150,
              fit: BoxFit.fitWidth,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('${widget.food.name}'),
                  Text('${widget.food.price} บาท'),
                ],
              ),
            )

          ],
        ),
      ),


    );
  }
}


