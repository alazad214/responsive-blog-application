import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:praner_blog/screens/fottersection.dart';
import 'package:url_launcher/url_launcher.dart';

class Details_Mobile extends StatelessWidget {
  final Map<String, dynamic> blogItem;

  const Details_Mobile({Key? key, required this.blogItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        titleSpacing: 0,
        title: Text(
          blogItem["title"],
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: blogItem["image"],
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 18,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          blogItem["Auther"],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.timer,
                        size: 18,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          blogItem["time"],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(blogItem["dis"])),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(blogItem["source"].toString());
                    if (!await canLaunch(url.toString())) {
                      throw 'Could not launch $url';
                    }
                    await launch(url.toString());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    onPrimary: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text("More.."),
                ),
                const SizedBox(height: 30),
                const Fotter_Section()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
