import 'package:first_app/cubit/cubit.dart';
import 'package:first_app/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailPage extends StatelessWidget {
  final String category;

  const CategoryDetailPage({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..get(cate: category),
      child: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
        if (state is LoadedState) {
          return Scaffold(
              appBar: AppBar(
                title: Text(category),
              ),
              body: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(state.pr![index].image))),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child:
                                    Text("name : ${state.pr![index].title}")),
                            Text("price : ${state.pr![index].price}"),
                            Text("  "),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("description : ${state.pr![index].desc}"),
                      ],
                    ),
                  );
                },
                itemCount: state.pr!.length,
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ));
        } else if (state is ErrorState) {
          return Scaffold(
            body: Text("Not Found"),
          );
        } else {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      }),
    );
  }
}
