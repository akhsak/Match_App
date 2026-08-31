// import '../../domain/entities/match.dart';
// import '../../domain/repositories/match_repository.dart';
// import '../datasources/match_remote_data_source.dart';

// class MatchRepositoryImpl implements MatchRepository {
//   const MatchRepositoryImpl({required this.remoteDataSource});

//   final MatchRemoteDataSource remoteDataSource;

//   @override
//   Future<Match> getMatch() async {
//     final response = await remoteDataSource.fetchMatch();
//     return Match(
//       id: response['id']?.toString() ?? 'match_1',
//       name: response['name']?.toString() ?? 'Preview Match',
//       score: response['score'] as int? ?? 0,
//     );
//   }
// }
