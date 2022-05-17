import 'package:mobx/mobx.dart';
import 'package:mobx_week4/src/models/person_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/address_model.dart';
import '../models/gender_model.dart';

part 'controller_home.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  String name = '';
  @observable
  String email = '';
  @observable
  String birthdate = '';
  @observable
  String cpf = '';
  @observable
  String gender = '';
  @observable
  String address = '';
  @observable
  String cep = '';
  @observable
  String number = '';
  @observable
  String complement = '';
  @observable
  String phone = '';
  @observable
  String male = '';
  @observable
  String female = '';
  @observable
  String other = '';
  @observable
  String notSay = '';
  @observable
  bool isSaved = false;

  @observable
  GenderSelect genderSelect = GenderSelect.male;

  @observable
  AddressModel? addressModel;

  @observable
  PersonModel? personModel;

  @observable
  List<String> options = ['male', 'female', 'other', 'notSay'];

  @observable
  String currentOption = '';

  @observable
  var items = <String>[];

  @observable
  final list = ObservableList<String>.of([
    'Lorem ipsum',
    'Lorem Ipsum',
    'Lorem Ipsum',
    'Lorem Ipsum',
    'Lorem Ipsum',
    'Lorem Ipsum',
    'Lorem Ipsum'
  ]);

  @action
  void setOptions(String value) => currentOption = value;

  @action
  void setGenderSelect(GenderSelect value) => genderSelect = value;

  @action
  setAddressModel(
      {required String cep,
      required String number,
      required String address,
      required String complement}) {
    addressModel = AddressModel(
        cep: cep, address: address, number: number, complement: complement);
  }

  @action
  setPersonModel({
    required String name,
    required String birthdate,
    required String cpf,
    required String phone,
    required String email,
    required String gender,
    required String male,
    required String female,
    required String other,
    required String notSay,
  }) {
    personModel = PersonModel(
      name: name,
      birthdate: birthdate,
      cpf: cpf,
      phone: phone,
      email: email,
      gender: gender,
      male: male,
      female: female,
      other: other,
      notSay: notSay,
    );
  }

  @action
  Future<void> setLocalStoragePerson() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('birthdate', birthdate);
    await prefs.setString('cpf', cpf);
    await prefs.setString('phone', phone);
    await prefs.setString('email', email);
    await prefs.setString('gender', gender);
    await prefs.setString('male', male);
    await prefs.setString('female', female);
    await prefs.setString('other', other);
    await prefs.setString('notSay', notSay);
    setIsSaved(true);
  }

  @action
  Future<void> setLocalStorageAddress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('cep', cep);
    await prefs.setString('number', number);
    await prefs.setString('address', address.toString());
    await prefs.setString('complement', complement);
    setIsSaved(true);
  }

  @action
  void setName(String value) {
    name = value;
    setIsSaved(false);
  }

  @action
  void setEmail(String value) {
    email = value;
    setIsSaved(false);
  }

  @action
  void setBirthDate(String value) {
    birthdate = value;
    setIsSaved(false);
  }

  @action
  void setCpf(String value) {
    cpf = value;
    setIsSaved(false);
  }

  @action
  void setPhone(String value) {
    phone = value;
    setIsSaved(false);
  }

  @action
  void setMale(String value) {
    male = value;
    setIsSaved(false);
  }

  @action
  void setFemale(String value) {
    female = value;
    setIsSaved(false);
  }

  @action
  void setOther(String value) {
    other = value;
    setIsSaved(false);
  }

  @action
  void setNotSay(String value) {
    notSay = value;
    setIsSaved(false);
  }

  @action
  void setGender(String value) {
    gender = value;
    setIsSaved(false);
  }

  @action
  void setAddress(String value) {
    address = value;
    setIsSaved(false);
  }

  @action
  void setCep(String value) {
    cep = value;
    setIsSaved(false);
  }

  @action
  void setNumber(String value) {
    number = value;
    setIsSaved(false);
  }

  @action
  void setComplement(String value) {
    complement = value;
    setIsSaved(false);
  }

  @action
  void setIsSaved(bool value) {
    isSaved = value;
    setIsSaved(false);
  }

  @computed
  bool get isValidPerson =>
      name.isNotEmpty &&
      email.isNotEmpty &&
      cpf.isNotEmpty &&
      phone.isNotEmpty &&
      birthdate.isNotEmpty;
}
