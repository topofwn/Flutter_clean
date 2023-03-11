
import 'package:equatable/equatable.dart';
import 'package:flutter_clean/features/historical_price/domain/entities/historical_price.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HistoricalState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends HistoricalState {}

class Loading extends HistoricalState {}

class Loaded extends HistoricalState {
  final List<Historical> price;

  Loaded({@required this.price});

  @override
  List<Object> get props => [price];
}

class Error extends HistoricalState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}