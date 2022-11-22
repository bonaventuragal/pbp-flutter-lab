import 'package:flutter/material.dart';
import 'package:counter_7/models/watchlist.dart';
import 'package:counter_7/utils/drawer.dart';
import 'package:counter_7/utils/fetch_wathclist.dart';

class MyWatchList extends StatefulWidget {
  const MyWatchList({super.key});

  @override
  State<MyWatchList> createState() => _MyWatchListState();
}

class _MyWatchListState extends State<MyWatchList> {
  final Future<List<WatchList>> futureFetch = fetchWatchList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: buildDrawer(context),
      body: FutureBuilder<List<WatchList>>(
        future: futureFetch,
        builder: (context, AsyncSnapshot<List<WatchList>> snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada watch list :(",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "/watchlist-detail",
                      arguments: snapshot.data![index],
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: snapshot.data![index].watched
                            ? Colors.green.shade400
                            : Colors.red.shade400,
                        width: 2.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data![index].title,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Checkbox(
                          value: snapshot.data![index].watched,
                          onChanged: (bool? newValue) => {
                            setState(
                              () => {snapshot.data![index].watched = newValue!},
                            )
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
