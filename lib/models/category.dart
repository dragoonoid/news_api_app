class Category {
  final name;
  final imageUrl;
  Category({this.name, this.imageUrl});
}
CategoryList() {
  Category a = Category(
      name: 'Business',
      imageUrl:
          'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80');
  Category b = Category(
      name: 'Entertainment',
      imageUrl:
          'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80');
  Category c = Category(
      name: 'General',
      imageUrl:
          'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80');
  Category d = Category(
      name: 'Health',
      imageUrl:
          'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80');
  Category e = Category(
      name: 'Science',
      imageUrl:
          'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80');
  Category f = Category(
      name: 'Sports',
      imageUrl:
          'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80');
  Category g = Category(
      name: 'Technology',
      imageUrl:
          'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80');
  List<Category> list=[];
  list.add(a);
  list.add(b);
  list.add(c);
  list.add(d);
  list.add(e);
  list.add(f);
  list.add(g);
  return list;
}
