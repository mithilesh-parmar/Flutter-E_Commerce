class Product {
  final int id;
  final String name;
  final String slug;
  final String permalink;
  final String type;
  final bool featured;
  final String description;
  final String shortDescription;
  final String price;
  final String regularPrice;
  final String salePrice;
  final String priceHtml;
  final bool onSale;
  final int totalSale;
  final bool shippingRequired;
  final String shippingClass;
  final int shippingClassId;
  final String avgRating;
  final int ratingCount;
  final List<dynamic> relatedIds;
  final List<dynamic> upsellIds;
  final List<dynamic> crossSellIds;
  final List<dynamic> categories;
  final List<dynamic> tags;
  final List<dynamic> images;
  final List<dynamic> attributes;
  final List<dynamic> defaultAttributes;
  final String stockStatus;

  Product(
      {this.id,
        this.name,
        this.slug,
        this.permalink,
        this.type,
        this.featured,
        this.description,
        this.shortDescription,
        this.price,
        this.regularPrice,
        this.salePrice,
        this.priceHtml,
        this.onSale,
        this.totalSale,
        this.shippingRequired,
        this.shippingClass,
        this.shippingClassId,
        this.avgRating,
        this.ratingCount,
        this.relatedIds,
        this.upsellIds,
        this.crossSellIds,
        this.categories,
        this.tags,
        this.images,
        this.attributes,
        this.defaultAttributes,
        this.stockStatus});

  factory Product.fromJSON(Map<String, dynamic> parsedJson) {
    return new Product(
      id: parsedJson['id'],
      name: parsedJson['name'],
      slug: parsedJson['slug'],
      permalink: parsedJson['permalink'],
      type: parsedJson['type'],
      featured: parsedJson['featured'],
      description: parsedJson['description'],
      shortDescription: parsedJson['short_description'],
      price: parsedJson['price'],
      regularPrice: parsedJson['regular_price'],
      salePrice: parsedJson['sale_price'],
      priceHtml: parsedJson['price_html'],
      onSale: parsedJson['on_sale'],
      totalSale: parsedJson['total_sales'],
      stockStatus: parsedJson['stock_status'],
      shippingRequired: parsedJson['shipping_required'],
      shippingClass: parsedJson['shipping_class'],
      shippingClassId: parsedJson['shipping_class_id'],
      avgRating: parsedJson['average_rating'],
      ratingCount: parsedJson['rating_count'],
      relatedIds: (parsedJson['related_ids'] as List),
      upsellIds: parsedJson['upsell_ids'] as List,
      crossSellIds: parsedJson['cross_sell_ids'] as List,
      categories: (parsedJson['categories'] as List)
          .map((value) => Category.fromJson(value))
          .toList(),
      tags: (parsedJson['tags'] as List)
          .map((value) => Tag.fromJSON(value))
          .toList(),
      images: (parsedJson['images'] as List)
          .map((value) => Images.fromJSON(value))
          .toList(),
      attributes: parsedJson['attributes'] as List,
      defaultAttributes: parsedJson['default_attributes'] as List,
    );
  }

  String toString() {
    return '\nName: $name\nCategories: $categories\nDescription: $description\nprice: $price\nSale Price: $salePrice';
  }
}

class Category {
  final int id;
  final String name;
  final String slug;

  Category({this.id, this.name, this.slug});

  factory Category.fromJson(Map<String, dynamic> parsedJson) {
    return Category(
        id: parsedJson['id'],
        name: parsedJson['name'],
        slug: parsedJson['slug']);
  }

  @override
  String toString() {
    // TODO: implement toString
    return '\nCategory\tid:$id\tName: $name\tSlug: $slug';
  }
}

class Tag {
  final int id;
  final String name;
  final String slug;

  Tag({this.id, this.name, this.slug});

  factory Tag.fromJSON(Map<String, dynamic> parsedJson) {
    return Tag(
        id: parsedJson['id'],
        name: parsedJson['name'],
        slug: parsedJson['slug']);
  }

  @override
  String toString() {
    return '\nTag\nId: $id\tName:$name\tSlug: $slug';
  }
}

class Images {
  final int id;
  final String src;
  final String name;
  final String alt;

  Images({this.id, this.src, this.name, this.alt});

  factory Images.fromJSON(Map<String, dynamic> parsedJson) {
    return Images(
        id: parsedJson['id'],
        src: parsedJson['src'],
        name: parsedJson['name'],
        alt: parsedJson['alt']);
  }

  @override
  String toString() {
    return '\nImage\nid: $id\tSrc: $src\tName: $name\tAlt:$alt';
  }
}

class Attributes {
  final int id;
  final String name;
  final int position;
  final bool visible;
  final bool variation;
  final List options;

  Attributes(
      {this.id,
        this.name,
        this.position,
        this.visible,
        this.variation,
        this.options});

  factory Attributes.fromJSON(Map<String, dynamic> parsedJson) {
    return Attributes(
        id: parsedJson['id'],
        name: parsedJson[''],
        position: parsedJson[''],
        visible: parsedJson[''],
        variation: parsedJson[''],
        options: parsedJson[''] as List);
  }

  @override
  String toString() {
    return '\nAttribute\nid: $id\tName: $name\tPosition: $position\tVisible: $visible\tVariation: $variation\tOptions: $options';
  }
}

class DefaultAttributes {
  final int id;
  final String name;
  final String options;

  DefaultAttributes({this.id, this.name, this.options});

  factory DefaultAttributes.fromJSON(Map<String, dynamic> parsedJson) {
    return DefaultAttributes(
        id: parsedJson[''], name: parsedJson[''], options: parsedJson['']);
  }
}
