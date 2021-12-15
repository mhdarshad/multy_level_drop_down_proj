import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'modle/cars.dart';
import 'repository/car_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CarBrand> _carbrandlist=[];
  String _brandvalue;
  String _carvalue;
  List<String> _carlist =[];
  Future<String> _getCarList() async {
    cartrepo.readJson().then((value) {
      setState(() {
        _carlist = [...value.cars.toJson().keys];
      });
    });
  }
  Future<CarBrand> _getBrandsList(String newValue) async {
    List<CarBrand> brand = [];
    for (var element in _carlist) {
      if(element == newValue){
        cartrepo.readJson().then((value) {
          value.cars.toJson()[newValue].asMap().forEach((index, value){
            brand.add(CarBrand.fromJson(value));
          });
          _carbrandlist.clear();
          setState(() {
            _brandvalue=null;
            _carvalue = newValue;
            _carbrandlist = brand;
          });
          print(_carvalue);
        });
      }
    }
  }
@override
  void initState() {
    // TODO: implement initState
  _getCarList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child:  ListView(
            padding: EdgeInsets.all(20.0),
            children: [

              Container(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                            value: _carvalue,
                            iconSize: 30,
                            icon: (null),
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                            hint: Text('Select Cars'),
                            onChanged: (String newValue) =>_getBrandsList(newValue),
                            items: _carlist?.map((item) {
                              return DropdownMenuItem(
                                child: Text(item),
                                value: item.toString(),
                              );
                            })?.toList() ?? [],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Container(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                            value: _brandvalue,
                            iconSize: 30,
                            icon: (null),
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                            hint: Text('Select City'),
                            onChanged: (String newValue) {
                              setState(() {
                                _brandvalue = newValue;
                                print(_brandvalue);
                              });
                            },
                            items: _carbrandlist?.map((item) {
                              return DropdownMenuItem(
                                child: Text("${item.model} door:${item.doors}"),
                                value: item.model.toString(),
                              );
                            })?.toList() ?? [],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("${_carvalue??""} , ${_brandvalue??""}",style: const TextStyle(fontSize: 20),),
                ],
              )
            ],)
        ),
      ),
    );
  }
}
