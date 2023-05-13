import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

  List<String> imageUrls = [
'assets/images/portfolio_images/f1.jpeg',
  'assets/images/portfolio_images/f3.jpeg',
  'assets/images/portfolio_images/f4.jpeg',
  'assets/images/portfolio_images/u10.jpeg',
  'assets/images/portfolio_images/f5.jpeg',
  'assets/images/portfolio_images/c8.jpeg',
  'assets/images/portfolio_images/f2.jpeg',
  'assets/images/portfolio_images/c8.jpeg',
  'assets/images/portfolio_images/c4.jpeg',
  'assets/images/portfolio_images/u12.jpeg',
  'assets/images/portfolio_images/f6.jpeg',
  'assets/images/portfolio_images/c7.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 0.6,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        children: imageUrls.map(_createGridTileWidget).toList(),
      ),
    );
  }

  Widget _createGridTileWidget(String url) => Builder(
        builder: (context) => GestureDetector(
          onLongPress: () {
          },
          child: Image.asset(url, fit: BoxFit.cover),
        ),
      );



  Widget _createPhotoTitle() => Container(
      width: double.infinity,
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://placeimg.com/640/480/people'),
        ),
        title: Text(
          'john.doe',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ));

  Widget _createActionBar() => Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
            Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
            Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ],
        ),
      );

  Widget _createPopupContent(String url) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _createPhotoTitle(),
              Image.network(url, fit: BoxFit.fitWidth),
              _createActionBar(),
            ],
          ),
        ),
      );
}

