import 'package:equatable/equatable.dart';

/// generate by https://javiercbk.github.io/json_to_dart/
class AutogeneratedBigBloc {
  List<BigBlocModel> results;

  AutogeneratedBigBloc({this.results});

  AutogeneratedBigBloc.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<BigBlocModel>();
      json['results'].forEach((v) {
        results.add(new BigBlocModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BigBlocModel extends Equatable {
  int id;
  String name;

  BigBlocModel({this.id, this.name}) : super([id, name]);

  /// use : super([json]) for Equatable
  BigBlocModel.fromJson(Map<String, dynamic> json) : super([json]) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}