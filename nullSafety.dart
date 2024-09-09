int x = 8;

// ? after a datatype means the variable may be nu ll

int? y;

String? nameFromDatabase = "Aady";

// ?? provides a fallback value in case value is null
String nameInApp = nameFromDatabase ?? 'No name';

/*

! after a variable means, it's certain that it won't be nuull
?. null aware operator -> used to access a property of an obj

- if not null -> returns normally
- if null -> returns null

?. gracefully handles null values without your app crashing

Conditional check was used before NULL SAFETY:

if(a!=null){}
*/

class Student {
  final String name;
  final int? score;

  Student({required this.name, this.score});
}

String scoreAsPerc(int? score) {
  int total = 100;
  double perc = (score?.toDouble() ?? 0) * 100 / total;

  return score==null?"Absent":"${perc.toStringAsFixed(2)}%";
}

void main() {
  print(nameFromDatabase!.length);

  List<Student> s = [
    Student(name: "Aa", score: 59),
    Student(name: "Za"),
    Student(name: "Ba", score: 69),
    Student(name: "Ca", score: 79),
    Student(name: "Da"),
  ];
  for (var stud in s){
    print("${stud.name}'s percentage: ${scoreAsPerc(stud.score)}");

  }

}
