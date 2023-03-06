import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(toolbarHeight: 0),
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverAppBar(
          expandedHeight: 300,
          elevation: 0,
          stretch: true,
          pinned: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.zoomBackground,
              // StretchMode.blurBackground,
            ],
            background: Image.asset("assets/feature.png", fit: BoxFit.cover),
          ),
        ),
        SliverAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          pinned: true,
          stretch: true,
          elevation: 0,
          toolbarHeight: 80,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(-10),
            child: SizedBox(),
          ),
          flexibleSpace: const SearchBar(),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 12),
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                            color: const Color(0xff243A73).withOpacity(.3),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                childCount: 8))
      ]),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(22),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade700),
          borderRadius: BorderRadius.circular(8)),
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
            hintText: "Restaurant or dish",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey.shade700,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
