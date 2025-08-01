import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  Function onTap;

  CategoriesSection({required this.onTap, super.key});

  List<String> categories = [
    "general",
    "business",
    "sports",
    "health",
    "entertainment",
    "technology",
    "science",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: TextStyle(fontSize: 26),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 8,
              ),
              itemBuilder: (context, index) {
                return Stack(
                  alignment: !index.isOdd
                      ? Alignment.bottomRight
                      : Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                            "assets/images/${categories[index]}.png")),
                    InkWell(
                      onTap: () {
                        onTap(categories[index]);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            right: !index.isOdd ? 18 : 0,
                            left: index.isOdd ? 18 : 0,
                            bottom: 18),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(24)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: !index.isOdd
                              ? [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    child: Text(
                                      "View All",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 25,
                                    child: Icon(Icons.arrow_forward_ios),
                                  )
                                ]
                              : [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 25,
                                    child: Icon(Icons.arrow_back_ios),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    child: Text(
                                      "View All",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                        ),
                      ),
                    )
                  ],
                );
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
