import 'package:flutter/material.dart';

import '../../../Core/Config/app_session.dart';
import '../../../Core/Config/routes.dart';
import '../../../Core/Widgets/flutter_icons.dart';
import '../../Product/Models/category.dart';
import '../Models/home_slider.dart';

class HomeHeaderImagesBox extends StatefulWidget {
  const HomeHeaderImagesBox({
    Key? key,
    required this.banners,
  }) : super(key: key);

  final List<HomeSliderModel> banners;
  @override
  State<HomeHeaderImagesBox> createState() => _HomeHeaderImagesBoxState();
}

class _HomeHeaderImagesBoxState extends State<HomeHeaderImagesBox> {
  int _current = 0;
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    // print(widget.banners[_current].image);
    return widget.banners.isNotEmpty
        ? ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.banners.length,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    itemBuilder: (ctx, ind) {
                      String route = '';
                      Object arguments = widget.banners[_current].modelId;
                      switch (widget.banners[_current].type) {
                        case 'article':
                          if (widget.banners[_current].modelId.isEmpty) {
                            route = Routes.blogList;
                          } else {
                            route = Routes.blogDetails;
                          }
                          break;
                        case 'product':
                          if (widget.banners[_current].modelId.isEmpty) {
                            route = Routes.productCategoriesList;
                            arguments = CategoryModel(
                              id: '(null)',
                              name: 'دسته بندی محصولات',
                              nameE: 'CATEGORIES',
                              image: 'null',
                              parentId: 'null',
                              count: '2000',
                            );
                          } else {
                            route = Routes.productDetails;
                          }
                          break;
                        case 'product_category':
                          route = Routes.productListHome;
                          arguments = CategoryModel(
                            id: widget.banners[_current].modelId,
                            name: 'بازگشت',
                            nameE: 'RETURN',
                            image: 'null',
                            parentId: widget.banners[_current].modelId,
                            count: '2000',
                          );
                          break;
                        default:
                      }
                      return InkWell(
                        onTap: () {
                          if (route.isNotEmpty) {
                            Navigator.of(context)
                                .pushNamed(route, arguments: arguments);
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.banners[ind].image,
                            width: MediaQuery.of(context).size.width - 40,
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }
                    // options: CarouselOptions(
                    //   onPageChanged: (index, reason) {
                    //     setState(() {
                    //       _current = index;
                    //     });
                    //   },
                    //   viewportFraction: 1.0,
                    //   enlargeCenterPage: false,
                    // ),
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
                        // duration: const Duration(milliseconds: 50),
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
                    children: widget.banners.asMap().entries.map((entry) {
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
                        // duration: const Duration(milliseconds: 50),
                        // curve: Curves.linear,
                      );
                      setState(() {
                        if (_current < widget.banners.length - 1) {
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
