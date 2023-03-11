import 'package:dartz/dartz.dart';
import 'package:flutter_clean/features/historical_price/data/models/historical_price_model.dart';
import 'package:meta/meta.dart';

import '../../../../core/failures.dart';
import '../../../../core/exceptions.dart';

import '../../domain/entities/historical_price.dart';
import '../../domain/repositories/historical_price_repository.dart';
import '../datasources/historical_price_remote_datasource.dart';


class HistoricalPriceRepositoryImpl implements HistoricalPriceRepository {
  final HistoricalPriceRemoteDataSource remoteDataSource;

  HistoricalPriceRepositoryImpl({
    @required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Historical>>> fetchData() async {
    try {
      final remoteData = await remoteDataSource.getHistorical();
      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}