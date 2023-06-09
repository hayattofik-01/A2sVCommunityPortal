import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/core/network/network_info.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/contest/data/datasources/contest_remote_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/entities/contest.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/repository/contest_repository.dart';
import 'package:dartz/dartz.dart';

class ContestRepositoryImpl implements ContestRepository {
  final ContestRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ContestRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Contest>>> getPastContests() async {
    if (await networkInfo.isConnected) {
      try {
        final contests = await remoteDataSource.getPastContests();
        return Right(contests);
      } on ServerException {
        return const Left(ServerFailure(serverFaliure));
      }
    } else {
      return const Left(NoConnectionFailure(noConnectionError));
    }
  }

  @override
  Future<Either<Failure, List<Contest>>> getUpcomingContests() async {
    if (await networkInfo.isConnected) {
      try {
        final contests = await remoteDataSource.getUpcomingContests();
        return Right(contests);
      } on ServerException {
        return const Left(ServerFailure(serverFaliure));
      }
    } else {
      return const Left(NoConnectionFailure(noConnectionError));
    }
  }
}
