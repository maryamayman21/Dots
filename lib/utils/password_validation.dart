String?isPasswordValide(String? value) {
  if (value!.isEmpty) {
    return 'Please enter your password';
  } else if (value.length < 8) {
    return 'Please enter at least 8 character password';
  }
  return null;
}