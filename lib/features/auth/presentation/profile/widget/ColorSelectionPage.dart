import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/profile/user_model.dart';
import '../cubit/profile_cubit.dart';

class ColorSelectionPage extends StatelessWidget {
  final List<ColorsModel> colors;

  const ColorSelectionPage({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return _buildColorButton(context, colors[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildColorButton(BuildContext context, ColorsModel colorModel) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ProfileCubit>(context)
            .selectColor(colorModel.color, colorModel.id);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color(int.parse(colorModel.color.replaceFirst('#', '0xFF'))),
        ),
      ),
    );
  }
}
