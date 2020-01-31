import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/githubjob.dart';

class GithubJobDetail extends StatefulWidget {
  GithubJobDetail({Key key}) : super(key: key);

  @override
  _GithubJobDetailState createState() => _GithubJobDetailState();
}

class _GithubJobDetailState extends State<GithubJobDetail> {
  GitHubJob job;

  getEntryJobTitle(context) {
    return SizedBox(
        height: 100,
        child: Center(
            child: Text(job.company.toString(),
                style:
                    TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold))));
  }

  getJobTitleAndLocation(context) {
    double text_size = job.title.length >= 20 ? 16 : 23;

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          margin: EdgeInsets.only(left: 30.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  job.title,
                  style: TextStyle(
                      fontSize: text_size, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.clip,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.location_city,
                      color: Colors.black,
                      size: 32,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 32.0),
                      child: Text(
                        job.location == null ? "NA" : job.location,
                        style: TextStyle(
                            fontSize: 21.0, fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                )
              ])),
    ]);
  }

  getJobDescription(context) {
    String text = job.description;
    bool ignore = false;
    for (var i = 0; i < job.description.length; i++) {
      if (job.description[i] == '<') ignore = true;
      if (job.description[i] == '>' && ignore == true) {
        ignore = false;
        continue;
      }
      if (ignore == true) {}
    }

    return Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Html(
                data: text,
                onLinkTap: (url) {
                  _launchURL(url);
                },
              ),
            )
          ],
        ));
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  getListJob(context) {
    Image im = Image.network(job.company_logo);

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Color.fromARGB(255, 227, 229, 232),
          centerTitle: true,
          title: Text(
            " ",
            style: TextStyle(color: Colors.white),
          ),
          pinned: true,
          floating: true,
          expandedHeight: im == null ? 0 : 200,
          flexibleSpace: Container(
            margin: EdgeInsets.all(10),
            child: im,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              switch (index) {
                case 0:
                  return getEntryJobTitle(context);
                  break;
                case 1:
                  return getJobTitleAndLocation(context);
                case 2:
                  return getJobDescription(context);
                default:
                  return SizedBox(height: 100, child: Text(index.toString()));
              }
            },
            childCount: 3,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    job = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: getListJob(context),
    );
  }
}
