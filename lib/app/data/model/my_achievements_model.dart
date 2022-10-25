class MyAchievements {
  String? id;
  String? title;
  String? image;
  String? description;


  

  MyAchievements(
      {
        this.id,
        this.title,
      this.description,
      this.image,


      
      });

  MyAchievements.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    //isExchange = json['isExchange'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    //data['isExchange'] = isExchange;
    return data;
  }
}
