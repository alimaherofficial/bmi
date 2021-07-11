import 'package:bmi/layout/news_app/cubit/cubit.dart';
import 'package:bmi/layout/news_app/cubit/states.dart';
import 'package:bmi/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return articaleBuilder(list, context);
      },
    );
  }
}
