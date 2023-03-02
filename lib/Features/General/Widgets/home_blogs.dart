import 'package:flutter/material.dart';

import '../../../Core/Config/app_session.dart';
import '../../../Core/Widgets/flutter_icons.dart';
import '../../Blog/Models/blog.dart';
import 'blog_overview_row.dart';

class HomeBlogsWidget extends StatefulWidget {
  const HomeBlogsWidget({
    Key? key,
    required this.themeData,
    required this.blogs,
  }) : super(key: key);

  final TextTheme themeData;
  final List<List<BlogModel>> blogs;

  @override
  State<HomeBlogsWidget> createState() => _HomeBlogsWidgetState();
}

class _HomeBlogsWidgetState extends State<HomeBlogsWidget> {
  final ScrollController _controller = ScrollController();
  // ignore: prefer_final_fields
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return widget.blogs.isNotEmpty
        ? ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SizedBox(
                height: 220,
                // width: 100,
                child: ListView.builder(
                  controller: _controller,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, ind) => SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HomeBlogOverviewRow(
                            blog: widget.blogs[ind][0],
                            themeData: widget.themeData),
                        const SizedBox(width: 10),
                        widget.blogs[ind].length > 1
                            ? HomeBlogOverviewRow(
                                blog: widget.blogs[ind][1],
                                themeData: widget.themeData)
                            : Container(),
                      ],
                    ),
                  ),
                  itemCount: widget.blogs.length,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () async {
                      _controller.jumpTo(
                        _controller.position.pixels -
                            MediaQuery.of(context).size.width +
                            40,
                        // duration: const Duration(milliseconds: 300),
                        // curve: Curves.linear,
                      );
                      setState(() {
                        if (_current > 0) {
                          _current--;
                        }
                      });
                    },
                    icon: const Icon(
                      FlutterIcons.left_chevron,
                      size: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.blogs.asMap().entries.map((entry) {
                      return GestureDetector(
                        // onTap: () => _controller.jumpToPage(entry.key),
                        child: Container(
                          width: 10.0,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: _current != entry.key
                                ? Colors.grey.withOpacity(.5)
                                : mainFontColor,
                          ),
                          child: const Text(' '),
                        ),
                      );
                    }).toList(),
                  ),
                  IconButton(
                    onPressed: () async {
                      _controller.jumpTo(
                        _controller.position.pixels +
                            MediaQuery.of(context).size.width -
                            40,
                        // duration: const Duration(milliseconds: 300),
                        // curve: Curves.linear,
                      );
                      setState(() {
                        if (_current < widget.blogs.length - 1) {
                          _current++;
                        }
                      });
                    },
                    icon: const Icon(
                      FlutterIcons.right_chevron,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          )
        : Container();
  }
}
