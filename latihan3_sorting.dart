class Mahasiswa implements Comparable<Mahasiswa> {
  String nrp;
  String nama;

  Mahasiswa(this.nrp, this.nama);

  @override
  String toString() {
    return 'Mahasiswa{nrp: $nrp, nama: $nama}';
  }

  @override
  int compareTo(Mahasiswa other) {
    return nrp.compareTo(other.nrp);
  }
}

class Latinan {
  static int partition<T extends Comparable<T>>(List<T> arr, int p, int r) {
    T pivot = arr[r];
    int i = p - 1;
    for (int j = p; j < r; j++) {
      if (arr[j].compareTo(pivot) <= 0) {
        i++;
        T temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }
    T temp = arr[i + 1];
    arr[i + 1] = arr[r];
    arr[r] = temp;
    return i + 1;
  }

  static void quickSort<T extends Comparable<T>>(List<T> arr, int p, int r) {
    if (p < r) {
      int q = partition(arr, p, r);
      quickSort(arr, p, q - 1);
      quickSort(arr, q + 1, r);
    }
  }

  static void tampil<T>(List<T> data) {
    for (T item in data) {
      print(item);
    }
  }

  static void main() {
    List<Mahasiswa> arr8 = [
      Mahasiswa("02", "Budi"),
      Mahasiswa("01", "Andi"),
      Mahasiswa("04", "Udin"),
      Mahasiswa("03", "Candra")
    ];

    DateTime startTime = DateTime.now();
    quickSort(arr8, 0, arr8.length - 1);
    tampil(arr8);
    Duration elapsedTime = DateTime.now().difference(startTime);
    print('Waktu eksekusi: ${elapsedTime.inMilliseconds} ms');
  }
}

void main() {
  Latinan.main();
}
