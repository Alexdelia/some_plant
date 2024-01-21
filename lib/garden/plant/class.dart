class Plant {
  final int id;
  String name;
  int level;
  int gp; // growth point

  // TODO: make the name generator in rust
  Plant({
    required this.id,
    required this.name,
    this.level = 0,
    this.gp = 0,
  });

  // function to absorb growth point
  // TODO: make it in rust
  bool absorbGrowthPoint(int gp) {
    this.gp += gp;

    if (this.gp >= level * 10) {
      level++;
      return true;
    }

    return false;
  }
}
