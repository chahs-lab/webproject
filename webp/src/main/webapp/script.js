function addRow() {
      var table = document.getElementById('table');
      var newRow = table.insertRow(table.rows.length-1);
      var cell1 = newRow.insertCell();
      var cell2 = newRow.insertCell();
      var cell3 = newRow.insertCell();
      var cell4 = newRow.insertCell();
      cell1.innerHTML = table.rows.length-3;
      cell2.innerHTML = '<input class="quiz_a" type="text" name="question">';
      cell3.innerHTML = '<input class="quiz_a" type="text" name="answer">';
      cell4.innerHTML = '<input type="checkbox">';
}

function subRow(){
	var table = document.getElementById('table');
	for (var i=2; i<table.rows.length; i++){
		var check = table.rows[i].cells[3].childNodes[0].checked;
		if(check){
			table.deleteRow(i);
			i--
		}
	}
	for (var i=2; i<table.rows.length-1; i++){
		table.rows[i].cells[0].innerHTML = i-1;
	}
}