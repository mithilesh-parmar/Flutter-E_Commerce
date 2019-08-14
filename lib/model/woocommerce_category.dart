class Category {
  final int id;
  final String name;
  final String slug;
  final int parentId;
  final String description;
  final int count;
  final Image image;

  Category(
      {this.id,
      this.name,
      this.slug,
      this.parentId,
      this.description,
      this.count,
      this.image});

  factory Category.fromJSON(Map<String, dynamic> parsedJson) {
    return Category(
        id: parsedJson['id'],
        name: parsedJson['name'],
        slug: parsedJson['slug'],
        parentId: parsedJson['parent'],
        description: parsedJson['description'],
        image: Image.fromJSON(parsedJson['image']),
        count: parsedJson['count']);
  }

  @override
  String toString() {
    // TODO: implement toString
    return '\nCategory\nName: $name\tDescription: $description\tCount: $count';
  }
}

class Image {
  final int id;
  final String src;
  final String name;
  final String alt;

  Image({this.id, this.src, this.name, this.alt});

  factory Image.fromJSON(Map<String, dynamic> parsedJson) {
    return Image(
        id: parsedJson['id'],
        src: parsedJson['src'],
        name: parsedJson['name'],
        alt: parsedJson['alt']);
  }

  @override
  String toString() {
    // TODO: implement toString
    return '\nImage \nsrc: $src\tName: $name';
  }
}
