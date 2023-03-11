import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Historical extends Equatable {
  final String date;
  final double open;
  final double high;
  final double low;
  final double close;
  final double adjClose;
  final int volume;
  final int unadjustedVolume;
  final double change;
  final double changePercent;
  final double vwap;
  final String label;
  final double changeOverTime;

  Historical({
    this.date,
    this.open,
    this.high,
    this.low,
    this.adjClose,
    this.close,
    this.volume,
    this.unadjustedVolume,
    this.change,
    this.changePercent,
    this.vwap,
    this.label,
    this.changeOverTime,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
    date,
    open,
    high,
    low,
    adjClose,
    close,
    volume,
    unadjustedVolume,
    change,
    changePercent,
    vwap,
    label,
    changeOverTime,
  ];
}