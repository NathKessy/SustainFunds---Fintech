package br.com.fiap.fintech.sf.model;

import java.time.LocalDate;

public class Fornecedores {

	private int id;
	private ContaEmpresa contaEmpresa;
	private String nome;
	private String cnpj;
	private Endereco endereco;
	private int telefone;
	private String email;
	private String categoriaFornecedor;
	private boolean status;
	private LocalDate programacaoPagamento;
	private String descricaoFornecedores;

	public Fornecedores() {
	}

	public Fornecedores(int id, ContaEmpresa contaEmpresa, String nome, String cnpj, Endereco endereco, int telefone,
			String email, String categoriaFornecedor, boolean status, LocalDate programacaoPagamento,
			String descricaoFornecedores) {
		super();
		this.id = id;
		this.contaEmpresa = contaEmpresa;
		this.nome = nome;
		this.cnpj = cnpj;
		this.endereco = endereco;
		this.telefone = telefone;
		this.email = email;
		this.categoriaFornecedor = categoriaFornecedor;
		this.status = status;
		this.programacaoPagamento = programacaoPagamento;
		this.descricaoFornecedores = descricaoFornecedores;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ContaEmpresa getContaEmpresa() {
		return contaEmpresa;
	}

	public void setContaEmpresa(ContaEmpresa contaEmpresa) {
		this.contaEmpresa = contaEmpresa;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public int getTelefone() {
		return telefone;
	}

	public void setTelefone(int telefone) {
		this.telefone = telefone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCategoriaFornecedor() {
		return categoriaFornecedor;
	}

	public void setCategoriaFornecedor(String categoriaFornecedor) {
		this.categoriaFornecedor = categoriaFornecedor;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public LocalDate getProgramacaoPagamento() {
		return programacaoPagamento;
	}

	public void setProgramacaoPagamento(LocalDate programacaoPagamento) {
		this.programacaoPagamento = programacaoPagamento;
	}

	public String getDescricaoFornecedores() {
		return descricaoFornecedores;
	}

	public void setDescricaoFornecedores(String descricaoFornecedores) {
		this.descricaoFornecedores = descricaoFornecedores;
	}

	@Override
	public String toString() {
		return "Fornecedores [id=" + id + ", contaEmpresa=" + contaEmpresa + ", nome=" + nome + ", cnpj=" + cnpj
				+ ", endereco=" + endereco + ", telefone=" + telefone + ", email=" + email + ", categoriaFornecedor="
				+ categoriaFornecedor + ", status=" + status + ", programacaoPagamento=" + programacaoPagamento
				+ ", descricaoFornecedores=" + descricaoFornecedores + "]";
	}
}
