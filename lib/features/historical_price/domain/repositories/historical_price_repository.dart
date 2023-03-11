import 'package:dartz/dartz.dart';

import '../../../../core/failures.dart';
import '../entities/historical_price.dart';

abstract class HistoricalPriceRepository {
  Future<Either<Failure, List<Historical>>> fetchData();
}