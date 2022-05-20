import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mi_learning/app/article/presentation/providers/article_viewer_page_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleViewerPage
    extends PageLoadingStateless<ArticleViewerPageProvider> {
  late final String url;

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => navigator.pop(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: context.isDarkMode
                ? AppColors.neutral.shade500
                : AppColors.neutral.shade900,
          ),
        ),
        title: Text(
          url,
          style: context.textTheme.titleLarge,
        ),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        backgroundColor: null,
        debuggingEnabled: false,
      ),
    );
  }

  @override
  void initialization(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    url = "https://flutter.dev";
  }
}
