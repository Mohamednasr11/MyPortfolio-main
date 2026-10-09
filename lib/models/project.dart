class Project {
  final String id;
  final String name;
  final String category;
  final String image;
  final String description;
  final String? headline;
  final String? subtitle;
  final List<String> tags;
  final List<String> gallery;

  const Project({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    this.headline,
    this.subtitle,
    required this.tags,
    required this.gallery,
  });
}
