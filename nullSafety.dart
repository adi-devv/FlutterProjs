int x = 8;

// ? after a datatype means the variable may be null

int? y;

String? nameFromDatabase = "Aady";

// ?? provides a fallback value in case value is null
String nameInApp = nameFromDatabase ?? 'No name';

/*

! after a variable means, it's certain that it won't be null
?. null aware operator -> used to access a property of an obj

- if not null -> returns normally
- if null -> returns null
*/

void main() {
  print(nameFromDatabase!.length);
}
