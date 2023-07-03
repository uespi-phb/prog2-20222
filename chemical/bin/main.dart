// ignore_for_file: avoid_function_literals_in_foreach_calls

/*
 * ATENÇÃO O CÓDIGO DESTE ARQUIVO SERÁ USADO PARA TESTAR
 * SUA IMPLEMENTAÇÃO.
 *
 * NÃO ALTERE AS FUNÇÕES NELE EXISTENTES.
 *
 * SEU CÓDIGO DEVERÁ SE ADAPTAR ÀS CHAMADAS
 * AQUI CODIFICADOS.
 *
 */

/*
 * Os imports poderão ser alterados para se
 * adaptarem ao seu projeto
 */
import 'dart:io';
import 'package:chemical/elements.dart';
import 'package:chemical/molecule.dart';

/*
 * Exibe uma linha na tela
 */
void line([int size = 40]) {
  stdout.write('-' * size);
  stdout.write('\n');
}

/*
 * Exibe texto tabulado no console
 */
void printTabbed(
  String text, [
  List<int> tabs = const [],
]) {
  final data = text.split('\t');

  for (int i = 0; i < data.length; i++) {
    text = data[i].trim();
    if (i < tabs.length) {
      if (tabs[i] > 0) {
        text = text.padRight(tabs[i]);
      } else if (tabs[i] < 0) {
        text = text.padLeft(tabs[i].abs());
      }
    }
    stdout.write(text);
  }
  stdout.write('\n');
}

/*
 * Exibe todos os elementos químicos no console formatado
 * como uma tabela. A saída deverá ser similar a:
 *
 * SYMBOL NAME         LATIN        WEIGHT
 * Ac     Actínio      Actinium         89
 * Ag     Prata        Argentum         47
 * Al     Alumínio     Alumen           13
 * Am     Amerício     Americium        95
 * ...
 * Zn     Zinco        Zincum           30
 * Zr     Zircônio     Zirconium        40
 */
void showElements() {
  const tabs = [7, 13, 13, -6];
  Elements elements = Elements();

  printTabbed('SYMBOL\tNAME\tLATIN\tWEIGHT', tabs);
  elements.forEach(
    (elem) {
      final text = '$elem\t${elem.name}\t${elem.latinName}\t${elem.weight}';
      printTabbed(text, tabs);
    },
  );
  line();
}

/*
 * Exibe a fórmula e o nome das moléculas da lista
 * de forma tabulada. A saída deverá ser similar a:
 *
 * FORMULA        WEIGHT
 * F                   9
 * Br                 35
 * O2                 16
 * Br2                70
 * H2O                10
 * NaCl               28
 * H2SO4              50
 * NaHCO3             42
 * C6H12O6            96
 * C2H3O2NH4          42
 * C12H22N2O4        140
 * C4H4O6KNa4H2O     149
 */
void showMolecules(List<Molecule> molecules) {
  final tabs = [15, -6];

  printTabbed('FORMULA\tWEIGHT', tabs);
  for (var molecule in molecules) {
    printTabbed('${molecule.formula}\t${molecule.weight}', tabs);
  }
  line();
}

/*
 * Test a criação e alteração de uma molécula
 * for meio do getter/setter "formula"
 */
void testMolecule() {
  Molecule molecule;

  // Cria molécula
  molecule = Molecule(
    formula: 'C6H12O6',
    name: 'Molécula',
  );

  print('Fórmula: ${molecule.formula}');
  print('Peso   : ${molecule.weight}');

  // Altera molécula
  molecule.formula = 'CH3COOH';

  print('Fórmula: ${molecule.formula}');
  print('Peso   : ${molecule.weight}');

  line();
}

/*
 * Tenta criar uma molécula a partir de uma
 * fórmula inválida.
 *
 */
void createInvalidMolecule(String formula, String name) {
  try {
    final molecule = Molecule(
      formula: formula,
      name: name,
    );
    // A instrução abaixo NUNCA deverá ser executada
    print(
      'Fórmula inválida: A classe deveria ter levantado uma exceção: "${molecule.formula}"',
    );
  } catch (_) {
    print('Fórmula inválida: "$formula" ($name)');
  }
}

void main() {
  // Exibe uma tabela com todos os elementos químicos
  showElements();

  // Testa a criação e alteração de uma instância de molécula
  testMolecule();

  // Lista de moléculas válidas
  final molecules = [
    Molecule(formula: 'F', name: 'Flúor'),
    Molecule(formula: 'Br', name: 'Bromo'),
    Molecule(formula: 'O2', name: 'Gás Oxigênio'),
    Molecule(formula: 'Br2', name: 'Bromo Diatômico'),
    Molecule(formula: 'H2O', name: 'Água'),
    Molecule(formula: 'NaCl', name: 'Cloreto de Sódio'),
    Molecule(formula: 'H2SO4', name: 'Ácido Sulfúrico'),
    Molecule(formula: 'NaHCO3', name: 'Bicarbonato de Sódio'),
    Molecule(formula: 'C6H12O6', name: 'Glicose'),
    Molecule(formula: 'C2H3O2NH4', name: 'Acetato de Amônia'),
    Molecule(formula: 'C12H22N2O4', name: 'Poliuretano'),
    Molecule(formula: 'C4H4O6KNa4H2O', name: 'Tartarato de Sódio e Potássio'),
  ];

  // Exibe uma tabela com a fórmula e peso das
  // moléculas da lista em ordem natural (mesma ordem da lista)
  showMolecules(molecules);

  // Ordena as moléculas da lista em ordem
  // crescente de peso de peso atômico
  molecules.sort();

  // Exibe uma tabela com a fórmula e peso das
  // moléculas da lista em ordem crescente de peso atômico
  showMolecules(molecules);

  // Tenta criar moléculas com fórmulas inválidas
  createInvalidMolecule('', 'Fórmula vazia');
  createInvalidMolecule('H2O1', 'Fórmula inválida da água: "1"');
  createInvalidMolecule('G2H5', 'Fórmula com elemento inexistente: "G"');
}
