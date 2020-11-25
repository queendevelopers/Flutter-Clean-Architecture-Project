import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/usecases/GetConcreteNumberTrivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}
  void main() {
    GetConcreteNumberTrivia usecase;
    MockNumberTriviaRepository mockNumberTriviaRepository;

    setUp(() {
      mockNumberTriviaRepository = MockNumberTriviaRepository();
      usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
    });

    final tNumber = 1;
    final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

    test('should get trivia for thenumber from the repository', () async {
      when(mockNumberTriviaRepository.getConcreateNumberTrivia(any))
          .thenAnswer((realInvocation) async =>Right(tNumberTrivia));
      final result=await usecase(number:tNumber);
      expect(result,Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getConcreateNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    });

}
