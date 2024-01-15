import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  @override
  void didChangeDependencies() async {
    final response = await FirebaseFirestore.instance.collection("TODO").get();
    print(response);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: (value) async {
              final users = await FirebaseFirestore.instance
                  .collection('TODO')
                  .where('title', isEqualTo: value)
                  .get();

              for (var element in users.docs) {
                print(element.data());
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.large(
          onPressed: () async {
            await FirebaseFirestore.instance.collection('TODO').add({
              "title": "Yangi TODO 3",
              "description": "Yangi TODO 3 description ",
              "is_finished": false,
              "start_date": Timestamp.fromMillisecondsSinceEpoch(
                  DateTime.now().toUtc().millisecondsSinceEpoch),
              "end_date": Timestamp.fromMillisecondsSinceEpoch(
                  DateTime.now().toUtc().millisecondsSinceEpoch),
            });

            final users =
                await FirebaseFirestore.instance.collection('TODO').get();
            // final users = FirebaseFirestore.instance.collection('TODO').get();

            // delete qilib beradi
            // for (var element in users.docs) {
            //   await FirebaseFirestore.instance
            //       .collection('TODO')
            //       .doc(element.id)
            //       .delete();
            // }
          },
          child: const Icon(Icons.add),
        ),
        body: StreamBuilder<Object>(
            stream: FirebaseFirestore.instance.collection('TODO').snapshots(),
            builder: (context, snapshot) {
              return Builder(builder: (context) {
                return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  future: FirebaseFirestore.instance.collection('TODO').get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final list = snapshot.data?.docs.toList();
                      print(list);
                      if (list != null) {
                        return ListView.builder(
                          itemBuilder: (_, index) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    list[index].data()['title'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () async {
                                      await FirebaseFirestore.instance
                                          .collection('Todo')
                                          .doc(list[index].id)
                                          .delete();
                                    },
                                    icon: const Icon(Icons.delete))
                              ],
                            );
                          },
                          itemCount: list.length,
                        );
                      }
                      return const SizedBox();
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                );
              });
            }));
  }
}
