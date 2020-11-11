import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PicturePage extends StatefulWidget {
  @override
  _PicturePageState createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  var _scrollController = ScrollController(initialScrollOffset: 0);
  var _imageList = [];
  var _load = 0;
  int _page = 0;

  var _numList = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var px = _scrollController.position.pixels;
      if (px == _scrollController.position.maxScrollExtent) {
        // _onLoadMore();
        _onRefresh();
      }
    });

    _initData(_page);
    _onRefresh();
  }

  Future<void> _initData(int page) async {
    var map = Map();
    map["size"] = 10;
    map["page"] = page;

    // TODO add image to list
    var newList;

    setState(() {
      if (page == 1) {
        _imageList.clear();
      }
      _imageList.addAll(newList);
      if (newList == null || newList.lengt == 0) {
        _load = 3;
      } else {
        _load = 0;
      }
      _page++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("waterfall"),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: StaggeredGridView.countBuilder(
            shrinkWrap: true,
            controller: _scrollController,
            crossAxisCount: 4,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            itemCount: _numList.length,
            itemBuilder: (context, index) {
              return Container(
                  color: Colors.purpleAccent,
                  child: new Center(
                    child: new CircleAvatar(
                      backgroundColor: Colors.white,
                      child: new Text('$index'),
                    ),
                  ));
            },
            staggeredTileBuilder: (index) =>
                StaggeredTile.count(2, index == 0 ? 2 : 3)),
      ),
      // body: CustomScrollView(
      //   controller: _scrollController,
      //   slivers: <Widget>[
      //     SliverToBoxAdapter(
      //       child: RefreshIndicator(
      //         onRefresh: _onRefresh,
      //         child: StaggeredGridView.countBuilder(
      //             shrinkWrap: true,
      //             controller: _scrollController,
      //             crossAxisCount: 4,
      //             crossAxisSpacing: 4,
      //             mainAxisSpacing: 4,
      //             itemCount: 10,
      //             itemBuilder: (context, index) {
      //               return Container(
      //                   color: Colors.purpleAccent,
      //                   child: new Center(
      //                     child: new CircleAvatar(
      //                       backgroundColor: Colors.white,
      //                       child: new Text('$index'),
      //                     ),
      //                   ));
      //             },
      //             staggeredTileBuilder: (index) =>
      //                 StaggeredTile.count(2, index == 0 ? 2 : 3)),
      //       ),
      //     ),
      //   ],
      // ),
      // body: RefreshIndicator(
      //   onRefresh: _onRefresh,
      //   child: StaggeredGridView.countBuilder(
      //     shrinkWrap: true,
      //     controller: _scrollController,
      //     crossAxisCount: 4,
      //     crossAxisSpacing: 4,
      //     mainAxisSpacing: 10,
      //     itemCount: _numList.length,
      //     itemBuilder: (context, index) {
      //       return Container(
      //         color: Colors.green,
      //         child: Center(
      //           child: CircleAvatar(
      //             backgroundColor: Colors.white,
      //             child: Text('$index'),
      //           ),
      //         ),
      //       );
      //     },
      //     staggeredTileBuilder: (index) =>
      //         StaggeredTile.count(2, index == 0 ? 2.5 : 3),
      //   ),
      // ),
    );
  }

  Future<void> _onRefresh() async {
    await Future<Null>.delayed(Duration(seconds: 3), () {
      print("onRefresh is called!");
      setState(() {
        _numList.addAll(List.generate(10, (index) {
          return index;
        }));
      });
    });
  }

  Future<void> _onLoadMore() async {
    if (_load == 3) return;
    setState(() {
      _load = 2;
    });
    await _initData(_page);
    print("loading more data");
  }
}
