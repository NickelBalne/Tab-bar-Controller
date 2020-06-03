import 'package:flutter/material.dart';

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({Key key}) : super(key: key);

  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'LEFT'),
    new Tab(text: 'RIGHT'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        actions: [
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () {
              print("Search Tapped");
//            print("TabControllerIndex:${_tabController.index}");
//            print("TabControllerIndex:${_tabController.index + 1}");
//            print("TabControllerIndexAfter:${((_tabController.index + 1) % 2)}");
            _tabController.animateTo((_tabController.index + 1) % 2);
//              _tabController.animateTo(0);
            },
          ),
        ],
//        bottom: ,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.pink,
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            child: new TabBar(
              controller: _tabController,
              tabs: myTabs,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.lightGreen,
              child: new TabBarView(
                controller: _tabController,
                children: [
                  Text("HelloHelloHelloHelloHelloHelloHelloHello"),
                  Text("WorldWorldWorldWorldWorldWorldWorldWorld"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

