class DataModel {
  List<Data>? data;

  DataModel({this.data});

  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }


}

class Data {
  String? dataChar;
  String? sound;

  Data({this.dataChar, this.sound});

  Data.fromJson(Map<String, dynamic> json) {
    dataChar = json['data_char'];
    sound = json['sound'];
  }

}
