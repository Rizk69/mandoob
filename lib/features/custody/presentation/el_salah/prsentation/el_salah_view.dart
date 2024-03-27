import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/features/custody/presentation/cubit/el_salah/el_salah_cubit.dart';
import 'package:mandoob/features/custody/presentation/el_salah/widget/elalah_view_body.dart';

import '../../../../../core/resources/routes_manager.dart';

class ElSalahView extends StatelessWidget {
  ElSalahView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<ElSalahCubit>()..getCartOrder(),
      child: BlocConsumer<ElSalahCubit, ElSalahState>(
        listener: (context, state) {
          if (state is DeleteCartLoadedState) {
            Navigator.pushReplacementNamed(context, Routes.homeRoute);
          }
          if (state is DeleteOneProductCartLoadedState) {
            ElSalahCubit.get(context).getCartOrder();
          }

          if (state is AddCurrencyAndCountLoadedState) {
            print("Success");
          }

           if (state is AddCurrencyAndCountLoadedState) {
             ElSalahCubit.get(context).getCartOrder();
          }
        },
        builder: (context, state) {
          if (state is GetCartLoadedState ||  state is ExpandedState||  state is YourItemAddedState||  state is YourItemRemovedState||  state is ElSalahCurrencyUpdated ) {
            return ElSalahViewBody(
              cartItems: ElSalahCubit.get(context).cart!.data,
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
