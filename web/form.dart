import 'dart:html';

main() {
  querySelector("#busca-arquivo-btn").onClick.listen((event) {
    event.preventDefault();
    window.alert("Not supported yet!");
  });

  querySelector("#add-autor-btn").onClick.listen((event) {
    event.preventDefault();
    var nome = (querySelector("input[name=nome]") as TextInputElement);
    var email = (querySelector("input[name=email]") as TextInputElement);
    var inst = (querySelector("input[name=instituicao]") as TextInputElement);

    if (nome.value.isEmpty) {
      nome.placeholder = "Digite um nome";
      return;
    }

    if (email.value.isEmpty) {
      nome.placeholder = "Digite um email";
      return;
    }

    if (inst.value.isEmpty) {
      inst.placeholder = "Digite uma instituição";
      return;
    }

    (querySelector("#autor-table") as TableSectionElement).addRow()
      ..addCell().text = nome.value
      ..addCell().text = email.value
      ..addCell().text = inst.value
      ..addCell().append(RadioButtonInputElement()
        ..name = "contato"
        ..value = nome.value)
      ..addCell().append(ButtonElement()
        ..innerText = "remover"
        ..onClick.listen(deleteRowListener));
  });
}

void deleteRowListener(Event event) {
  event.preventDefault();
  Element target = event.target;
  TableRowElement row;
  while (!(target is TableElement)) {
    target = target.parent;
    if (target is TableRowElement) {
      row = target;
    }
  }

  (target as TableElement).deleteRow(row.rowIndex);
}
