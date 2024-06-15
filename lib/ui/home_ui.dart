import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_api/bloc/post_bloc.dart';
import 'package:get_api/utils/enums.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<PostBloc>().add(PostFetchedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Post Api'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return const CircularProgressIndicator();
            case PostStatus.failure:
              return Text(state.message.toString());
            case PostStatus.success:
              return ListView.builder(
                itemBuilder: (context, index) {
                  final item = state.postList[index];
                  return ListTile(
                    title: Text(item.title.toString()),
                    subtitle: Text(item.body.toString()),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
