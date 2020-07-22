
import 'package:teknikradiografi/notifier/teknikradiografi_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FoodDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(foodNotifier.currentFood.name),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[

                SizedBox(height: 24),
                Text(
                  foodNotifier.currentFood.name,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  'kategori: ${foodNotifier.currentFood.kategori}',
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                Padding(padding: EdgeInsets.only(left:20.0, right: 20.0),
                  child:
                  Text(
                    'PP: ${foodNotifier.currentFood.PP}',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15),
                  ),
                  ),
                Padding(padding: EdgeInsets.only(left:20.0, right: 20.0),
                  child:
                  Text(
                    'PP: ${foodNotifier.currentFood.PP}',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left:20.0, right: 20.0),
                  child:
                  Text(
                    'PO: ${foodNotifier.currentFood.PO}',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left:20.0, right: 20.0),
                  child:
                  Text(
                    'Kaset: ${foodNotifier.currentFood.Kaset}',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left:20.0, right: 20.0),
                  child:
                  Text(
                    'CR: ${foodNotifier.currentFood.CR}',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left:20.0, right: 20.0),
                  child:

                  Text(
                    'CP: ${foodNotifier.currentFood.CP}',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left:20.0, right: 20.0),
                  child:
                  Text(
                    'FFD: ${foodNotifier.currentFood.FFD}',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left:20.0, right: 20.0),
                  child:
                  Text(
                    'Marker: ${foodNotifier.currentFood.Marker}',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left:20.0, right: 20.0),
                  child:
                  Text(
                    'Kriteria Gambar: ${foodNotifier.currentFood.Kriteria_Gambar}',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15),
                  ),
                ),

                Padding(padding: EdgeInsets.only(left:20.0, right: 20.0),
                  child:
                  Text(
                    'Gambar 1',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                Image.network(
                  foodNotifier.currentFood.urlGambar != null
                      ? foodNotifier.currentFood.urlGambar
                      : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.fitWidth,
                ),
//                SizedBox(height: 20),
//                GridView.count(
//                  shrinkWrap: true,
//                  scrollDirection: Axis.vertical,
//                  padding: EdgeInsets.all(8),
//                  crossAxisCount: 3,
//                  crossAxisSpacing: 4,
//                  mainAxisSpacing: 4,
//                  children: foodNotifier.currentFood.subIngredients
//                      .map(
//                        (ingredient) => Card(
//                      color: Colors.black54,
//                      child: Center(
//                        child: Text(
//                          ingredient,
//                          style: TextStyle(color: Colors.white, fontSize: 16),
//                        ),
//                      ),
//                    ),
//                  )
//                      .toList(),
//                )
              ],
            ),
          ),
        ),
      ),
//      floatingActionButton: Column(
//        mainAxisAlignment: MainAxisAlignment.end,
//        children: <Widget>[
//          FloatingActionButton(
//            heroTag: 'button1',
//            onPressed: () {
//              Navigator.of(context).push(
//                MaterialPageRoute(builder: (BuildContext context) {
//                  return FoodForm(
//                    isUpdating: true,
//                  );
//                }),
//              );
//            },
//            child: Icon(Icons.edit),
//            foregroundColor: Colors.white,
//          ),
//          SizedBox(height: 20),
//          FloatingActionButton(
//            heroTag: 'button2',
//            onPressed: () => deleteFood(foodNotifier.currentFood, _onFoodDeleted),
//            child: Icon(Icons.delete),
//            backgroundColor: Colors.red,
//            foregroundColor: Colors.white,
//          ),
//        ],
//      ),
    );
  }
}
