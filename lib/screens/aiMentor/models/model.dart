class ModelsModel {
  final String id;
  final int created;
  final String root;

  ModelsModel({required this.id, required this.created, required this.root});

  factory ModelsModel.fromJson(Map<String, dynamic> json) =>
      ModelsModel(id: json["id"], created: json["root"], root: json["created"]);

  static List<ModelsModel> modelsFromSnapshot(List modelSnapshot){
    return modelSnapshot.map((data) => ModelsModel.fromJson(data)).toList();
  }

}
