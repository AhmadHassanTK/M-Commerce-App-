class ProductAtributeModel {
  String? name;
  final List<String>? values;

  ProductAtributeModel({this.name, this.values});

  toJson() {
    return {'Name': name, 'Values': values};
  }

  ProductAtributeModel.fromJson(Map<String, dynamic> snapshot)
      : name = snapshot.containsKey('Name') ? snapshot['Name'] ?? '' : '',
        values = List<String>.from(snapshot['Values'] ?? '');
}
