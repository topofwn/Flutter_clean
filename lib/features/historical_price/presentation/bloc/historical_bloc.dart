import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/usecase.dart';
import 'package:flutter_clean/features/historical_price/domain/entities/historical_price.dart';
import 'package:meta/meta.dart';

import '../../../../core/failures.dart';
import '../../domain/usecases/get_historical_price_usecase.dart';
import './bloc.dart';


const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class HistoricalBloc extends Bloc<HistoricalEvent, HistoricalState> {
  final GetHistoricalPriceUseCase getHistoricalPriceUseCase;

  HistoricalBloc({
    @required GetHistoricalPriceUseCase historicalPriceUseCase,
  })  : assert(historicalPriceUseCase != null),
        getHistoricalPriceUseCase = historicalPriceUseCase, super(null);

  HistoricalState get initialState => Empty();

  @override
  Stream<HistoricalState> mapEventToState(
      HistoricalEvent event,
      ) async* {
    if (event is FetchDataEvent) {
      yield Loading();
      final data = await getHistoricalPriceUseCase(NoParams());
      yield data.fold(
            (failure) => Error(message: _mapFailureToMessage(failure)),
            (price) => Loaded(price: price),
      );
    } 
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}