const bankForm = document.getElementById('bankForm');
const bankTable = document.getElementById('bankTable');
const editIndexInput = document.getElementById('editIndex');

function generateRandomId() {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    let id = '#';
    for (let i = 0; i < 6; i++) {
        const randomIndex = Math.floor(Math.random() * characters.length);
        id += characters.charAt(randomIndex);
    }
    return id;
}

function formatTipoInvestimento(tipoInvestimento) {
    if (tipoInvestimento === 'rendaFixa') {
        return 'Fixo';
    } else if (tipoInvestimento === 'rendaVariavel') {
        return 'Variavel';
    } else {
        return tipoInvestimento.charAt(0).toUpperCase() + tipoInvestimento.slice(1);
    }
}

bankForm.addEventListener('submit', function (event) {
    event.preventDefault();

    const id = generateRandomId();
    const transacao = document.getElementById('transacao').value;
    const tipoInvestimento = document.getElementById('tipoInvestimento').value;
    const nome = document.getElementById('nome').value;
    const dataRegistro = new Date(document.getElementById('dataRegistro').value).toLocaleDateString('pt-BR');
    const dataInicio = new Date(document.getElementById('dataInicio').value).toLocaleDateString('pt-BR');
    const dataResgate = new Date(document.getElementById('dataResgate').value).toLocaleDateString('pt-BR');
    const valorInvestido = parseFloat(document.getElementById('valorInvestido').value).toFixed(2);
    const editIndex = editIndexInput.value;

    const tipoInvestimentoDisplay = formatTipoInvestimento(tipoInvestimento);

    if (editIndex === '-1') {
        // Adicionar nova linha na tabela
        const newRow = bankTable.insertRow(-1);

        const cell1 = newRow.insertCell(0);
        const cell2 = newRow.insertCell(1);
        const cell3 = newRow.insertCell(2);
        const cell4 = newRow.insertCell(3);
        const cell5 = newRow.insertCell(4);
        const cell6 = newRow.insertCell(5);
        const cell7 = newRow.insertCell(6);
        const cell8 = newRow.insertCell(7);
        const statusCol = newRow.insertCell(8);
        const actionsCol = newRow.insertCell(9);

        cell1.innerHTML = id;
        cell2.innerHTML = transacao.charAt(0).toUpperCase() + transacao.slice(1); // Transação
        cell3.innerHTML = tipoInvestimentoDisplay;
        cell4.innerHTML = nome;
        cell5.innerHTML = dataRegistro;
        cell6.innerHTML = dataInicio;
        cell7.innerHTML = dataResgate;
        cell8.innerHTML = `R$ ${valorInvestido.replace('.', ',')}`;
        statusCol.innerHTML = 'Ativo';
        actionsCol.innerHTML = `<button class="btn btn-success btn-sm" onclick="editRow(this)">Editar</button> <button class="btn btn-success btn-sm" onclick="deleteRow(this)">Excluir</button>`;

        // Adicionar a classe 'small' a todas as células
        const cells = [cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8, statusCol, actionsCol];
        cells.forEach(cell => cell.classList.add('small'));
    } else {
        // Editar linha existente na tabela
        const rowToEdit = bankTable.rows[editIndex];
        rowToEdit.cells[1].innerHTML = transacao.charAt(0).toUpperCase() + transacao.slice(1); // Transação
        rowToEdit.cells[2].innerHTML = tipoInvestimentoDisplay;
        rowToEdit.cells[3].innerHTML = nome;
        rowToEdit.cells[4].innerHTML = dataRegistro;
        rowToEdit.cells[5].innerHTML = dataInicio;
        rowToEdit.cells[6].innerHTML = dataResgate;
        rowToEdit.cells[7].innerHTML = `R$ ${valorInvestido.replace('.', ',')}`;
        rowToEdit.cells[8].innerHTML = 'Ativo';

        // Limpar o índice de edição
        editIndexInput.value = '-1';
    }

    // Limpar o formulário
    bankForm.reset();
});

function editRow(button) {
    const row = button.parentNode.parentNode;
    const cells = row.cells;

    // Preencher o formulário com os dados da linha selecionada
    document.getElementById('transacao').value = cells[1].innerHTML.toLowerCase();
    document.getElementById('tipoInvestimento').value = cells[2].innerHTML === 'Fixo' ? 'rendaFixa' : cells[2].innerHTML === 'Variavel' ? 'rendaVariavel' : cells[2].innerHTML;
    document.getElementById('nome').value = cells[3].innerHTML;
    document.getElementById('dataRegistro').value = cells[4].innerHTML;
    document.getElementById('dataInicio').value = cells[5].innerHTML;
    document.getElementById('dataResgate').value = cells[6].innerHTML;
    document.getElementById('valorInvestido').value = cells[7].innerHTML.replace('R$ ', '');

    // Preencher o índice de edição
    editIndexInput.value = row.rowIndex;

    // Remover a linha da tabela
    row.remove();
}

function deleteRow(button) {
    const row = button.parentNode.parentNode;
    row.remove();
}
