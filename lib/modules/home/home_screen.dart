import 'package:app/models/music_model.dart';
import 'package:app/modules/home/widgets/music_widgets.dart';
import 'package:app/modules/song_details/song_details_screen.dart';
import 'package:app/shared/components.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultText(
                        text: 'Welcome To',
                      ),
                      Image.asset(
                        'assets/images/logo_name.jpg',
                        height: 30,
                        width: 150,
                      ),
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: textColor.withOpacity(0.5),
                    radius: MediaQuery.of(context).size.width * 0.07,
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.067,
                      backgroundColor: primaryColor,
                      child: const Icon(
                        Icons.cell_tower_outlined,
                        color: textColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.07,
                    backgroundColor: textColor.withOpacity(0.5),
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.067,
                      backgroundColor: primaryColor,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30.0)),
                        child: Image.asset(
                          'assets/images/kyung.jpg',
                          fit: BoxFit.cover,
                          height: 41,
                          width: 41,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.07,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Colors.white.withOpacity(
                      0.8,
                    ),
                    size: 30.0,
                  ),
                  suffixIcon: Icon(
                    Icons.multitrack_audio_outlined,
                    color: Colors.white.withOpacity(
                      0.8,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.2),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    color: textColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.07,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SongDetailsScreen('assets/images/woman_2.jpeg');
                  }));
                },
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(
                          color: textColor.withOpacity(
                            0.5,
                          ),
                          width: 0.3)),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/woman_2.jpeg',
                            height: 240.0,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Container(
                            width: double.infinity,
                            height: 80.0,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0),
                              ),
                              color: primaryColor,
                            ),
                            child: Text(
                              '',
                              style: TextStyle(
                                color: primaryColor.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          defaultText(
                            text: 'MAN',
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                          defaultText(
                            text: 'Sogand',
                            color: Colors.white,
                            fontSize: 40.0,
                            fontFamily: 'Delight',
                          ),
                          const SizedBox(
                            height: 30.0,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      defaultText(
                        text: 'Hot',
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Janna',
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      defaultText(
                        text: 'Music',
                        fontSize: 16.0,
                        color: Colors.white,
                        fontFamily: 'Janna',
                      ),
                    ],
                  ),
                  const Spacer(),
                  defaultText(
                    text: 'See All',
                    color: Colors.deepPurple,
                    fontSize: 12.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10.0,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    debugPrint('$index');
                    return buildMusicItem(
                      index,
                      context,
                    );
                  },
                  itemCount: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
