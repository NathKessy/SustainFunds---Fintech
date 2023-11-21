package br.com.fiap.fintech.sf.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import br.com.fiap.fintech.sf.model.ContaEmpresa;
import br.com.fiap.fintech.sf.model.Investimento;
import br.com.fiap.fintech.sf.model.enums.StatusEnum;
import br.com.fiap.fintech.sf.model.enums.TipoInvestimentoEnum;

public class InvestimentosDAO {

	public void adicionar(Investimento investimento) throws SQLException {
		if (investimento.getContaEmpresa().getId() == null) {
			System.out.println("ID não localizado na base de dados");
			return;
		}

		Connection conexao = null;
		PreparedStatement stmt = null;

		try {
			conexao = Conexao.abrirConexao();
			String sql = "INSERT INTO t_investimentos (ID_INVESTIMENTOS, T_CONTA_EMPRESA_ID_CONTA, TIPO_INVEST, VALOR_INVESTIDO, DATA_INICIO, DATA_RESGATE, DESCRICAO_INVEST, STATUS, DATA_REGISTRO)"
					+ "    VALUES (sq_investimento.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";

			stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, investimento.getContaEmpresa().getId());
			stmt.setString(2, investimento.getTipoInvestimento().toString());
			stmt.setDouble(3, investimento.getValorInvestido());

			Date dateInicio = Date.valueOf(investimento.getDataInicio());
			stmt.setDate(4, dateInicio);

			Date dataResgate = Date.valueOf(investimento.getDataResgate());
			stmt.setDate(5, dataResgate);

			stmt.setString(6, investimento.getDescricaoInvestimento());
			stmt.setString(7, investimento.getStatus().toString());

			Date dateRegistro = Date.valueOf(investimento.getDataRegistro());
			stmt.setDate(8, dateRegistro);

			stmt.executeUpdate();

			System.out
					.println("INFO: O Investimento: " + investimento.getDescricaoInvestimento() + ", foi cadastrado!!");

		} catch (SQLException erro) {
			System.err.println("Erro ao cadastrar o investimento atual no banco de dados!");
			erro.printStackTrace();

		} finally {
			stmt.close();
			conexao.close();
		}
	}

	public List<Investimento> getAll() throws SQLException {
		List<Investimento> lista = new ArrayList<>();
		PreparedStatement stmt = null;
		Connection conexao = null;
		ResultSet rs = null;

		ContaEmpresaDAO contaEmpresaDAO = new ContaEmpresaDAO();

		try {
			conexao = Conexao.abrirConexao();
			String sql = "select * from t_investimentos order by id_investimentos asc";
			stmt = conexao.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("ID_INVESTIMENTOS");
				int idEmpresa = rs.getInt("T_CONTA_EMPRESA_ID_CONTA");
				String tipoInvestimento = rs.getString("TIPO_INVEST");
				double valorInvestido = rs.getDouble("VALOR_INVESTIDO");
				Date dataInicio = rs.getDate("DATA_INICIO");
				Date dataRegaste = rs.getDate("DATA_RESGATE");
				String descricaoInvestimento = rs.getString("DESCRICAO_INVEST");
				String status = rs.getString("STATUS");
				Date dataRegistro = rs.getDate("DATA_REGISTRO");

				ContaEmpresa contaEmpresa = contaEmpresaDAO.getById(idEmpresa);

				LocalDate dateInicio = convertToEntityAttribute(dataInicio);
				LocalDate dateRegaste = convertToEntityAttribute(dataRegaste);
				LocalDate dateRegistro = convertToEntityAttribute(dataRegistro);

				Investimento investimento = new Investimento(id, contaEmpresa,
						TipoInvestimentoEnum.valueOf(tipoInvestimento), valorInvestido, dateInicio, dateRegaste,
						descricaoInvestimento, StatusEnum.valueOf(status), dateRegistro);
				lista.add(investimento);

			}

		} catch (SQLException e) {
			System.err.println("Erro ao listar investimento ao banco de dados!");
			e.printStackTrace();
		} finally {
			rs.close();
			stmt.close();
			conexao.close();
		}

		return lista;
	}

	public Investimento buscarInvestimentoPorIdNome(Integer idInvestimento, String nome) throws SQLException {
		Investimento investimentoRetorno = null;
		PreparedStatement stmt = null;
		Connection conexao = null;
		ResultSet rs = null;
		boolean isPrecisaEnd = false;

		ContaEmpresaDAO contaEmpresaDAO = new ContaEmpresaDAO();
		StringBuilder sql = new StringBuilder("select * from t_investimentos where ");

		if (idInvestimento != 0) {
			sql.append(" ID_INVESTIMENTOS = " + idInvestimento);
			isPrecisaEnd = true;
		}

		if (nome != "") {
			if (isPrecisaEnd == true) {
				sql.append(" and ");
			}
			sql.append(" DESCRICAO_INVEST = '" + nome + "'");
		}

		try {
			conexao = Conexao.abrirConexao();
			stmt = conexao.prepareStatement(sql.toString());
			rs = stmt.executeQuery();

			if (rs.next()) {
				int id = rs.getInt("ID_INVESTIMENTOS");
				int idEmpresa = rs.getInt("T_CONTA_EMPRESA_ID_CONTA");
				String tipoInvestimento = rs.getString("TIPO_INVEST");
				double valorInvestido = rs.getDouble("VALOR_INVESTIDO");
				Date dataInicio = rs.getDate("DATA_INICIO");
				Date dataRegaste = rs.getDate("DATA_RESGATE");
				String descricaoInvestimento = rs.getString("DESCRICAO_INVEST");
				String status = rs.getString("STATUS");
				Date dataRegistro = rs.getDate("DATA_REGISTRO");

				ContaEmpresa contaEmpresa = contaEmpresaDAO.getById(idEmpresa);

				LocalDate dateInicio = convertToEntityAttribute(dataInicio);
				LocalDate dateRegaste = convertToEntityAttribute(dataRegaste);
				LocalDate dateRegistro = convertToEntityAttribute(dataRegistro);

				Investimento investimento = new Investimento(id, contaEmpresa,
						TipoInvestimentoEnum.valueOf(tipoInvestimento), valorInvestido, dateInicio, dateRegaste,
						descricaoInvestimento, StatusEnum.valueOf(status), dateRegistro);
				investimentoRetorno = investimento;
			}

		} catch (SQLException e) {
			System.err.println("Erro ao listar investimento ao banco de dados!");
			e.printStackTrace();
		} finally {
			rs.close();
			stmt.close();
			conexao.close();
		}

		return investimentoRetorno;
	}

	public Investimento buscaPorId(Integer idInvestimento) throws SQLException {
		Investimento investimentoRetorno = null;
		PreparedStatement stmt = null;
		Connection conexao = null;
		ResultSet rs = null;

		ContaEmpresaDAO contaEmpresaDAO = new ContaEmpresaDAO();
		String sql = "SELECT * FROM T_INVESTIMENTOS WHERE ID_INVESTIMENTOS = ?";

		try {
			conexao = Conexao.abrirConexao();
			stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, idInvestimento);
			rs = stmt.executeQuery();

			if (rs.next()) {
				int id = rs.getInt("ID_INVESTIMENTOS");
				int idEmpresa = rs.getInt("T_CONTA_EMPRESA_ID_CONTA");
				String tipoInvestimento = rs.getString("TIPO_INVEST");
				double valorInvestido = rs.getDouble("VALOR_INVESTIDO");
				Date dataInicio = rs.getDate("DATA_INICIO");
				Date dataRegaste = rs.getDate("DATA_RESGATE");
				String descricaoInvestimento = rs.getString("DESCRICAO_INVEST");
				String status = rs.getString("STATUS");
				Date dataRegistro = rs.getDate("DATA_REGISTRO");

				ContaEmpresa contaEmpresa = contaEmpresaDAO.getById(idEmpresa);

				LocalDate dateInicio = convertToEntityAttribute(dataInicio);
				LocalDate dateRegaste = convertToEntityAttribute(dataRegaste);
				LocalDate dateRegistro = convertToEntityAttribute(dataRegistro);

				Investimento investimento = new Investimento(id, contaEmpresa,
						TipoInvestimentoEnum.valueOf(tipoInvestimento), valorInvestido, dateInicio, dateRegaste,
						descricaoInvestimento, StatusEnum.valueOf(status), dateRegistro);
				investimentoRetorno = investimento;
			}

		} catch (SQLException e) {
			System.err.println("Erro ao listar investimento ao banco de dados!");
			e.printStackTrace();
		} finally {
			rs.close();
			stmt.close();
			conexao.close();
		}

		return investimentoRetorno;
	}

	public void updateInvestimento(Investimento investimento) throws SQLException {
		Connection conexao = null;
		PreparedStatement stmt = null;

		Date dateInicio = Date.valueOf(investimento.getDataInicio());
		Date dataResgate = Date.valueOf(investimento.getDataResgate());
		Date dateRegistro = Date.valueOf(investimento.getDataRegistro());

		try {
			conexao = Conexao.abrirConexao();
			String sql = "UPDATE t_investimentos SET "
					+ "tipo_invest = ?, valor_investido = ?, data_inicio = ?, data_resgate = ?, "
					+ "descricao_invest = ?, status = ?, data_registro = ? " + "WHERE id_investimentos = ?";

			stmt = conexao.prepareStatement(sql);

			stmt.setString(1, investimento.getTipoInvestimento().toString());
			stmt.setDouble(2, investimento.getValorInvestido());
			stmt.setDate(3, dateInicio);
			stmt.setDate(4, dataResgate);
			stmt.setString(5, investimento.getDescricaoInvestimento());
			stmt.setString(6, investimento.getStatus().toString());
			stmt.setDate(7, dateRegistro);
			stmt.setInt(8, investimento.getId());

			stmt.executeUpdate();

			System.out
					.println("INFO: O Investimento: " + investimento.getDescricaoInvestimento() + ", foi cadastrado!!");

		} catch (SQLException erro) {
			System.err.println("Erro ao cadastrar o investimento atual no banco de dados!");
			erro.printStackTrace();

		} finally {
			stmt.close();
			conexao.close();
		}
	}

	public void remover(int idInvestimento) throws SQLException {
		PreparedStatement stmt = null;
		Connection conexao = null;
		ResultSet rs = null;

		String sql = "DELETE FROM t_investimentos WHERE id_investimentos = ?";

		try {
			conexao = Conexao.abrirConexao();
			stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, idInvestimento);
			rs = stmt.executeQuery();

		} catch (SQLException e) {
			System.err.println("Erro ao listar investimento ao banco de dados!");
			e.printStackTrace();
		} finally {
			rs.close();
			stmt.close();
			conexao.close();
		}
	}

	public LocalDate convertToEntityAttribute(Date date) {
		return Optional.ofNullable(date).map(Date::toLocalDate).orElse(null);
	}
}
