bool isFile(String path) {
  RegExp urlRegex = RegExp(
      r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?");

  if (path.contains(urlRegex)) {
    return false;
  }
  return true;
}
