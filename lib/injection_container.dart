
import 'package:flutter_clean/features/historical_price/data/datasources/historical_price_remote_datasource.dart';
import 'package:flutter_clean/features/historical_price/data/repositories/historical_price_repository_impl.dart';
import 'package:flutter_clean/features/historical_price/domain/repositories/historical_price_repository.dart';
import 'package:flutter_clean/features/historical_price/domain/usecases/get_historical_price_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'features/historical_price/presentation/bloc/historical_bloc.dart';


final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
        () => HistoricalBloc(
          historicalPriceUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetHistoricalPriceUseCase(sl()));


  // Repository
  sl.registerLazySingleton<HistoricalPriceRepository>(
        () => HistoricalPriceRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<HistoricalPriceRemoteDataSource>(
        () => HistoricalPriceRemoteDataSourceImpl(client: sl()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}