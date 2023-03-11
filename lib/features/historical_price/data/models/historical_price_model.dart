import 'package:equatable/equatable.dart';
import 'package:flutter_clean/features/historical_price/domain/entities/historical_price.dart';
import 'package:meta/meta.dart';

class HistoricalModel extends Historical {
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

  HistoricalModel({
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
  }) : super(date: date, open: open, high: high, low: low, adjClose: adjClose, close: close,
  volume: volume, unadjustedVolume: unadjustedVolume, changeOverTime: changeOverTime, change: change,
  changePercent: changePercent, vwap: vwap, label: label);


  factory HistoricalModel.fromJson(Map<String, dynamic> json) {
    return HistoricalModel(
      date: json['date'],
      open: json['open'],
      high: json['high'],
      low: json['low'],
      adjClose: json['adjClose'],
      close: json['close'],
      volume: json['volume'],
      unadjustedVolume: json['unadjustedVolume'],
      change: json['change'],
      changePercent: json['changePercent'],
      vwap: json['vwap'],
      label: json['label'],
      changeOverTime: json['changeOverTime'],
    );
  }

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