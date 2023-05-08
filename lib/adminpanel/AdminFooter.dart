import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Adminfooter extends StatefulWidget {
  const Adminfooter({Key? key}) : super(key: key);

  @override
  State<Adminfooter> createState() => _AdminfooterState();
}

class _AdminfooterState extends State<Adminfooter> {

  var mainColor = const Color(0xFF1C5D8B);
  var secondaryColor = const Color(0xFF3F83B4);
  static const fontFamily = "DM Sans";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Container(
          height: MediaQuery.of(context).size.height*0.2,
          width: MediaQuery.of(context).size.width,
          color: mainColor,
          margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.2, 0, 0),
          child:
          Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                  children:
                  [
                    const SizedBox(width: 270,),

                    const Text("Privacy Policy", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),),

                    Container(
                      height: MediaQuery.of(context).size.height*0.025,
                      width: 2.5,
                      color: Colors.white,
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    ),

                    const Text("Terms and Conditions", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),),

                    Container(
                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*.5, 0, 10, 0),
                      child: InkWell(
                        onTap: ()
                        {
                          _launchFbURL();
                        },
                        child: const ClipRRect(
                          child: Image(
                            height: 25,
                            width: 25,
                            image: NetworkImage("https://cdn-icons-png.flaticon.com/512/739/739237.png"),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: InkWell(
                        onTap: ()
                        {
                          _launchIgURL();
                        },
                        child: const ClipRRect(
                          child: Image(
                            height: 25,
                            width: 25,
                            image: NetworkImage("https://cdn-icons-png.flaticon.com/512/717/717392.png"),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: InkWell(
                        onTap: ()
                        {
                          _launchTwtURL();
                        },
                        child: const ClipRRect(
                          child: Image(
                            height: 25,
                            width: 25,
                            image: NetworkImage("https://cdn-icons-png.flaticon.com/512/2111/2111819.png"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.11, 30, 0, 0),
                    height: 2.5,
                    width: MediaQuery.of(context).size.width*0.74,
                    color: Colors.white,
                  ),
                ],
              ),

              Row(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.38, 30, 0, 0),
                      child: const Text("Copyright (c) 2022 PROCOLLAB. All Rights Reserved", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),)
                  ),
                ],
              )

            ],
          ),


        )
        ,
      ),


    );
  }
}

_launchFbURL () async
{
  const url = 'https://www.facebook.com/';
  if(await canLaunch(url))
  {
    await launch(url);
  }
  else
  {
    throw 'Could not Launch $url';
  }
}


_launchIgURL () async
{
  const url = 'https://www.instagram.com/';
  if(await canLaunch(url))
  {
    await launch(url);
  }
  else
  {
    throw 'Could not Launch $url';
  }
}


_launchTwtURL () async
{
  const url = 'https://www.twitter.com/';
  if(await canLaunch(url))
  {
    await launch(url);
  }
  else
  {
    throw 'Could not Launch$url';
  }
}