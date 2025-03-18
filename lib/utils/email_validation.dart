String? isEmailValide(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  } else if (!value.endsWith('.com') && !value.contains('@')) {
    return 'Please Enter valide email address';
  }
  return null;
}