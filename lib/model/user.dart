import 'package:rest_api/model/user.dob.dart';
import 'package:rest_api/model/user_location.dart';
import 'package:rest_api/model/user_name.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  // final UserPicture picture;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    // required this.picture,
  });

factory User.fromMap(Map<String, dynamic>e){

  final name = UserName(
    title: e['name']['title'],
    first: e['name']['first'],
    last: e['name']['last'],
  );
  final date = e['dob']['date'];
  final dob = UserDob(
    age: e['dob']['age'],
    date: DateTime.parse(date),
  );
  final coordinates = LocationCoordinate(
    latitude: e['location']['coordinates']['latitude'],
    longitude: e['location']['coordinates']['longitude'],
  );
  final street = LocationStreet(
    name: e['location']['street']['name'],
    number: e['location']['street']['number'],
  );
  final timezone = LocationTimezon(
    description: e['location']['timezone']['description'],
    offset: e['location']['timezone']['offset'],
  );
  final location = UserLocation(
    city: e['location']['city'],
    country: e['location']['country'],
    postcode: e['location']['postcode'].toString(),
    state: e['location']['state'],
    coordinates: coordinates,
    street: street,
    timezon: timezone,
  );
  // final picture =

  return User(
    cell: e['cell'],
    email: e['email'],
    gender: e['gender'],
    nat: e['nat'],
    phone: e['phone'],
    name: name,
    dob: dob,
    location: location,
  );
}


  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
