import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/get_all_post/get_all_notifire.dart';
import '../../provider/get_all_post/get_all_post_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GetAllNotifier getAllNotifier;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getAllNotifier = Provider.of<GetAllNotifier>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog App'),
        centerTitle: true,
      ),
      body: Consumer<GetAllNotifier>(
        builder: (_, getAllNotifier, __) {
          GetAllPostState getAllPostState = getAllNotifier.getAllPostState;
          if (getAllPostState is GetAllPostSuccess) {
            // getAllNotifier.getAllPosts();
            final getAllPostList = getAllPostState.getAllPostList;

            return ListView.builder(
              itemCount: getAllPostList.length,
              itemBuilder: (context, index) {
                final getAllPost = getAllPostList[index];
                return InkWell(
                  onTap: () {},
                  child: Card(
                    child: ListTile(
                      title: Text('${getAllPost.title}'),
                    ),
                  ),
                );
              },
            );
          } else if (getAllPostState is GetAllPostFailed) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Oops something wrong',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
                const Divider(),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.yellow),
                    foregroundColor: MaterialStatePropertyAll(Colors.blue),
                  ),
                  onPressed: () {
                    // Provider.of<GetAllNotifier>(context)
                    //     .getAllPosts();
                  },
                  child: const Text('Try again'),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
