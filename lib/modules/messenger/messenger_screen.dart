import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      appBar: AppBar(
        backgroundColor: Colors.amber[200],
        elevation: 0.0,
        titleSpacing: 10,
        title: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            CircleAvatar(
              radius: 20,
              backgroundImage: const NetworkImage(
                'https://scontent.fcai19-4.fna.fbcdn.net/v/t1.6435-9/195426422_5604538132954651_4270580079699829870_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeEGpJhsK6mcDJCP7xkVuhF2dC53o0k-3xl0LnejST7fGal_BkXrJkfacmG2maFs9XKenbanCZmFjwN8N8rXpTgs&_nc_ohc=81tw1O_k7KIAX9HW48l&_nc_ht=scontent.fcai19-4.fna&oh=9e4d45dddd3129902e24d58126534c35&oe=60E8A70C',
              ),
            ),

            const SizedBox(
              width: 15.0,
            ),

            const Text(
              'Chats',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundColor: Colors.black87,
              radius: 15,
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.black87,
              child: Icon(
                Icons.edit_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          // scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Text(
                      'Search',
                      // ignore: unnecessary_const
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // ignore: sized_box_for_whitespace
              Container(
                height: 90,
                child: ListView.separated(
                  itemBuilder: (context, index) => buildStoryItem(),
                  itemCount: 50,
                  separatorBuilder: (caext, index) => const SizedBox(
                    width: 15,
                  ),
                  scrollDirection: Axis.horizontal,
                ),
              ),

              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildChatItem(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              CircleAvatar(
                radius: 25,
                backgroundImage: const NetworkImage(
                    'https://scontent.fcai19-4.fna.fbcdn.net/v/t1.6435-9/188809641_333863304768265_1164274213744254603_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeEdjdViY5IRI3YSlIob8fFqYzhGyZYCBSdjOEbJlgIFJxd1T4vseR22ax9vtagFwxg89NyUtxyeWqdYoZSOydZl&_nc_ohc=zmOxmP3QRG0AX9SRVna&_nc_ht=scontent.fcai19-4.fna&oh=de26144cbb622e05f2a8ebc81bfda80f&oe=60E83BC0'),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 3,
                  end: 3,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 6.3,
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 3,
                  end: 3,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 6,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ali Maher',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Expanded(
                      child: Text(
                        'hello my name is ali maher hello my name is ali maher hello my name is ali maher hello my name is ali maher hello my name is ali maher hello my name is ali maher ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          color: Colors.lightBlue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const Text('02:00 Am'),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  // ignore: sized_box_for_whitespace
  Widget buildStoryItem() => Container(
        width: 50,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                CircleAvatar(
                  radius: 25,
                  backgroundImage: const NetworkImage(
                      'https://scontent.fcai19-4.fna.fbcdn.net/v/t1.6435-9/53524140_148950556127544_4747263107871539200_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeGtlGCZVx8LhLYUr3tyQCDWNCUgyvXfUKI0JSDK9d9QoiYDe7hhisLV6UzhT_3-FfEfsNbAqjmwZKnMaM4C3v2Y&_nc_ohc=bsmrB6jp9ysAX8xeOF_&_nc_ht=scontent.fcai19-4.fna&oh=b612a3b9a79adefa67a7c07245bf326b&oe=60E81B0B'),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 3,
                    end: 3,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 6.8,
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 3,
                    end: 3,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 6,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            const Text(
              'Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy Kholoud Elhawy ',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
}
