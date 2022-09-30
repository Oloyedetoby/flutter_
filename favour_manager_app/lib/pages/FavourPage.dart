import 'package:flutter/material.dart';

class FavorsPage extends StatefulWidget {
  final List<Favor> pendingAnswerFavors;
  final List<Favor> acceptedFavors;
  final List<Favor> completedFavors;
  final List<Favor> refusedFavors;

  const FavorsPage({
    Key? key,
    required this.pendingAnswerFavors,
    required this.acceptedFavors,
    required this.completedFavors,
    required this.refusedFavors,
  }) : super(key: key);

  @override
  State<FavorsPage> createState() => _FavorsPageState();
}

class _FavorsPageState extends State<FavorsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Your favors"),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              _buildCategoryTab("Requests"),
              _buildCategoryTab("Doing"),
              _buildCategoryTab("Completed"),
              _buildCategoryTab("Refused"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _favorsList("Pending Requests", widget.pendingAnswerFavors),
            _favorsList("Doing", widget.acceptedFavors),
            _favorsList("Completed", widget.completedFavors),
            _favorsList("Refused", widget.refusedFavors),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Ask a favor',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class Favor {}

Widget _buildCategoryTab(String title) {
  return Tab(
    child: Text(title),
  );
}

Widget _favorsList(String title, List<Favor> favors) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Text(title),
      ),
      Expanded(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: favors.length,
          itemBuilder: (BuildContext context, int index) {
            final favor = favors[index];
            return Card(
              key: ValueKey(favor.uuid),
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    _itemHeader(favor),
                    Text(favor.description),
                    _itemFooter(favor)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

Row _itemHeader(Favor favor) {
  return Row(
    children: <Widget>[
      CircleAvatar(
        backgroundImage: NetworkImage(
          favor.friend.photoURL,
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("${favor.friend.name} asked you to..."),
        ),
      )
    ],
  );
}

Widget _itemFooter(Favor favor) {
  if (favor.isCompleted) {
    final format = DateFormat();
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      alignment: Alignment.centerRight,
      child: Chip(
        label: Text("Completed at:${format.format(favor.completed)}"),
      ),
    );
  }
  if (favor.isRequested) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TextButton(
          child: const Text("Refuse"),
          onPressed: () {},
        ),
        TextButton(
          child: const Text("Do"),
          onPressed: () {},
        )
      ],
    );
  }
  if (favor.isDoing) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TextButton(
          child: const Text("give up"),
          onPressed: () {},
        ),
        TextButton(
          child: const Text("complete"),
          onPressed: () {},
        )
      ],
    );
  }
  return Container();
}
