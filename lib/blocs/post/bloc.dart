import 'package:expanded_cell/api/get_post.dart';
import 'package:expanded_cell/blocs/post/event.dart';
import 'package:expanded_cell/blocs/post/state.dart';
import 'package:expanded_cell/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  GetPost url;

  PostBloc({@required this.url}) : super(null);

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FetchPostEvent) {
      yield PostLoadingState();
      try {
        List<Post> posts = await url.getPosts();
        yield PostLoadedState(posts: posts);
      } catch (e) {
        yield PostErrorState(message: e.toString());
      }
    }
  }
}
