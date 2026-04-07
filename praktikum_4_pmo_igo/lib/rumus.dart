class Lingkaran {
  double? _jariJari;

  Lingkaran([this._jariJari]);

  double? get getJariJari {
    return _jariJari;
  }

  set setJariJari(double jariJari) {
    _jariJari = jariJari;
  }

  double getDiameterLingkaran() {
    return 2 * _jariJari!;
  }

  double getLuasLingkaran() {
    return 22 / 7 * _jariJari! * _jariJari!;
  }

  double getKellingLingkaran() {
    return 2 * 22 / 7 * _jariJari!;
  }
}

class Tabung extends Lingkaran {
  double? _tinggi;

  Tabung([super._jariJari, this._tinggi]);

  double? get getTinggi {
    return _tinggi;
  }

  set setTinggi(double tinggi) {
    _tinggi = tinggi;
  }

  double getVolumeTabung() {
    return getLuasLingkaran() * _tinggi!;
  }

  double getLuasSelimutTabung() {
    return getKellingLingkaran() * _tinggi!;
  }

  double getLuasPermukaanTabung() {
    return getLuasSelimutTabung() + 2 * getLuasLingkaran();
  }
}

class PersegiPanjang {
  double? _panjang;
  double? _lebar;

  PersegiPanjang([this._panjang, this._lebar]);

  double? get getPanjang {
    return _panjang;
  }

  double? get getLebar {
    return _lebar;
  }

  set setPanjang(double panjang) {
    _panjang = panjang;
  }

  set setLebar(double lebar) {
    _lebar = lebar;
  }

  double getLuasPersegiPanjang() {
    return _panjang! * _lebar!;
  }

  double getKelilingPersegiPanjang() {
    return 2 * (_panjang! + _lebar!);
  }
}

class Balok extends PersegiPanjang {
  double? _tinggi;

  Balok([super._panjang, super._lebar, this._tinggi]);

  double? get getTinggi {
    return _tinggi;
  }

  set setTinggi(double tinggi) {
    _tinggi = tinggi;
  }

  double getVolumeBalok() {
    return getLuasPersegiPanjang() * _tinggi!;
  }

  double getLuasBalok() {
    return 2 *
        (getLuasPersegiPanjang() +
            (_panjang! * _tinggi!) +
            (_lebar! * _tinggi!));
  }
}
