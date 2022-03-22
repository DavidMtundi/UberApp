class Place {
  final String name;
  final String address;
  Place({required this.name, required this.address})
      : assert(name != null),
        assert(address != null);
}
