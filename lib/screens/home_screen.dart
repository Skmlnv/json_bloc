import 'package:expanded_cell/blocs/post/bloc.dart';
import 'package:expanded_cell/blocs/post/event.dart';
import 'package:expanded_cell/blocs/post/state.dart';
import 'package:expanded_cell/models/post_model.dart';
import 'package:expanded_cell/screens/details_post_screen.dart';
import 'package:expanded_cell/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PostBloc postBloc;
  TextEditingController _searchFieldController = TextEditingController();
  List<Post> post;

  int selected;
  @override
  void initState() {
    super.initState();
    postBloc = BlocProvider.of<PostBloc>(context);
    postBloc.add(FetchPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Material(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Expanded cell"),
              backgroundColor: AppColors.appBar,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    postBloc.add(FetchPostEvent());
                  },
                )
              ],
            ),
            body: Container(
              color: AppColors.mainBg,
              padding: EdgeInsets.all(15.0),
              child: BlocListener<PostBloc, PostState>(
                listener: (context, state) {
                  if (state is PostErrorState) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                child: BlocBuilder<PostBloc, PostState>(
                  builder: (context, state) {
                    if (state is PostInitialState) {
                      return loader();
                    } else if (state is PostLoadingState) {
                      return loader();
                    } else if (state is PostLoadedState) {
                      return postList(state.posts);
                    } else if (state is PostErrorState) {
                      return error(state.message);
                    }
                    return loader();
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget postList(List<Post> posts) {
    onItemChanged(String value) {
      setState(() {
        post = posts
            .where((posts) => posts.title.contains(value.toLowerCase()))
            .toList();
        print(post.length);
      });
    }

    return Column(children: [
      TextField(
        controller: _searchFieldController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          hintText: 'Search Here...',
          hintStyle: TextStyle(color: Colors.white),
        ),
        onChanged: onItemChanged,
      ),
      SizedBox(height: 20.0),
      Expanded(
          child: ListView.builder(
        itemCount: post == null ? posts.length : post.length,
        itemBuilder: (ctx, i) {
          return Container(
              color: AppColors.cellBg,
              margin: EdgeInsets.only(bottom: 10.0),
              child: ExpansionTile(
                key: Key(selected.toString()),
                initiallyExpanded: i == selected,
                onExpansionChanged: (expanded) {
                  if (expanded)
                    setState(() {
                      selected = i;
                    });
                  else
                    setState(() {
                      selected = -1;
                    });
                },
                title: Text(
                  post == null ? posts[i].title : post[i].title,
                  style: TextStyle(
                      color: Colors.white, fontSize: AppFontSizes.title),
                ),
                children: [
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(15.0),
                      child: Flexible(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              style: TextStyle(color: Colors.white),
                              text:
                                  "${post == null ? posts[i].body : post[i].body}..."),
                        ),
                      )),
                  RaisedButton(
                    child: Text("Show more"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostDetails(
                                  post: post == null ? posts[i] : post[i],
                                )),
                      );
                    },
                  )
                ],
              ));
        },
      ))
    ]);
  }
}
