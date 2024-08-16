import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heatmap_habit/components/my_drawer.dart';
import 'package:heatmap_habit/database/habit_database.dart';
import 'package:heatmap_habit/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:heatmap_habit/utils/samples.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<HabitDatabase>(context, listen: false).readHabits();
    super.initState();
  }

  final TextEditingController textController = TextEditingController();

  void createHabit() {
    Utils.showDialogBox(
      context: context,
      content: TextField(
        controller: textController,
        decoration: const InputDecoration(hintText: "Create a new habit"),
      ),
      onConfirm: () {
        String habitName = textController.text;
        context.read<HabitDatabase>().addHabit(habitName);

        Navigator.pop(context);
        textController.clear();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: createHabit,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: const Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
      body: _habitList,
    );
  }

  Widget _habitList() {
    final habitDatabase = context.watch<HabitDatabase>();

    List<Habit> currentHabits = habitDatabase.currentHabits;
    return ListView.builder(
      itemCount: currentHabits.length,
      itemBuilder: (context, index) {
        final habit = currentHabits[index];
        bool isCompletedToday = isHabitCompletedToday();

      },
    );
  }
}
