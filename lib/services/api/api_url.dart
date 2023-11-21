enum HTTPRequestMethods {get, post}

enum ApiURL{
  getList,
  getDetail,
}

extension ApiURLState on ApiURL{
  String get path {
    switch (this){
      case ApiURL.getList:
        return 'https://pokeapi.co/api/v2/berry/1/';
      case ApiURL.getDetail:
        return '';
      default:
        return '';
    }
  }

  HTTPRequestMethods? get method{
    switch (this){
      case ApiURL.getList:
      case ApiURL.getDetail:
        return HTTPRequestMethods.get;
      default:
        return null;
    }
  }
}