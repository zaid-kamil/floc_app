import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:floc_app/features/presentations/blocs/image_bloc.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageState>(
      builder: (context, state) {
        if (state is ImageLoaded) {
          // categories in scrollable chips
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: state.categories
                  .map((category) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: ActionChip(
                          label: Text(category),
                          onPressed: () {
                            context
                                .read<ImageBloc>()
                                .add(FilterImagesByCategory(category));
                          },
                        ),
                      ))
                  .toList(),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
