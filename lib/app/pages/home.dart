import 'package:domain_name_generator/app/pages/dn_generator.dart';
import 'package:domain_name_generator/misc/Colors.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PageHomeState();
}

class PageHomeState extends State<PageHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TabBar(
        controller: _tabController,
        indicatorColor: MyColors.primarySelection,
        tabs: const [
          Tab(
            icon: Icon(
              Icons.stream,
              color: MyColors.primary,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.title,
              color: MyColors.primary,
            ),
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const PageDnGenerator(),
          _buildEmptyPagePlaceholder(),
        ],
      ),
    );
  }

  Widget _buildEmptyPagePlaceholder() {
    return const Center(
      child: Text("there will be\nsome functionality"),
    );
  }
}
