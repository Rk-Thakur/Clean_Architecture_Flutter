import 'dart:developer';

import 'package:firstapplication/core/routing/routes.dart';
import 'package:firstapplication/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:firstapplication/features/homepage/presentation/bloc/homepage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Page"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, CleanRouting.secondpage);
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      body: BlocBuilder<HomepageBloc, HomePageState>(
        builder: (context, state) {
          if (state.postStatus == PostStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          } else if (state.postStatus == PostStatus.fetched) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 20,
                  );
                },
                itemCount: state.post.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CleanRouting.thirdPage, arguments: {
                        "id": state.post[index].id,
                      });
                    },
                    child: ListTile(
                      tileColor: Colors.grey,
                      title: Text(state.post[index].title.toString()),
                      subtitle: Text(state.post[index].body ?? 'body'),
                    ),
                  );
                },
              ),
            );
          } else if (state.postStatus == PostStatus.failure) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          log('Get Post Event is Triggered!!!');
          context.read<HomepageBloc>().add(GetPostEvent());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
