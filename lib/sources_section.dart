import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/repository/home_repo_local_impl.dart';
import 'package:news/repository/home_repo_remote_impl.dart';


import 'bloc/cubit.dart';
import 'bloc/states.dart';
import 'news_item.dart';

class SourcesSection extends StatelessWidget {
  String catId;
  Function onTap;

  SourcesSection({required this.catId, required this.onTap, super.key});

  bool hasInternet = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
          homeRepo: hasInternet ? HomeRepoRemoteImpl() : HomeRepoLocalImpl())
        ..getSources(catId),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is GetNewsDataErrorState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.error),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Ok"))
                ],
              ),
            );
          } else if (state is GetSourcesErrorState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.error),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        onTap();
                      },
                      child: Text("Ok"))
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          var list = HomeCubit.get(context).sourceResponse?.sources ?? [];
          var articles =
              HomeCubit.get(context).newsDataResponse?.articles ?? [];
          if (state is GetSourcesLoadingState ||
              state is GetNewsDataLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                DefaultTabController(
                    length: list.length,
                    initialIndex: HomeCubit.get(context).selectedIndex,
                    child: TabBar(
                        onTap: (value) {
                          HomeCubit.get(context).changeSelectedSource(value);
                        },
                        dividerColor: Colors.transparent,
                        indicatorColor: Color(0xFF171717),
                        labelColor: Color(0xFF171717),
                        isScrollable: true,
                        tabs: list
                            .map((element) => Tab(
                                  text: element.name,
                                ))
                            .toList())),
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsItem(
                      article: articles[index],
                    );
                  },
                  itemCount: articles.length,
                ))
              ],
            );
          }
        },
      ),
    );
  }
}
