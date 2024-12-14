import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/app_styles/app_theme.dart';
import 'package:news_app/model/articles_response/Article.dart';
import 'package:news_app/ui/category_details/web_view.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:webview_flutter/webview_flutter.dart';

class FullArticleScreen extends StatefulWidget {
  FullArticleScreen({required this.article});
  static const String routeName = 'full_article';
  Article article;

  @override
  State<FullArticleScreen> createState() => _FullArticleScreenState();
}

class _FullArticleScreenState extends State<FullArticleScreen> {
  late WebViewController webViewController = WebViewController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"),
          )),
      child: Scaffold(
        appBar: AppBar(
          title: Text("News Title"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            CachedNetworkImage(
              imageUrl: widget.article.urlToImage ?? "",
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.article.source?.name ?? "",
                    style: TextStyle(color: Color(0xff79828B)),
                  ),
                  Text(
                    widget.article.title ?? "",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA3A3A3),
                          ),
                      timeago.format(
                        DateTime.parse(
                          widget.article.publishedAt ?? "",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 42.h,
                  ),
                  Text(
                    widget.article.description ?? "",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(
                    height: 55.h,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () async {
                        final WebViewController webViewController = WebViewController()
                          ..setJavaScriptMode(JavaScriptMode.unrestricted)
                          ..setNavigationDelegate(NavigationDelegate(
                            onHttpError: (HttpResponseError error) {
                              print(error);
                            },
                          ))..loadRequest(Uri.parse(widget.article.url??""));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ArticleWebView(webViewController)));
                        print(widget.article.url);
                      },
                      child: Text("View Full Article"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
