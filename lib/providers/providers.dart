import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeni_task_1409/api.dart';

import '../services/data_notifier_service.dart';

final userProvider =
    StateNotifierProvider<DataNotifier, List<Users>>((ref) => DataNotifier());
