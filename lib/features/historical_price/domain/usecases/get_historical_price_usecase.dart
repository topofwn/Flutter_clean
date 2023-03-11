import 'package:dartz/dartz.dart';

import '../../../../core/failures.dart';
import '../../../../core/usecase.dart';
import '../entities/historical_price.dart';
import '../repositories/historical_price_repository.dart';

class GetHistoricalPriceUseCase implements UseCase<Historical, NoParams> {
  final HistoricalPriceRepository repository;

  GetHistoricalPriceUseCase(this.repository);

  @override
  Future<Either<Failure, List<Historical>>> call(NoParams params) async {
    return await repository.fetchData();
  }
}