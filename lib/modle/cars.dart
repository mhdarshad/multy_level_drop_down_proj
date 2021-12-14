class Carss {
  Cars cars;

  Carss({this.cars});

  Carss.fromJson(Map<String, dynamic> json) {
    cars = json['cars'] != null ? new Cars.fromJson(json['cars']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cars != null) {
      data['cars'] = this.cars.toJson();
    }
    return data;
  }
}

class Cars {
  List<CarBrand> nissan;
  List<CarBrand> ford;

  Cars({this.nissan, this.ford});

  Cars.fromJson(Map<String, dynamic> json) {
    if (json['Nissan'] != null) {
      nissan = new List<CarBrand>();
      json['Nissan'].forEach((v) {
        nissan.add(new CarBrand.fromJson(v));
      });
    }
    if (json['Ford'] != null) {
      ford = new List<CarBrand>();
      json['Ford'].forEach((v) {
        ford.add(new CarBrand.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nissan != null) {
      data['Nissan'] = this.nissan.map((v) => v.toJson()).toList();
    }
    if (this.ford != null) {
      data['Ford'] = this.ford.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CarBrand {
  String model;
  int doors;

  CarBrand({this.model, this.doors});

  CarBrand.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    doors = json['doors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['doors'] = this.doors;
    return data;
  }
}
