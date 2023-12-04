import 'package:firstapplication/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:firstapplication/features/homepage/presentation/bloc/homepage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    context.read<HomepageBloc>().add(GetCommentEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
          ),
        ),
      ),
      body: BlocBuilder<HomepageBloc, HomePageState>(builder: (context, state) {
        if (state.postStatus == PostStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        } else if (state.postStatus == PostStatus.fetched) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 20,
                  );
                },
                itemCount: state.comment.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: Text(state.comment[index].id.toString()),
                    tileColor: Colors.grey,
                    title: Text(state.comment[index].name ?? 'Name'),
                    subtitle: Text(state.comment[index].body ?? 'body'),
                  );
                }),
          );
        } else if (state.postStatus == PostStatus.failure) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
