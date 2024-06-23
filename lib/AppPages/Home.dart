import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 1;

  Map<String,dynamic> pIMG={
    'img':[ 'images/1.png',
      'images/2.jpg',
      'images/3.jpg',
      'images/4.jpg',
      'images/5.jpg',
      'images/6.jpg',
      'images/7.jpg',
      'images/8.jpg',
      'images/9.jpg',
      'images/10.jpg',],
    'names':[ 'Ali',
        'Ahmed',
        'Saifullah',
        'Bashir',
        'Hassan',
        'Joseph',
        'Usman',
        'Khawar',
        'Mohid',
        'Jameel',],
    'posts':[
      'images/p1.jpg',
      'images/p2.jpg',
      'images/p3.jpeg',
      'images/p4.jpg',
      'images/p5.jpg',
      'images/p6.jpg',
      'images/p7.jpg',
      'images/p8.jpg',
      'images/p9.jpg',
      'images/p10.jpg',
     
    ]
  };

  @override

  // List<String> proileImages= [
  //
  // ];
  // List<String>profileName = [
  //
  // ];
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(children: [SvgPicture.asset('images/ic_instagram.svg',height: 35,width: 35,color: Colors.white,),
       const SizedBox(width: 5,),
          const Icon(Icons.expand_more_sharp,color: Colors.white,)
        ],),

        actions:const [
          badges.Badge(
            badgeContent: Text(".",style: TextStyle(fontSize: 12,color: Colors.red),),
            child: Icon(Icons.favorite_border,color: Colors.white,size: 28,),

          ),
          SizedBox(width: 18,),
          badges.Badge(
            badgeContent: Text("4",style: TextStyle(fontSize: 12,color: Colors.white)),
            child: Icon(Icons.mail,color: Colors.white,size: 28,),

          ),
          SizedBox(width: 18,),
        ],
      ),
      bottomNavigationBar: bottomBar(),
      body:SingleChildScrollView(
        child: Column(
          children: [
            // STORY


            SizedBox(
              height: 100,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pIMG['names'].length,
                  itemBuilder: (context, index) {
                  return
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: CircleAvatar(backgroundImage:const AssetImage('images/instastory.png'),
                            radius: 26,
                            child: CircleAvatar(backgroundImage:  AssetImage(pIMG['img'][index],),radius: 25,),
                          ),
                        ),
                        Text(pIMG['names'][index],style: const TextStyle(color: Colors.white,fontSize: 12),)
                      ],
                    );

                },),
              ),
            ),

           Divider(),
              Column(
                children: List.generate(pIMG['names'].length, (index) => Container(

                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    Row(

                      children: [
                      CircleAvatar(backgroundImage:  AssetImage(pIMG['img'][index],),radius: 18,),
                        const SizedBox(width: 10,),
                        Text(pIMG['names'][index]+'. ',style: const TextStyle(color: Colors.white,fontSize: 10),),
                        const Text('3 day',style: TextStyle(color: Colors.grey,fontSize: 10),),
                        const Spacer(),
                        const Icon(Icons.more_horiz,color: Colors.white,size: 20,),

                    ],),
                    const SizedBox(height: 10,),
                     Image.asset(pIMG['posts'][index]),
                    const SizedBox(height: 6,),

                       Row(children: [
                         const Icon(Icons.favorite_border,color: Colors.white,),
                         const SizedBox(width: 6,),
                         const  Icon(Icons.chat_bubble_sharp,color: Colors.white,),
                         const  SizedBox(width: 6,),
                         const   Icon(Icons.send_sharp,color:Colors.white,),
                         const    Spacer(),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark,color: Colors.white,)),

                    ],)

                  ],),
                ),)
              )
          ],
        ),
      ),
    );

  }

  Widget bottomBar(){
    return BottomAppBar(
      height: 65,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [




          GestureDetector(
              onTap: (){
                setState(() {
                  currentPage = 1;
                  print("HoMe");
                });
              },
              child: Icon(currentPage==1?Icons.home:Icons.home_outlined,color: Colors.white,size: 30,)),
          GestureDetector(
            onTap: (){
              setState(() {
                currentPage = 2;
                print("HoMe");
              });
            },

            child: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Icon(currentPage==2?Icons.search:Icons.search_rounded,color: Colors.white,size: 30),
            ),),



          IconButton(onPressed: (){
            setState(() {
              currentPage = 3;
            });
          }, icon: Icon(currentPage==3?Icons.add_box_rounded:Icons.add_box_outlined,color: Colors.white,size: 30)),
          IconButton(onPressed: (){
            setState(() {
              currentPage = 4;
            });
          }, icon: Icon(currentPage==4?Icons.movie_creation:Icons.movie_creation_outlined,color: Colors.white,size: 30)),

          IconButton(onPressed: (){
            setState(() {
              currentPage = 5;
            });
          }, icon:Icon( currentPage==5?Icons.account_circle_sharp:Icons.account_circle_sharp,color: Colors.white,size: 30)),



        ],
      ),
    );
}

// Listview.Generate using method

// SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: Row(
//     children: List.generate
//
//       (
//         growable: true,
//         proileImages.length, (index)=>Container(
//       padding: EdgeInsets.all(10),
//       child: Column(
//         children: [
//           CircleAvatar(backgroundImage: AssetImage('images/instastory.png'),
//             radius: 26,
//           child: CircleAvatar(backgroundImage:  AssetImage(proileImages[index],),radius: 25,),
//           ),
//           Text(profileName[index])
//         ],
//       ),
//     ))
//   ),
// )
}
