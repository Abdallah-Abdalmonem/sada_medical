class CustomModel {
  String text;
  bool isSelected;
  int prority;

  CustomModel({required this.text, this.isSelected = false, this.prority = 0});

  factory CustomModel.fromMap(Map<String, dynamic> json) {
    return CustomModel(
      text: json["text"],
      isSelected: json["isSelected"] ?? false,
      prority: json["prority"] ?? 0,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "text": text,
      "isSelected": isSelected,
      "prority": prority,
    };
  }
}
