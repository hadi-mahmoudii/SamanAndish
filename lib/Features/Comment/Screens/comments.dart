import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/Config/app_session.dart';
import '../../../Core/Widgets/flutter_icons.dart';
import '../../../Core/Widgets/global_appbar.dart';
import '../../../Core/Widgets/loading_widget.dart';
import '../Providers/comments.dart';
import '../Widgets/comment_box.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> args =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    return ChangeNotifierProvider<CommentsProvider>(
      create: (ctx) => CommentsProvider(typeId: args[0], commentsType: args[1]),
      child: const CommentsScreenTile(),
    );
  }
}

class CommentsScreenTile extends StatefulWidget {
  const CommentsScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _CommentsScreenTileState createState() => _CommentsScreenTileState();
}

class _CommentsScreenTileState extends State<CommentsScreenTile> {
  @override
  initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<CommentsProvider>(context, listen: false)
          .getDatas(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context).textTheme;
    return Consumer<CommentsProvider>(
      builder: (ctx, provider, _) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => provider.openCommentBox(context),
          backgroundColor: mainFontColor,
          child: const Icon(
            FlutterIcons.plus,
            color: Colors.white,
          ),
        ),
        appBar: const GlobalAppBar(
          eLabel: 'COMMENTS',
          pLabel: 'نظرات کاربران',
        ).build(context),
        body: provider.isLoading
            ? const Center(
                child: LoadingWidget(),
              )
            : NotificationListener(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollUpdateNotification) {
                    if (provider.scrollController.position.pixels >
                            provider.scrollController.position.maxScrollExtent -
                                30 &&
                        !provider.isLoadingMore) {
                      provider.getDatas(context);
                    }
                  }
                  return true;
                },
                child: RefreshIndicator(
                  onRefresh: () async =>
                      provider.getDatas(context, resetPage: true),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      controller: provider.scrollController,
                      children: [
                        const SizedBox(height: 20),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, ind) => CommentBox(
                            comment: provider.comments[ind],
                            themeData: themeData,
                          ),
                          separatorBuilder: (ctx, ind) =>
                              const SizedBox(height: 10),
                          itemCount: provider.comments.length,
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
