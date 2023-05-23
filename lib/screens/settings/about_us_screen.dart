import 'package:flutter/material.dart';
import 'package:start_up_project/screens/settings/setting_main_page.dart';
import 'package:start_up_project/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final List<Testimonial> testimonials = [
      Testimonial('John Smith', 'I have been using Product A for the past year and I am extremely satisfied with it. The customer support is excellent and the product itself is top-quality. I highly recommend it to anyone in need of a reliable and efficient solution.'),
      Testimonial('Jane Doe', 'I was skeptical about Product B at first, but after using it for a few weeks I am pleasantly surprised. It is easy to use and customize, and it has saved me a lot of time and effort. I will definitely be using it again in the future.'),
      Testimonial('Bob Johnson', 'Product C exceeded my expectations. Not only is it energy efficient, but it is also environmentally friendly. I feel good about using it and will be recommending it to my friends and family.'),
    ];

    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsMainPage(),));
            },
              child: Icon(Icons.chevron_left,color: AppColors.mainColor,)),
          title: Text('About Us'),
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [

              //Name and Logo
              Container(
                width: screenWidth,
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Walkini',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(height: 8),
                    Image.asset(
                      'assets/logo/2.png',
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
              ),

              //brief summary
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Walkini is a Mobile App to track user steps and allow him to earn from his physical effort',
                    style: Theme.of(context).textTheme.bodyText2,
                  )
              ),

              //statement and values
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mission Statement:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Our mission is to provide high-quality products and services to our users by our partners .',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Values:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('users satisfaction is our top priority'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('We strive for continuous improvement'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('We try to give the user what he need'),
                      ),
                    ],
                  )
              ),

              //History and background
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'History:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('Founded in 2023 by two students as a end of education project'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('Started as a small application with 2 admins'),
                      ),

                    ],
                  )
              ),

              //products or service
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Products:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text(' High-quality and durable products by our partners'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('low price products'),
                      ),

                    ],
                  )
              ),



              //contact information
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Us:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text('3220 tataouine sud'),
                        subtitle: Text('Tunisia'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('+216 12 345 678'),
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text('walkini.support.team@gmail.com'),
                      ),
                    ],
                  )
              ),

              //social media
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Follow Us:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.link),
                        title: Text('Facebook'),
                        onTap: () => launchUrl(Uri.parse('https://www.facebook.com/walkini')),
                      ),
                      ListTile(
                        leading: Icon(Icons.link),
                        title: Text('Twitter'),
                        onTap: () => launchUrl(Uri.parse('https://www.twitter.com/walkini')),
                      ),
                      ListTile(
                        leading: Icon(Icons.link),
                        title: Text('Instagram'),
                        onTap: () => launchUrl(Uri.parse('https://www.instagram.com/walkini')),
                      ),
                    ],
                  )
              ),


            ],
          ),
        )

    );
  }
}

class Testimonial {
  final String author;
  final String text;

  Testimonial(this.author, this.text);
}