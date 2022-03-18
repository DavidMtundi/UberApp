String? geterror(String? controller) {
  final text = controller!.toString();
  if (text.isEmpty) {
    return "Field cannot be empty";
  }

  return null;
}

String? validateemail(String? email) {
  if ((email == null) || (email == "")) return "E-mail Address is required";
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  if (!emailValid) return "Invalid email Format";

  return null;
}

String? validatename(String? name) {
  if ((name == null) || (name == "")) return "Name is required";
  bool namevalid = RegExp(r"^[A-Za-z]+").hasMatch(name);
  if (!namevalid) return "Invalid Name Format";

  return null;
}

String? validatepassword(String? password) {
  if ((password == null) || (password == "")) return "Password is required";

  if (password.length < 6) return "Password Length Must be >6";

  return null;
}

String? validatephone(String? phone) {
  if ((phone == null) || (phone == "")) return "Phone is required";

  if (phone.length < 9) return "Phone Length Must be >9";

  return null;
}
