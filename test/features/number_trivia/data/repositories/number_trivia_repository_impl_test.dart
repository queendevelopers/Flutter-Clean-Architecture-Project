import 'package:flutter_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_clean_architecture/core/platform/number_trivia_local_data_source.dart';
import 'package:flutter_clean_architecture/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_clean_architecture/features/number_trivia/data/repositories/number_trivia_repositoryimpl.dart';
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
}

