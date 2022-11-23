class Prodotto {
  int id_prodotto;
  String nome;
  String descrizione;
  String image;
  double prezzo;
  int disponibilita;


  Prodotto({required this.id_prodotto,required this.nome,required this.descrizione, required this.image,required this.prezzo,required this.disponibilita});

  factory Prodotto.fromJson(Map<String, dynamic> json) {
    return Prodotto(
      id_prodotto: json['idProdotto'],
      nome: json['nome'],
      descrizione: json['descrizione'],
      image: json['image'],
      prezzo: json['prezzo'],
      disponibilita: json['disponibilita']
    );
  }

  Map<String, dynamic> toJson() => {
    'idProdotto': id_prodotto,
    'nome': nome,
    'descrizione': descrizione,
    'image': image,
    'prezzo':prezzo,
    'disponibilita':disponibilita
  };

  String toString(){
    return "prodotto "+this.disponibilita.toString();
  }

  int getId(){return id_prodotto;}
  String getNome(){return nome;}
  String getDescrizione(){return descrizione;}
  String getImage(){return image;}
  double getPrezzo(){return prezzo;}
  int getDisponibilita(){return disponibilita;}

}