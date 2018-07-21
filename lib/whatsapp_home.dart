import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter_app/pages/call_screen.dart';
import 'package:whatsapp_clone_flutter_app/pages/camera_screen.dart';
import 'package:whatsapp_clone_flutter_app/pages/chat_screen.dart';
import 'package:whatsapp_clone_flutter_app/pages/status_screen.dart';

class WhatsAppHome extends StatefulWidget {
  var cameras;
  WhatsAppHome(this.cameras);
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> with SingleTickerProviderStateMixin{

  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=new TabController(
        length: 4,
        vsync: this,
      initialIndex: 1
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("WhatsApp"),
       elevation: 0.7,
       bottom: new TabBar(
           tabs: <Widget>[
              new Tab(icon: new Icon(Icons.camera_alt)),
              new Tab(text: "CHATS",),
             new Tab(text: "STATUS",),
             new Tab(text: "CALLS",)
           ],
           controller: _tabController,
           indicatorColor: Colors.white,
       ),
       actions: <Widget>[
         new Icon(Icons.search),
         new Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0),),
         new Icon(Icons.more_vert),

       ],
      ),
      body: new TabBarView(
          children: <Widget>[
            new CameraScreen(widget.cameras),
            new ChatScreen(),
            new StatusScreen(),
            new CallScreen(),
          ],
        controller:_tabController,
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: ()=>print(""),
           child: new Icon(Icons.message,color: Colors.white,),
          backgroundColor: Theme.of(context).accentColor,

      ),
    );
  }
}
