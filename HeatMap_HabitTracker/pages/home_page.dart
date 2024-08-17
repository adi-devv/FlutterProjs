import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heatmap_habit/components/my_drawer.dart';
import 'package:heatmap_habit/components/my_habit_tile.dart';
import 'package:heatmap_habit/database/habit_database.dart';
import 'package:provider/provider.dart';
import 'package:heatmap_habit/utils/samples.dart';

import '../models/habit.dart';
import '../utils/habit_util.dart';

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
        textController.clear();
      },
    );
  }

  void checkHabit(bool? value, Habit habit) {
    if (value != null) {
      context.read<HabitDatabase>().updateHabitCompletion(habit.id, value);
    }
  }

  void editHabit(Habit habit) {
    textController.text = habit.name;
    Utils.showDialogBox(
      context: context,
      content: TextField(
        controller: textController,
        decoration: const InputDecoration(hintText: "Update habit"),
      ),
      onConfirm: () {
        String habitName = textController.text;
        context.read<HabitDatabase>().updateHabitName(habit.id, habitName);
        textController.clear();
      },
    );
  }

  void deleteHabit(Habit habit) {
    Utils.showDialogBox(
      context: context,
      content: Text('Are you sure you want to delete'),
      onConfirm: () {
        context.read<HabitDatabase>().deleteHabit(habit.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
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
      body: _habitList(),
    );
  }

  Widget _habitList() {
    final habitDatabase = context.watch<HabitDatabase>();

    List<Habit> currentHabits = habitDatabase.currentHabits;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView.builder(
        itemCount: currentHabits.length,
        itemBuilder: (context, index) {
          final habit = currentHabits[index];
          bool isCompletedToday = habitStatus(habit.completedDays);

          return MyHabitTile(
            text: habit.name,
            isCompleted: isCompletedToday,
            onChanged: (value) => checkHabit(value, habit),
            editHabit: (context) => editHabit(habit),
            deleteHabit: (context) => deleteHabit(habit),
          );
        },
      ),
    );
  }
}
