

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/features/historical_price/presentation/bloc/bloc.dart';

import '../../../../injection_container.dart';

class HistoricalPricePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HistoricalPricePageState();
  }

}

class HistoricalPricePageState extends State<HistoricalPricePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Historical Price App Demo'),
     ),
     body: Container(
       child: buildBody(context),
     )
   );
  }

  BlocProvider<HistoricalBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HistoricalBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              // Top half
              BlocBuilder<HistoricalBloc, HistoricalState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Click button to fetch historical price"),
                          SizedBox(height: 30,),
                          InkWell(
                            onTap: () => dispatchFetchData(),
                            radius: 8,
                            splashColor: Colors.redAccent,
                            child: Center(
                              child: Text('Click me'),
                            ),
                          )
                        ],
                      ),
                    );
                  } else if (state is Loading) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    );
                  } else if (state is Loaded) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Click button to fetch historical price"),
                          SizedBox(height: 30,),
                          InkWell(
                            radius: 8,
                            onTap: () => dispatchFetchData(),
                            splashColor: Colors.redAccent,
                            child: Center(
                              child: Text('Click me'),
                            ),
                          )
                        ],
                      ),
                    );
                  } else if (state is Error) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Have error, click button again"),
                          SizedBox(height: 30,),
                          InkWell(
                            radius: 8,
                            onTap: () => dispatchFetchData(),
                            splashColor: Colors.redAccent,
                            child: Center(
                              child: Text('Click me'),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dispatchFetchData() {
    BlocProvider.of<HistoricalBloc>(context)
        .add(FetchDataEvent());
  }

}