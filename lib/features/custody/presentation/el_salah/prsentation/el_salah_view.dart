import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/features/custody/presentation/cubit/el_salah/el_salah_cubit.dart';
import 'package:mandoob/features/custody/presentation/el_salah/widget/elalah_view_body.dart';

class ElSalahView extends StatelessWidget {
  ElSalahView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<ElSalahCubit>()..getCartOrder(),
      child: BlocConsumer<ElSalahCubit, ElSalahState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          bool isLoading = false;
          if (state is GetCartLoadingState) {
            isLoading = true;
          }
          if( state is GetCartLoadedState) {
            return ElSalahViewBody(
            cartItems: ElSalahCubit.get(context).cart!.data!,
            isLoading: isLoading,
          );
          }
          else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator(),),
            );
          }
        },
      ),
    );
  }
}
