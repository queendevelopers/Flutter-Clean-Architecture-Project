import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:meta/meta.dart';

class NumberTriviaModel extends Equatable with NumberTrivia {
  NumberTriviaModel({@required this.text, @required this.number});


  factory NumberTriviaModel.fromJson(Map<String,dynamic> json) => NumberTriviaModel(
        text: json['text'],
        number: (json['number'] as num).toInt(),
      );

  Map<String,dynamic> toJson(){
    return {'text':text,'number':number};
  }

  @override
  int number ;

  @override
  String text;

  @override
  List<Object> get props => [text,number];
}
