import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<dynamic, dynamic> grid_lst = {
    0: {
      "image": 'redmagic5g.jpg',
      'rating': 5,
      'review': 23,
      'text': 'Red Magic 5g'
    },
    1: {
      "image": 'asusrog5.jpg',
      'rating': 5,
      'review': 23,
      'text': 'Asus Rog 5'
    },
    2: {
      "image": 'blackshark4.jpg',
      'rating': 5,
      'review': 23,
      'text': 'Black Shark 4'
    },
    3: {"image": 'mi10.jpg', 'rating': 5, 'review': 23, 'text': 'Mi 10'},
    4: {"image": 'mi11.jpg', 'rating': 5, 'review': 23, 'text': 'Mi 11'},
    5: {
      "image": 'note20.jpeg',
      'rating': 5,
      'review': 23,
      'text': 'Note 20 Ultra'
    },
    6: {
      "image": 'oneplus7pro.jpg',
      'rating': 5,
      'review': 23,
      'text': 'Oneplus 7pro'
    },
    7: {
      "image": 'oneplusnord.jpg',
      'rating': 5,
      'review': 23,
      'text': 'Oneplus Nord'
    },
    8: {
      "image": 'realmex3.jpg',
      'rating': 5,
      'review': 23,
      'text': 'Realme X3'
    },
    9: {
      "image": 'realme85g.jpg',
      'rating': 5,
      'review': 23,
      'text': 'Realme 8 5g'
    },
  };

  Map<dynamic, dynamic> catogaries_lst = {
    0: {'icon': Icons.wash, 'text': 'Clothes', 'item': '5'},
    1: {
      'icon': Icons.electrical_services_sharp,
      'text': 'Electricity',
      'item': '5'
    },
    2: {'icon': Icons.chair_alt, 'text': 'Householdes', 'item': '5'},
    3: {
      'icon': Icons.electrical_services_sharp,
      'text': 'Apliences',
      'item': '5'
    },
    4: {'icon': Icons.arrow_right_alt_outlined, 'text': 'More', 'item': '5'},
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6ff7b8),
        titleSpacing: 2,
        title: Text("Gamming Mobiles"),
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.account_circle_rounded,
            size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.notifications_rounded,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 285,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: grid_lst.keys.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.94,
                        child: card_tile(
                            context,
                            0.34,
                            grid_lst[index]['image'],
                            grid_lst[index]['text'],
                            grid_lst[index]['rating'],
                            grid_lst[index]['review']));
                  }),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                'More Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ),
            Container(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: catogaries_lst.keys.length,
                    itemBuilder: (context, index) {
                      return catogaries_tile(
                        context,
                        catogaries_lst[index]['text'],
                        catogaries_lst[index]['item'],
                        catogaries_lst[index]['icon'],
                      );
                    })),
            Container(
              margin: EdgeInsets.only(left: 10, bottom: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Items',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  Text('View More',
                      style: TextStyle(fontSize: 14, color: Colors.redAccent)),
                ],
              ),
            ),
            grid_product(context, grid_lst)
          ],
        ),
      ),
    );
  }
}

Widget grid_product(context, lst) {
  return GridView.count(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    crossAxisCount: 2,
    crossAxisSpacing: 5,
    mainAxisSpacing: 5,
    children: List.generate(lst.keys.length, (index) {
      var rating = lst[index]['rating'];
      var review = lst[index]['review'];
      var text_ = lst[index]['text'];
      return card_tile(
          context, 0.16, lst[index]['image'], text_, rating, review);
    }),
  );
}

Widget card_tile(context, imageSize, image_, text_, rating, review) {
  return Card(
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * imageSize,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(image_)),
                ),
              )),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Text(
              text_,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 30,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: rating,
                    itemBuilder: (context, index) {
                      return Icon(Icons.star, color: Colors.yellow, size: 12);
                    }),
              ),
              Text(
                ' ${(rating)}.0 ( ${(review)} Reviews)',
                style: TextStyle(fontSize: 10),
              )
            ],
          )
        ],
      ),
    ),
  );
  ;
}

Widget catogaries_tile(context, String text_, item_, icon_) {
  return Card(
      child: Container(
          width: MediaQuery.of(context).size.width * 0.55,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  icon_,
                  color: Colors.purple,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text_,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text('${(item_)} Items',
                        style: TextStyle(
                          fontSize: 12,
                        ))
                  ],
                ),
              )
            ],
          )));
}
