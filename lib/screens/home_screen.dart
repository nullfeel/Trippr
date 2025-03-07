import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:trippr/widget/text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trippr/models/category_model.dart';
import 'package:trippr/models/favorite_model.dart';
import 'package:trippr/widget/painter.dart';
import 'package:trippr/widget/midle_text.dart';
import 'package:trippr/routes/app_routes.dart';
import 'details_screen.dart';
import 'package:trippr/models/tab_model.dart';
import 'wrapper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController tabController;
  final EdgeInsetsGeometry padding =
      const EdgeInsets.symmetric(horizontal: 10.0);

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: _buildAppBar(size),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: padding,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    delay: const Duration(milliseconds: 300),
                    child: const AppText(
                      text: "Trippr",
                      size: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 400),
                    child: const AppText(
                      text: "Kelompok 7 loremipsum",
                      size: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: size.height * 0.01, top: size.height * 0.02),
                      child: TextField(
                        style: GoogleFonts.ubuntu(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 240, 240, 240),
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.filter_alt_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          hintStyle: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          hintText: "Discover City",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 600),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      width: size.width,
                      child: Align(
                        alignment: Alignment.center,
                        child: TabBar(
                          tabAlignment: TabAlignment.center,
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          labelPadding: EdgeInsets.only(
                              left: size.width * 0.05,
                              right: size.width * 0.05),
                          controller: tabController,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: const CircleTabBarIndicator(
                            color: Colors.deepPurpleAccent,
                            radius: 4,
                          ),
                          tabs: const [
                            Tab(
                              text: "Places",
                            ),
                            Tab(text: "Inspiration"),
                            Tab(text: "Popular"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 700),
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.01),
                      width: size.width,
                      height: size.height * 0.4,
                      child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: tabController,
                          children: [
                            TabViewChild(
                              list: places,
                            ),
                            TabViewChild(list: inspiration),
                            TabViewChild(list: popular),
                          ]),
                    ),
                  ),
                  FadeInUp(
                      delay: const Duration(milliseconds: 800),
                      child: const MiddleAppText(text: "Find More")),
                  FadeInUp(
                    delay: const Duration(milliseconds: 900),
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.01),
                      width: size.width,
                      height: size.height * 0.12,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryComponents.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            Category current = categoryComponents[index];
                            return Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  width: size.width * 0.16,
                                  height: size.height * 0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Image(
                                      image: AssetImage(
                                        current.image,
                                      ),
                                    ),
                                  ),
                                ),
                                AppText(
                                  text: current.name,
                                  size: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )
                              ],
                            );
                          }),
                    ),
                  ),
                  FadeInUp(
                      delay: const Duration(milliseconds: 1000),
                      child: const MiddleAppText(text: "People Also Like")),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1100),
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.01),
                      width: size.width,
                      height: size.height * 0.68,
                      child: ListView.builder(
                          itemCount: favorite.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Favorite current = favorite[index];
                            return GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                    personData: current,
                                    tabData: null,
                                    isCameFromPersonSection: true,
                                  ),
                                ),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(8.0),
                                width: size.width,
                                height: size.height * 0.15,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Hero(
                                      tag: current.day,
                                      child: Container(
                                        margin: const EdgeInsets.all(8.0),
                                        width: size.width * 0.28,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              current.image,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: size.width * 0.02),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.035,
                                          ),
                                          AppText(
                                            text: current.title,
                                            size: 17,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.005,
                                          ),
                                          AppText(
                                            text: current.location,
                                            size: 14,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontWeight: FontWeight.w300,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height * 0.015),
                                            child: AppText(
                                              text: "${current.day} Day",
                                              size: 14,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize _buildAppBar(Size size) {
    return PreferredSize(
      preferredSize: Size.fromHeight(size.height * 0.09),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainWrapper()),
            ),
          ),
        ],
      ),
    );
  }
}

class TabViewChild extends StatelessWidget {
  const TabViewChild({
    required this.list,
    Key? key,
  }) : super(key: key);

  final List<TabBarModel> list;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: list.length,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        TabBarModel current = list[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(
                personData: null,
                tabData: current,
                isCameFromPersonSection: false,
              ),
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Hero(
                tag: current.image,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(current.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: size.height * 0.2,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: size.width * 0.53,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(153, 0, 0, 0),
                        Color.fromARGB(118, 29, 29, 29),
                        Color.fromARGB(54, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: size.width * 0.07,
                bottom: size.height * 0.045,
                child: AppText(
                  text: current.title,
                  size: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Positioned(
                left: size.width * 0.07,
                bottom: size.height * 0.025,
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    AppText(
                      text: current.location,
                      size: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
