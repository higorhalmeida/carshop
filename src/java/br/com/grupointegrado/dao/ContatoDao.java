package br.com.grupointegrado.dao;

import br.com.grupointegrado.filter.ConexaoFilter;
import br.com.grupointegrado.model.Contato;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContatoDao {
 
    private Connection connection;

    public ContatoDao( Connection conn ) throws SQLException {
        this.connection = conn;
    }
    
    public void create( Contato contato ) throws SQLException {
        String sql = "INSERT INTO contato ( nome, email, mensagem ) VALUES ( ?, ?, ?) ";
        
        try {

            PreparedStatement statement = connection.prepareStatement(sql);
            
            statement.setString( 1, contato.getNome() );
            statement.setString( 2, contato.getEmail() );
            statement.setString( 3, contato.getMensagem() );
            
            statement.execute();
            
        } catch ( Exception e ) {
            
            e.printStackTrace();

        }
    }
}
