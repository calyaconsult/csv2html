function generateTable(parser,obj) {
  var p;
  var data;
  if (parser === 'D3') {
    data = obj;
    p = 'D3.js';
  } else if (parser === 'PP') {
    // Wenn Papa.parse() eine leere Zeile liest und als letztes Element nur `{"LastWriteTime": ""}` zurück liefert,
    // wird das letzte Element nicht berücksichtigt.
    p = 'Papa Parse';
    data = (typeof obj.data[obj.data.length-1]["Filename"]==="undefined") ? obj.data.slice(0,obj.data.length-1) : obj.data;
  }
  var result = `<h3>Aus CSV mit ${p} generierte Tabelle</h3><table class="customTable" id="table-bsp-2">
    <thead>
      <tr>
        @header
      <tr>
    </thead>
    <tbody>
      @body
    </tbody>
  </table>`;

  const columns = Object.keys(data[0]);
  var header = "";
  columns.forEach(h => header += `<th>${h}</th>`);
  result = result.replace("@header", header);
  var body = "";
  data.forEach(row => {
    var keys = Object.keys(row);
    var b = "";
    keys.forEach(k => {
      b += `<td>${row[k]}</td>`;
    });
    body += "<tr>" + b + "</tr>";
  });
  result = result.replace("@body", body);
  document.getElementById("result").innerHTML = result;
}
