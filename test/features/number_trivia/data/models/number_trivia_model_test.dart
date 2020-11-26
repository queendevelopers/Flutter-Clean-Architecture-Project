import 'dart:convert';

import 'package:flutter_clean_architecture/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTrivivaModel = NumberTriviaModel(number: 1, text: 'Test Text');
  test('should be a subclass of NumberTrivia entity', () async {
    expect(tNumberTrivivaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON number is an integer',
            () async {
          final Map<String, dynamic> jsonMap = json.decode(
              fixture('trivia.json'));
          print(jsonMap['text']);
          final result = NumberTriviaModel.fromJson(jsonMap);
          expect(result, equals(tNumberTrivivaModel));
        });

    test(
        'should return a valid model when the JSON number is regarded as double',
            () async {
          final Map<String, dynamic> jsonMap =
          jsonDecode(fixture('trivia_double.json'));
          final result = NumberTriviaModel.fromJson(jsonMap);
          expect(result, tNumberTrivivaModel);
        });
  });

  group('toJson', ()
  {
    test('should return a valid model when the JSON number is an integer',
            () async {
          final result = tNumberTrivivaModel.toJson();
          final expectedMap = {'text': 'Test Text', 'number': 1};
          expect(result, expectedMap);
        });
  }
