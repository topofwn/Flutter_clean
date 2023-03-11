import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HistoricalEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchDataEvent extends HistoricalEvent {

}
