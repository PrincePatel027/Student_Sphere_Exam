// ignore_for_file: unused_local_variable

class UserDetails {
  static String? name;
  static String? standard;
  static String? grid;
  static dynamic userImage;
}

class ShowUserDetails {
  List<UserDetails> details = [];

  ShowUserDetails() {
    details.add(UserDetails());
  }

  List<Map<String, dynamic>> getUserDetailsList() {
    List<Map<String, dynamic>> userDetailsList = [];
    for (var detail in details) {
      Map<String, dynamic> userDetailsMap = {
        'name': UserDetails.name,
        'standard': UserDetails.standard,
        'grid': UserDetails.grid,
        'userImage': UserDetails.userImage?.path,
      };

      userDetailsList.add(userDetailsMap);
    }

    return userDetailsList;
  }
}
