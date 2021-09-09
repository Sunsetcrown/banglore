import 'package:banglore/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
);

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<User> _users = [
    User('sachin tendulkar', 'crickter',
        'https://resources.pulse.icc-cricket.com/ICC/photo/2018/04/22/c19486c2-4e5b-48c4-82af-c6d0eebb7bd2/Main.jpg',
        'sports'),
    User('saina nehwal', 'badminton',
        'https://static.toiimg.com/thumb/msid-80422726,width-1200,height-900,resizemode-4/.jpg',
        'sports'),
    User('virat kohli', 'crickter',
        'https://static.toiimg.com/thumb/msid-85999434,imgsize-40808,width-400,resizemode-4/85999434.jpg',
        'sports'),
    User('ratan tata', 'businessman',
        'https://img.etimg.com/thumb/msid-74120472,width-1200,height-900,imgsize-176910,overlay-etpanache/photo.jpg',
        'business'),
    User('mukesh ambani', 'businessman',
        'https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5c7d7829a7ea434b351ba0b6%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D206%26cropX2%3D2043%26cropY1%3D250%26cropY2%3D2089',
        'business'),

    User('dr. apj abdul kalam', 'scientist',
        'https://cdn.britannica.com/56/148856-004-2F59E2D9/APJ-2008.jpg',
        'science and tech'),
    User('elon musk', 'scientist',
        'https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f47d4de7637290765bce495%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D1699%26cropX2%3D3845%26cropY1%3D559%26cropY2%3D2704',
        'science and tech'),
    User('mr. narendre modi', 'politician',
        'https://yt3.ggpht.com/ytc/AKedOLRL4TDvw0IOANXtLLO4_aw-gWZRE_i_ATWZq7FZniM=s900-c-k-c0x00ffffff-no-rj',
        'politician'),
    User('mr. amit shah', 'politician',
        'https://pbs.twimg.com/profile_images/1180491411172413440/AunoqDQW.jpg',
        'politician'),
    User('A.R.rehman', 'singer',
        'https://static.toiimg.com/thumb/msid-74594959,width-800,height-600,resizemode-75,imgsize-50250,pt-32,y_pad-40/74594959.jpg',
        'singer'),
    User('lata mangeshkar', 'singer',
        'https://static.toiimg.com/thumb/56933883.cms?width=170&height=240',
        'singer'),
    User('zubin nautiyal', 'singer',
        'https://static.toiimg.com/photo/msid-74993593/74993593.jpg?195468',
        'singer'),
    User('rl stine', 'writer',
        'https://i.guim.co.uk/img/media/d5e9fcd756a795501c0a6562b0683b90912a4ff7/0_2293_3840_2304/master/3840.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=3676e5465c17f3ac692c2c58bfb14ac1',
        'writer'),
    User('chetan bhagat', 'writer',
        'https://static.toiimg.com/thumb/msid-48719713,width-800,height-600,resizemode-75/48719713.jpg',
        'writer'),
    User('amitabh bachan', 'actor',
        'https://m.media-amazon.com/images/M/MV5BNTk1OTUxMzIzMV5BMl5BanBnXkFtZTcwMzMxMjI0Nw@@._V1_.jpg',
        'actor'),
    User('shah rukh khan', 'actor',
        'https://m.media-amazon.com/images/I/61f39Z4c04L._SS500_.jpg',
        'actor'),
    User('salman khan', 'actor',
        'https://static.toiimg.com/photo/79373969/79373969.jpg?v=3',
        'actor'),
    User('sanjeev kapoor', 'chef',
        'https://pbs.twimg.com/profile_images/911145420352450561/wJdHEVJv_400x400.jpg',
        'cook'),
  ];

  List<User> _foundedUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _foundedUsers = _users;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users.where((user) => user.name.toLowerCase().contains(search)).toList();
        _foundedUsers = _users.where((user) => user.username.toLowerCase().contains(search)).toList();
        _foundedUsers = _users.where((user) => user.catogories.toLowerCase().contains(search)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: Container(
          height: 38,
          child: TextField(
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade500,),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none
                ),
                hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade500
                ),
                hintText: "Search users"
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade900,
        child: _foundedUsers.length > 0 ? ListView.builder(
            itemCount: _foundedUsers.length,
            itemBuilder: (context, index) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: userComponent(user: _foundedUsers[index]),
                actions: <Widget>[
                  new IconSlideAction(
                    caption: 'Archive',
                    color: Colors.transparent,
                    icon: Icons.archive,

                    onTap: () => print("archive"),
                  ),
                  new IconSlideAction(
                    caption: 'Share',
                    color: Colors.transparent,
                    icon: Icons.share,
                    onTap: () => print('Share'),
                  ),
                ],
                secondaryActions: <Widget>[
                  new IconSlideAction(
                    caption: 'More',
                    color: Colors.transparent,
                    icon: Icons.more_horiz,
                    onTap: () => print('More'),
                  ),
                  new IconSlideAction(
                    caption: 'Delete',
                    color: Colors.transparent,
                    icon: Icons.delete,
                    onTap: () => print('Delete'),
                  ),
                ],
              );
            }) : Center(child: Text("No users found", style: TextStyle(color: Colors.white),)),
      ),
    );
  }

  userComponent({required User user}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
              children: [
                Container(
                    width: 60,
                    height: 60,

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(user.image)
                    )
                ),
                SizedBox(width: 10),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(),
                      Text(user.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                      SizedBox(height: 5,),
                      Text(user.username, style: TextStyle(color: Colors.grey[500])),
                      SizedBox(height: 5,),
                      Text(user.catogories, style: TextStyle(color: Colors.grey[500])),
                    ]
                )
              ]
          ),

        ],
      ),
    );
  }
}
