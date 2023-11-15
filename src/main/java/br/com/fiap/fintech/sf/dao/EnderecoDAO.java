package br.com.fiap.fintech.sf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.fiap.fintech.sf.model.Cidade;
import br.com.fiap.fintech.sf.model.Endereco;
import br.com.fiap.fintech.sf.model.Estado;
import br.com.fiap.fintech.sf.model.Pais;

public class EnderecoDAO {
	
	public void adicionar(Endereco endereco) throws SQLException {
		PreparedStatement stmt = null;
		Connection conexao = null;
		
		try {
			conexao = Conexao.abrirConexao();
			String sql = "INSERT INTO t_endereco ( id_endereco, t_estado_id_estado, t_cidade_id_cidade, t_pais_id_pais, logradouro, bairro, numero, cep) "
					+ "VALUES ( SQ_ENDERECO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
			
			stmt = conexao.prepareStatement(sql);
			stmt.setObject(1, endereco.getEstado().getId());
			stmt.setObject(2, endereco.getCidade().getId());
			stmt.setObject(3, endereco.getPais().getId());
			stmt.setString(4, endereco.getLogradouro());
			stmt.setString(5, endereco.getBairro());
			stmt.setString(6, endereco.getNumero());
			stmt.setString(7, endereco.getCep());
			
			stmt.executeUpdate();
			
			System.out.println("INFO: Endereço " + endereco.getLogradouro() + " cadastrado!!");
			
		} catch (SQLException e) {
			System.err.println("Erro ao cadastrar um novo endereço no banco de dados!");
			e.printStackTrace();
		} finally {
			 stmt.close();
			 conexao.close();
		}
		
	}
	
	public List<Endereco> getAll() throws SQLException {
		List<Endereco> lista = new ArrayList<>();
		PreparedStatement stmt = null; 
		Connection conexao = null;
		ResultSet rs = null; 
		
		EnderecoComplementosDAO dao = new EnderecoComplementosDAO();
		
		try {
			conexao = Conexao.abrirConexao();
			String sql = "select * from t_endereco";
			stmt = conexao.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("ID_ENDERECO");
				int idEstado = rs.getInt("T_ESTADO_ID_ESTADO");
				int idCidade = rs.getInt("T_CIDADE_ID_CIDADE");
				int idPais = rs.getInt("T_PAIS_ID_PAIS");
				String logradouro = rs.getString("LOGRADOURO");
				String bairro = rs.getString("BAIRRO");
				String numero = rs.getString("NUMERO");
				String cep = rs.getString("CEP");
				
				Estado estado = dao.getEstadoById(idEstado);
				Cidade cidade = dao.getCidadeById(idCidade);
				Pais pais = dao.getPaisById(idPais);
				
				Endereco endereco = new Endereco(id, estado, cidade, pais, logradouro, bairro, numero, cep );
				lista.add(endereco);
			}
			
		} catch (SQLException e) {
			System.out.println();
			e.printStackTrace();
		} finally {
			rs.close();
			stmt.close();
			conexao.close();
		}
		
		return lista;
	}
	
	public Endereco getById(int id) throws SQLException {
		PreparedStatement stmt = null; 
		Connection conexao = null;
		ResultSet rs = null; 

		Endereco endereco = null;
		
		EnderecoComplementosDAO dao = new EnderecoComplementosDAO();
		
		try {
			conexao = Conexao.abrirConexao();
			String sql = "select * from t_endereco where id_endereco = ?";
			stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				int identifier = rs.getInt("ID_ENDERECO");
				int idEstado = rs.getInt("T_ESTADO_ID_ESTADO");
				int idCidade = rs.getInt("T_CIDADE_ID_CIDADE");
				int idPais = rs.getInt("T_PAIS_ID_PAIS");
				String logradouro = rs.getString("LOGRADOURO");
				String bairro = rs.getString("BAIRRO");
				String numero = rs.getString("NUMERO");
				String cep = rs.getString("CEP");
				
				Estado estado = dao.getEstadoById(idEstado);
				Cidade cidade = dao.getCidadeById(idCidade);
				Pais pais = dao.getPaisById(idPais);
				
				endereco = new Endereco(identifier, estado, cidade, pais, logradouro, bairro, numero, cep );
			}
			
		} catch (SQLException e) {
			System.out.println();
			e.printStackTrace();
		} finally {
			rs.close();
			stmt.close();
			conexao.close();
		}
		
		return endereco;
	}

}
