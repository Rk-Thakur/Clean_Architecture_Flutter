// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firstapplication/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:firstapplication/features/homepage/presentation/bloc/homepage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  void initState() {
    context.read<HomepageBloc>().add(GetCommentByIdEvent(
          id: widget.id,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment By ${widget.id} From First Page"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
      ),
      body: BlocBuilder<HomepageBloc, HomePageState>(builder: (context, state) {
        if (state.postStatus == PostStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.pink,
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
                    trailing: Text(state.comment[index].postId.toString()),
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
