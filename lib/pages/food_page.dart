import 'package:event_planner/models/venue.dart';
import 'package:event_planner/pages/decoration_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Foodpage extends StatefulWidget {
  final IVenue selectedVenue;
  const Foodpage({super.key, required this.selectedVenue});

  @override
  State<Foodpage> createState() => _FoodpageState();
}

class _FoodpageState extends State<Foodpage> {
  final List<Map<String, dynamic>> menuList = [
    {
      "title": "Breakfast",
      "items": [
        {
          "title": "Aloo Paratha",
          "price": "20Rs",
          "image":
              "https://www.vegrecipesofindia.com/wp-content/uploads/2009/08/aloo-paratha-recipe-4.jpg",
          "isSelected": false,
        },
        {
          "title": "Idli Sambre",
          "price": "40Rs",
          "image":
              "https://www.vegrecipesofindia.com/wp-content/uploads/2014/05/idli-sambar.jpg",
          "isSelected": false,
        },
      ],
      "isExpanded": false,
    },
    {
      "title": "Lunch",
      "items": [
        {
          "title": "Maharastrian Thali",
          "price": "400Rs",
          "image":
              "https://images.slurrp.com/prod/articleSource/4o2sglfinj7.webp?impolicy=slurrp-20210601&width=1200&height=900&q=75",
          "isSelected": false,
        },
      ],
      "isExpanded": false,
    },
    {
      "title": "Dinner",
      "items": [
        {
          "title": "Dal Rice Plet",
          "price": "200Rs",
          "image":
              "https://thespicemess.com/wp-content/uploads/2020/08/Daal-4-1536x1150.jpg",
          "isSelected": false,
        },
      ],
      "isExpanded": false,
    },
  ];

  late Future<List<IVenue>> futureFoodList;

  final CollectionReference _foodCollectionReference =
      FirebaseFirestore.instance.collection('food');

  Future<List<IVenue>> fetchFood() async {
    try {
      QuerySnapshot snapshot = await _foodCollectionReference.get();

      return snapshot.docs.map((doc) => IVenue.fromFirestore(doc)).toList();
    } catch (error) {
      rethrow;
    }
  }

  @override
  void initState() {
    futureFoodList = fetchFood();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Food page'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            List selectedList = [];

            menuList.forEach((e) {
              List items = [];
              e["items"].forEach((f) {
                if (f["isSelected"] == true) {
                  items.add(f);
                }
              });
              selectedList.add({"title": e["title"], "items": items});
            });

            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return Decorationpage(
                selectedVenue: widget.selectedVenue,
                selectedList: selectedList,
              );
            }));
          },
          child: Text("Submit"),
        ),
        body: ListView(
          children: List.generate(menuList.length, (index) {
            dynamic item = menuList[index];
            List childItems = menuList[index]["items"];

            return ExpansionTile(
                title: Text(item["title"]),
                children: List.generate(childItems.length, (j) {
                  return ListTile(
                    title: Text(childItems[j]["title"]),
                    subtitle: Text(childItems[j]["price"]),
                    leading: Image.network(
                      childItems[j]["image"],
                      fit: BoxFit.cover,
                      width: 100,
                    ),
                    trailing: Checkbox(
                      value: childItems[j]["isSelected"],
                      onChanged: (val) {
                        setState(() {
                          menuList[index]["items"][j]["isSelected"] = val;
                        });
                      },
                    ),
                  );
                }));
          }),
        ));
  }
}
