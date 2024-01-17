import 'package:get_it/get_it.dart';
import 'package:reddit/domain/usecases/delete_reply_uc.dart';
import 'package:reddit/domain/usecases/up_down_reply_uc.dart';
import '../../data/datasource/post_local_data_source.dart';
import '../../data/repositroy/post_repo.dart';
import '../../domain/usecases/send_message_uc.dart';
import '../../domain/usecases/up_down_post_uc.dart';
import '../../presentation/controller/bloc/post_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //Bloc
    sl.registerFactory(() => PostBloc(sl(), sl(), sl(), sl()));

    //Use Case
    sl.registerLazySingleton(() => UpDownPostUc(sl()));
    sl.registerLazySingleton(() => UpDownReplyUc(sl()));
    sl.registerLazySingleton(() => SendMessageUc(sl()));
    sl.registerLazySingleton(() => DeleteReplyUc(sl()));

    //Repo
    sl.registerLazySingleton<BasePostRepo>(() => PostRepo(sl()));

    //Data Source
    sl.registerLazySingleton<BasePostLocalDataSource>(
        () => PostLocalDataSource());
  }
}
