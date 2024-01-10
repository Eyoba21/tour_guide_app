
class DataModel {
  String name;
  String description;
  String stars;
  String price;
  //int people;
  String image;
  String location;

  DataModel(
      {required this.image,
      required this.description,
      required this.name,
      //required this.people,
      required this.price,
      required this.stars,
      required this.location
      });

    
    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
       
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stars: json["star"],
        //people: json["people"],
       location: json["location"],
        image: json["image"],
    );
}
