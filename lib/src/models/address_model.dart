class AddressModel {
  final String cep;
  final String address;
  final String number;
  final String complement;

  AddressModel(
      {required this.cep,
      required this.address,
      required this.number,
      required this.complement});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        cep: json['cep'],
        address: json['address'],
        number: json['number'],
        complement: json['complement']);
  }
//criar to.json
}
