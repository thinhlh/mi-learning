import 'package:provider/provider.dart';

class GlobalProviders {
  GlobalProviders._internal();

  static List<ChangeNotifierProvider> get providers => <ChangeNotifierProvider>[
        // ChangeNotifierProvider<DashboardProvider>(
        //   create: (_) => DashboardProvider(),
        // ),
      ];
}
