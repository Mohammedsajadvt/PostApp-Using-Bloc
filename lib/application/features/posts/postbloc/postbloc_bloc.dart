import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postblocapp/domain/entities/post_entity.dart';
import 'package:postblocapp/domain/usecases/post_usecase.dart';

part 'postbloc_event.dart';
part 'postbloc_state.dart';

class PostblocBloc extends Bloc<PostEvent,PostState>{
  PostblocBloc():super(PostInitial()){

    on< PostRequestedEvent>((event,emit)async{

   try{
     final posts = await PostUsecase().getPostFromDataSource();
     emit(PostStateLoaded(posts: posts));
   }catch(e){
    emit(PostStateError(msg: e.toString()));
   }
    });
  }
}