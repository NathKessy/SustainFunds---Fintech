package br.com.fiap.fintech.sf.model;

import java.time.LocalDate;

public class Despesas {

	private int id;
	private ContaEmpresa contaEmpresa;
	private LocalDate dataRegistro;
	private String descricaoDespesas;
	private int quantidade;
	private String destino;
	private double custos;
	
	public Despesas(){}

	public Despesas(int id, ContaEmpresa contaEmpresa, LocalDate dataRegistro, String descricaoDespesas, int quantidade,
			String destino, double custos) {
		super();
		this.id = id;
		this.contaEmpresa = contaEmpresa;
		this.dataRegistro = dataRegistro;
		this.descricaoDespesas = descricaoDespesas;
		this.quantidade = quantidade;
		this.destino = destino;
		this.custos = custos;
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

	public LocalDate getDataRegistro() {
		return dataRegistro;
	}

	public void setDataRegistro(LocalDate dataRegistro) {
		this.dataRegistro = dataRegistro;
	}

	public String getDescricaoDespesas() {
		return descricaoDespesas;
	}

	public void setDescricaoDespesas(String descricaoDespesas) {
		this.descricaoDespesas = descricaoDespesas;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public String getDestino() {
		return destino;
	}

	public void setDestino(String destino) {
		this.destino = destino;
	}

	public double getCustos() {
		return custos;
	}

	public void setCustos(double custos) {
		this.custos = custos;
	}

	@Override
	public String toString() {
		return "Despesas [id=" + id + ", contaEmpresa=" + contaEmpresa + ", dataRegistro=" + dataRegistro
				+ ", descricaoDespesas=" + descricaoDespesas + ", quantidade=" + quantidade + ", destino=" + destino
				+ ", custos=" + custos + "]";
	}
}
