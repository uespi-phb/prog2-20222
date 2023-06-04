import 'package:data/exchange.dart';

void main() {
  checkData(JsonData(), 'files/sample.json');
  checkData(CsvData(), 'files/sample.csv');
  checkData(TsvData(), 'files/sample.tsv');
  checkData(XmlData(), 'files/sample.xml');
}

void checkData(Data data, String fileName) {
  data.load(fileName);
  print('fileName: $fileName');
  print('fields\t: ${data.fields}');
  print('hasData\t: ${data.hasData}');
  if (data is DelimitedData) {
    final delim = (data.delimiter == ',') ? 'COMMA' : 'TAB';
    print('delim\t: $delim');
  }
  print('data:');
  print(data.data);
  print('');
}
