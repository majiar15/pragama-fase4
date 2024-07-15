class UserModel {
    Address address;
    int id;
    String email;
    String username;
    String password;
    Name name;
    String phone;
    int v;

    UserModel({
        required this.address,
        required this.id,
        required this.email,
        required this.username,
        required this.password,
        required this.name,
        required this.phone,
        required this.v,
    });
}

class Address {
    Geolocation geolocation;
    String city;
    String street;
    int number;
    String zipcode;

    Address({
        required this.geolocation,
        required this.city,
        required this.street,
        required this.number,
        required this.zipcode,
    });
}

class Geolocation {
    String lat;
    String long;

    Geolocation({
        required this.lat,
        required this.long,
    });
}

class Name {
    String firstname;
    String lastname;

    Name({
        required this.firstname,
        required this.lastname,
    });
}
