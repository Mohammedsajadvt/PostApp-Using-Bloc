import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postblocapp/application/core/services/theme_service.dart';
import 'package:postblocapp/application/features/posts/postbloc/postbloc_bloc.dart';
import 'package:provider/provider.dart';

class PostWrapper extends StatelessWidget {
  const PostWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostblocBloc(),
      child: const PostsPage(),
    );
  }
}

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PostblocBloc>().add(PostRequestedEvent());
    });
    final themedata = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PostApp Using Bloc",
          style: themedata.textTheme.titleMedium,
        ),
        actions: [
          Switch(
              activeColor: Colors.green,
              inactiveTrackColor: Colors.blueGrey,
              inactiveThumbColor: Colors.black87,
              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              value: Provider.of<ThemeServiceProvider>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeServiceProvider>(context, listen: false)
                    .toggleTheme();
              }),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Posts',
              style: themedata.textTheme.displayLarge,
            ),
            Expanded(child:
                BlocBuilder<PostblocBloc, PostState>(builder: (context, state) {
              if (state is PostInitial) {
                return const Text("Post are waiting to be loaded");
              } else if (state is PostStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.pink,
                  ),
                );
              } else if (state is PostStateLoaded) {
                return ListView.builder(
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Center(
                              child: Text("${index + 1}"),
                            ),
                          ),
                          title: Text("${state.posts![index].title}"),
                          subtitle: Text("${state.posts![index].body}"),
                        ),
                      );
                    });
              } else if (state is PostStateError) {
                return Center(
                  child: Text(state.msg),
                );
              }
              return const Center(
                child: Text("Some error occured"),
              );
            })),
          ],
        ),
      ),
    );
  }
}
