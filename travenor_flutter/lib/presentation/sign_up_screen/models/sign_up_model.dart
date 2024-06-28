class Usuarios {
  String? id;
  String? correo;
  String? nombre;

  Usuarios({
    this.id,
    this.correo,
    this.nombre,
  });

  factory Usuarios.fromJson(map) {
    return Usuarios(
      id: map.id,
      nombre: map['nombre'],
      correo: map['correo'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['correo'] = correo;
    data['nombre'] = nombre;

    return data;
  }
}
