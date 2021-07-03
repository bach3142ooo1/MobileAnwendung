class Eintrag {
   String begriff;
   String definition;

   Eintrag({
     this.begriff,
     this.definition,
   });


  factory Eintrag.fromJson(Map<String, dynamic> json) {
    return Eintrag(
      begriff: json['begriff'],
      definition: json['definition'],
    );
  }


}
