package br.com.grupointegrado.dao;

import br.com.grupointegrado.model.Categoria;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDao {
    
    private final Connection connection;
    
    public CategoriaDao( Connection conn ) throws SQLException {
        this.connection = conn;
    }
    
    public List< Categoria > getAll() throws SQLException {
        String sql = "SELECT * FROM categoria";
        
        try {
            PreparedStatement statement = connection.prepareStatement( sql );
            List< Categoria > categoria = new ArrayList<>();

            ResultSet result = statement.executeQuery();

            if ( result.first() ) {
                do {
                    Categoria cat = getCategoriaByResultset( result );
                    categoria.add( cat );
                } while ( result.next() );
            }

            return categoria;
        } catch ( Exception e ) {
            
            e.printStackTrace();
            
        }
        
        return null;
    }
    
    public Categoria getCategoriaById( Integer id ) throws SQLException {
        
        String sql = "SELECT * FROM categoria WHERE id = " + id ;
        
        try {
            
            Categoria categoria = new Categoria();
            
            PreparedStatement statement = connection.prepareStatement( sql );
            
            ResultSet resultset = statement.executeQuery();
            
            if ( resultset.first() ) {
                do {
                    categoria = getCategoriaByResultset( resultset );
                } while ( resultset.next() );
            }
            
            return categoria;
 
        } catch ( Exception e ) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    public static Categoria getCategoriaByResultset( ResultSet result ) throws SQLException {
        Categoria categoria = new Categoria();
        
        categoria.setId( result.getInt( "id" ) );
        categoria.setNome( result.getString( "nome" ) );
        
        return categoria;
    }
}
