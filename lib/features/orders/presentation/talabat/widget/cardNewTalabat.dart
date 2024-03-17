import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/newTalabatCubit.dart';

class CardNewTalabat extends StatelessWidget {
  const CardNewTalabat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTalabatCubit, int>(
      builder: (context, count) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 8,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.blue,
                    width: 4,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/prduct.jpg',
                    height: 50,
                    width: 50,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      'شامبو حجم وسط',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<NewTalabatCubit>().increment();
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        '$count',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<NewTalabatCubit>().decrement();
                        },
                        icon: Icon(
                          Icons.remove,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        'وحدة ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  )
                ],
              ),
              Spacer(),
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            ],
          ),
        );
      },
    );
  }
}
