import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_clean_architecture/core/platform/number_trivia_local_data_source.dart';
import 'package:flutter_clean_architecture/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_clean_architecture/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_clean_architecture/features/number_trivia/data/repositories/number_trivia_repositoryimpl.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRemoteDataSouce extends Mock implements NumberTriviaRemoteDataSource{}
class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource{}
class MockNetworkInfo extends Mock implements NetworkInfo{}

void main(){
  NumberTriviaRepositoryImplementation numberTriviaRepositoryImplementation;
  MockRemoteDataSouce mockRemoteDataSouce;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSouce =MockRemoteDataSouce();
    mockLocalDataSource= MockLocalDataSource();
    mockNetworkInfo=MockNetworkInfo();
    numberTriviaRepositoryImplementation =NumberTriviaRepositoryImplementation(
      remoteDataSource: mockRemoteDataSouce,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,

    );
  });


  group('getConcreteNumberTrivia', (){
    final tNumber=1;
    final tNumberTriviaModel= NumberTriviaModel(number:tNumber,text:'test');
    final NumberTrivia tNumberTrivia=tNumberTriviaModel;

    test('should check if the device is online',()async{
      when(mockNetworkInfo.isConnected).thenAnswer((realInvocation) async => true);

      numberTriviaRepositoryImplementation.getConcreteNumberTrivia(tNumber);
      verify(mockNetworkInfo.isConnected);
    });


    group('device is online', (){
      setUp((){
        when(mockNetworkInfo.isConnected).thenAnswer((realInvocation) async => true);
      });


      test('should return remote data when the call to remote data  source is success',() async{
        when(mockRemoteDataSouce.getConcreteNumberTrivia(any)).thenAnswer((realInvocation)async => tNumberTriviaModel);
        final result=await numberTriviaRepositoryImplementation.getConcreteNumberTrivia(tNumber);
        verify(mockRemoteDataSouce.getConcreteNumberTrivia(tNumber));
        // verify(mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));
        expect(result,equals(Right(tNumberTrivia)));
        // verifyZeroInteractions(mockRemoteDataSouce);
        // expect(result, equals(Right(tNumberTrivia)));


      });

    });

    group('device is offline', (){
      setUp((){
        when(mockNetworkInfo.isConnected).thenAnswer((realInvocation) async => false);
      });

      // // test('should cache the data locally when the call to remote data  source is success',() async{
      // //   when(mockRemoteDataSouce.getConcreteNumberTrivia(any)).thenAnswer((realInvocation)async => tNumberTriviaModel);
      // //   final result =await numberTriviaRepositoryImplementation.getConcreteNumberTrivia(tNumber);
      // //
      // //   // expect(result,equals(Right(tNumberTrivia)));
      // //   verifyZeroInteractions(mockRemoteDataSouce);
      // //   verify(mockLocalDataSource.getLastNumberTrivia());
      // //   expect(result, equals(Right(tNumberTrivia)));
      //
      //
      // });

    });
  });

}

