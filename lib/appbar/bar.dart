import 'package:flutter/material.dart';
import 'package:flutter_application_2/traning_cubit/cubit/traning_case_cubit.dart';
import 'package:flutter_application_2/traning_cubit/cubit/traning_case_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data.dart';

class MyFastBar extends StatefulWidget {
  const MyFastBar({super.key});

  @override
  State<MyFastBar> createState() => _MyFastBarState();
}


class _MyFastBarState extends State<MyFastBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TraningCaseCubit, TraningCaseState>(
      builder: (context, state) {
        return DefaultTabController(
          length: appbar.length,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              titleSpacing: 0,
              title: Container(
                  width: double.infinity,
                  height: 70,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Fast Filter Bar',
                    ),
                  )),
              bottom: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(70),
                  ),
                  isScrollable: true,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    for (int i = 0; i < appbar.length; i++)
                      Tab(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Text('${appbar[i]}')),
                      ),
                  ]),
            ),
            body: TabBarView(
              children: [
                for (int i = 0; i < appbar.length; i++)
                  Center(
                    child: Text('${appbar[i]}'),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
