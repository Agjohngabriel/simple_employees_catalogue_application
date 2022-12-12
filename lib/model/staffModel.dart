import 'dart:convert';

List<StaffData> getStaffListFromJson(String str) =>
    List<StaffData>.from(
        json.decode(str).map((x) => StaffData.fromJson(x)));

String getStaffListToJson(List<StaffData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

StaffData staffModelFromJson(String str) =>
    StaffData.fromJson(json.decode(str));
String staffModelToJson(StaffData data) => json.encode(data.toJson());

String staffModelDataToString(dynamic data) => json.encode(data);
dynamic staffModelDataToJson(String data) => json.decode(data);

class StaffData {
  String? id;
  String? userId;
  String? imageUrl;
  String? userName;
  int? reviews;
  double? aveRating;
  LanguageReadDto? languageReadDto;
  ProfessionalDetailReadDto? professionalDetailReadDto;

  StaffData(
      {this.id,
        this.userId,
        this.imageUrl,
        this.userName,
        this.reviews,
        this.aveRating,
        this.languageReadDto,
        this.professionalDetailReadDto});

  StaffData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    imageUrl = json['imageUrl'];
    userName = json['userName'];
    reviews = json['reviews'];
    aveRating = json['aveRating'];
    languageReadDto = json['languageReadDto'] != null
        ? new LanguageReadDto.fromJson(json['languageReadDto'])
        : null;
    professionalDetailReadDto = json['professionalDetailReadDto'] != null
        ? new ProfessionalDetailReadDto.fromJson(
        json['professionalDetailReadDto'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['imageUrl'] = this.imageUrl;
    data['userName'] = this.userName;
    data['reviews'] = this.reviews;
    data['aveRating'] = this.aveRating;
    if (this.languageReadDto != null) {
      data['languageReadDto'] = this.languageReadDto!.toJson();
    }
    if (this.professionalDetailReadDto != null) {
      data['professionalDetailReadDto'] =
          this.professionalDetailReadDto!.toJson();
    }
    return data;
  }
}

class LanguageReadDto {
  String? lang1;
  String? lang2;
  String? lang3;
  String? lang4;
  String? lang5;

  LanguageReadDto({this.lang1, this.lang2, this.lang3, this.lang4, this.lang5});

  LanguageReadDto.fromJson(Map<String, dynamic> json) {
    lang1 = json['lang1'];
    lang2 = json['lang2'];
    lang3 = json['lang3'];
    lang4 = json['lang4'];
    lang5 = json['lang5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lang1'] = this.lang1;
    data['lang2'] = this.lang2;
    data['lang3'] = this.lang3;
    data['lang4'] = this.lang4;
    data['lang5'] = this.lang5;
    return data;
  }
}

class ProfessionalDetailReadDto {
  int? yearsOfMedicalExperience;
  String? areaOfSpecialization;

  ProfessionalDetailReadDto(
      {this.yearsOfMedicalExperience, this.areaOfSpecialization});

  ProfessionalDetailReadDto.fromJson(Map<String, dynamic> json) {
    yearsOfMedicalExperience = json['yearsOfMedicalExperience'];
    areaOfSpecialization = json['areaOfSpecialization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yearsOfMedicalExperience'] = this.yearsOfMedicalExperience;
    data['areaOfSpecialization'] = this.areaOfSpecialization;
    return data;
  }
}