import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/invoices/presentation/cubit/fawater_cubit.dart';
import 'package:mandoob/features/invoices/presentation/cubit/invoice_state.dart';
import 'package:mandoob/features/invoices/presentation/widget/supplier_invoice.dart';
import 'package:mandoob/features/invoices/presentation/widget/trader_invoice.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InvoiceView extends StatelessWidget {
  const InvoiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InvoiceViewBody();
  }
}

class InvoiceViewBody extends StatelessWidget {
  InvoiceViewBody({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _textEditingController =
      TextEditingController(); // Create a text editing controller

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<FawaterViewCubit>()
        ..getFawaterTraderInvoice()
        ..getFawaterSupplierInvoice(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ColorManager.transparent,
        drawer: buildDrawer(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: BlocBuilder<FawaterViewCubit, FawaterViewState>(
              builder: (context, state) {
                if (state is LoadedSupplierInvoiceState ||
                    state is LoadedTraderInvoiceState) {
                  var supplierInvoiceModel =
                      FawaterViewCubit.get(context).supplierInvoiceModel;
                  var traderInvoiceModel =
                      FawaterViewCubit.get(context).filteredTraderInvoices;

                  if (supplierInvoiceModel == null) {
                    return  Center(child: Text(LocaleKeys.EMPTY_LIST.tr(),));
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: AppSize.s8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                            icon: Icon(
                              Icons.menu,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                          Center(
                            child: Text(
                              LocaleKeys.invoices.tr(),
                              style: getBoldSegoeStyle(
                                fontSize: 25,
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                          ),
                          SizedBox()
                        ],
                      ),
                      SizedBox(height: AppSize.s4.h),
                      TextFormField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () async {
                              final pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );

                              if (pickedDate != null) {
                                final formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);

                                _textEditingController.text = formattedDate;

                                FawaterViewCubit.get(context)
                                    .searchInvoicesByQuery(
                                        formattedDate); // Correct search call
                              }
                            },
                          ),
                          hintText: LocaleKeys.searchHere.tr(),
                          filled: true,
                          fillColor: Theme.of(context).primaryColorDark,
                          hintStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onChanged: (value) {
                          FawaterViewCubit.get(context).searchInvoicesByQuery(
                              value); // Correct trigger on text change
                        },
                      ),
                      SizedBox(height: AppSize.s6.h),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: ColorManager.shadowColor,
                              blurRadius: 9,
                              spreadRadius: 8,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            DefaultTabController(
                              length: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  TabBar(
                                    indicatorColor: Colors.black,
                                    tabs: [
                                      Tab(
                                        child: Text(
                                          LocaleKeys.traderInvoices.tr(),
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .primaryColor, // Change this to your desired text color
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          LocaleKeys.todayInvoice.tr(),
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .primaryColor, // Change this to your desired text color
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppSize.s70.h,
                                    child: TabBarView(
                                      children: [
                                        ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const ClampingScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return TraderInvoice(
                                                  traderInvoiceModel:
                                                      traderInvoiceModel,
                                                  index: index);
                                            },
                                            itemCount:
                                                traderInvoiceModel.length ?? 0),
                                        ListView.builder(
                                            itemBuilder: (context, index) =>
                                                SupplierInvoice(
                                                  supplierInvoiceModel:
                                                      supplierInvoiceModel,
                                                ),
                                            itemCount: 1)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state is LoadingSupplierInvoiceState ||
                    state is LoadingTraderInvoiceState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.1,
                      ),
                      const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.1,
                      ),
                      Center(
                        child: Container(),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget columnCard(
      {required String title, required Color colorTitle, required String des}) {
    return Column(
      children: [
        Text(title, style: getBoldInterStyle(color: colorTitle, fontSize: 27)),
        Text(des,
            style: getBoldInterStyle(color: ColorManager.gray, fontSize: 20))
      ],
    );
  }
}
