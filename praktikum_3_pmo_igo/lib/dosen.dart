import 'package:flutter/material.dart';
import 'package:praktikum_3_pmo_igo/bottom_nav.dart';

class Dosen extends StatefulWidget {
  const Dosen({super.key});
  @override
  State<Dosen> createState() => _DosenState();
}

class _DosenState extends State<Dosen> {
  String imageUrl = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 132, 41, 134),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('images/logo_amikom_white.png', width: 40, height: 40),
            SizedBox(width: 10),
            Text(
              "Praktikum 3 - Informatika",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/lecturer/dosen1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  const Text(
                    'Prof. Dr. Ken Edwrad Soetanto',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        imageUrl =
                            "https://images.pexels.com/photos/8197541/pexels-photo-8197541.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://images.pexels.com/photos/8197541/pexels-photo-8197541.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        imageUrl =
                            "https://st3.depositphotos.com/1719616/19410/i/450/depositphotos_194104106-stock-photo-woman-teacher-posing-by-chalk.jpg";
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://st3.depositphotos.com/1719616/19410/i/450/depositphotos_194104106-stock-photo-woman-teacher-posing-by-chalk.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        imageUrl =
                            "https://st4.depositphotos.com/16122460/31080/i/450/depositphotos_310801964-stock-photo-portrait-of-young-female-teacher.jpg";
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://st4.depositphotos.com/16122460/31080/i/450/depositphotos_310801964-stock-photo-portrait-of-young-female-teacher.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        imageUrl =
                            "https://universidadeuropea.com/resources/media/images/requisitos-profesor-matematicas-1200x630.original.jpg";
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://universidadeuropea.com/resources/media/images/requisitos-profesor-matematicas-1200x630.original.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        imageUrl =
                            "https://static.vecteezy.com/system/resources/thumbnails/074/128/806/small/confident-caucasian-male-professor-smiling-in-lecture-hall-photo.jpg";
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://static.vecteezy.com/system/resources/thumbnails/074/128/806/small/confident-caucasian-male-professor-smiling-in-lecture-hall-photo.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        imageUrl =
                            "https://universidadeuropea.com/resources/media/images/shutterstock_2421881563_1.width-640.jpg";
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://universidadeuropea.com/resources/media/images/shutterstock_2421881563_1.width-640.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        imageUrl =
                            "https://static.vecteezy.com/system/resources/thumbnails/012/440/708/small/teacher-with-a-group-of-students-in-classroom-free-photo.jpg";
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://static.vecteezy.com/system/resources/thumbnails/012/440/708/small/teacher-with-a-group-of-students-in-classroom-free-photo.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        imageUrl =
                            "https://static.vecteezy.com/system/resources/thumbnails/048/764/535/small/confident-middle-aged-male-french-teacher-standing-in-classroom-educational-environment-academic-setting-photo.jpg";
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://static.vecteezy.com/system/resources/thumbnails/048/764/535/small/confident-middle-aged-male-french-teacher-standing-in-classroom-educational-environment-academic-setting-photo.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        imageUrl =
                            "https://static.vecteezy.com/system/resources/thumbnails/075/530/190/small/experienced-lecturer-in-gray-blazer-speaking-to-students-in-classroom-with-desks-chairs-and-projector-screen-in-background-during-daytime-photo.jpg";
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://static.vecteezy.com/system/resources/thumbnails/075/530/190/small/experienced-lecturer-in-gray-blazer-speaking-to-students-in-classroom-with-desks-chairs-and-projector-screen-in-background-during-daytime-photo.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 1),
    );
  }
}
