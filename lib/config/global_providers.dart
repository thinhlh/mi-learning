import 'package:mi_learning/app/dashboard/presentation/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

class GlobalProviders {
  GlobalProviders._internal();

  static List<ChangeNotifierProvider> get providers => <ChangeNotifierProvider>[
        // ChangeNotifierProvider<DashboardProvider>(
        //   create: (_) => DashboardProvider(),
        // ),
      ];
}
