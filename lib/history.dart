import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idental_n_patient/shared/components/components.dart';
import 'package:idental_n_patient/shared/cubit/cubit.dart';
import 'package:idental_n_patient/shared/cubit/states.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..getPatientReports(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetReportSuccessState) {
              return Scaffold(
                  body: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => buildReportItem(
                                context: context,
                                dentistname: state.reports[index]
                                    ['dentistname'],
                                patientname: state.reports[index]
                                    ['patientname'],
                                observation: state.reports[index]
                                    ['observation']),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20.0,
                            ),
                            itemCount: state.reports.length,
                          ),
                        ],
                      )));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
