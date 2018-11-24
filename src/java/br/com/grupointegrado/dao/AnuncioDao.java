package br.com.grupointegrado.dao;

import br.com.grupointegrado.model.Anuncio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AnuncioDao {
    
    private Connection connection;
    
    public AnuncioDao( Connection conn) {
        this.connection = conn;
    }

    public void create( Anuncio anuncio ) throws SQLException {
        
        String sql = "INSERT INTO anuncio ( titulo, ano_fabricacao, ano_modelo, "
                + "km, valor, combustivel, categoria, imagem, descricao, data_cadastro) "
                + "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
        
        try {
            
            PreparedStatement statement = connection.prepareStatement( sql );
            
            statement.setString( 1,  anuncio.getTitulo() );
            statement.setInt( 2,  anuncio.getAnoFabricacao() );
            statement.setInt( 3,  anuncio.getAnoModelo() );
            statement.setInt( 4,  anuncio.getKm() );
            statement.setDouble( 5,  anuncio.getValor() );
            statement.setString( 6,  anuncio.getCombustivel() );
            statement.setInt( 7,  anuncio.getCategoria() );
            statement.setString( 8,  anuncio.getImagem() );
            statement.setString( 9,  anuncio.getDescricao() );
            statement.setString( 10, anuncio.getDataCadastro() );
            
            statement.execute();
            
        } catch ( Exception e ) {
            
            e.printStackTrace();
           
        }
        
    }
    
    public List< Anuncio > getAll() {
        String sql = "SELECT * FROM anuncio";
        
        try {
            
            PreparedStatement statement = connection.prepareStatement( sql );
            ResultSet result = statement.executeQuery();
            List< Anuncio > anuncios = new ArrayList<>();
            
            if ( result.first() ) {
                do {
                    Anuncio anuncio = getAnuncioByResultSet( result );
                    anuncios.add( anuncio );
                } while ( result.next() );
            }    
        
            return anuncios;
            
        } catch ( Exception e ) {
            
            e.printStackTrace();
            return null;
            
        }
        
    }
    
    public static Anuncio getAnuncioByResultSet( ResultSet result ) throws SQLException {
        Anuncio anuncio = new Anuncio();
        
        anuncio.setId( result.getInt( "id" ) );
        anuncio.setTitulo( result.getString( "titulo" ) );
        anuncio.setAnoFabricacao( result.getInt( "ano_fabricacao" ) );
        anuncio.setAnoModelo( result.getInt( "ano_modelo" ) );
        anuncio.setKm( result.getInt( "km" ) );
        anuncio.setValor( result.getDouble( "valor" ) );
        anuncio.setCombustivel( result.getString( "combustivel" ) );
        anuncio.setCategoria( result.getInt( "categoria" ) );
        anuncio.setImagem( result.getString( "imagem" ) );
        anuncio.setDescricao( result.getString( "descricao" ) );
        anuncio.setDataCadastro( result.getString( "data_cadastro" ) );
        
        return anuncio;
    }
    
    public List< Anuncio > getAnuncioByKeyword( String keyword ) {
        
        String sql = "SELECT * FROM anuncio WHERE titulo LIKE '%" + keyword + "%'";
        
        try {
            List< Anuncio > anuncios = new ArrayList<>();
            
            PreparedStatement statement = connection.prepareStatement( sql );
            
            //statement.setString( 1 , keyword );
            
            ResultSet resultset = statement.executeQuery();
            
            if ( resultset.first() ) {
                do {
                    Anuncio anuncio = getAnuncioByResultSet( resultset );
                    anuncios.add( anuncio );
                } while ( resultset.next() );
            }
            
            return anuncios;
            
        } catch ( Exception e ) {
            
            e.getMessage();
            
        }
        
        return null;
    }
    
    public Anuncio getById( Integer id ) {
        
        String sql = "SELECT * FROM anuncio WHERE id = " + id;
        
        try {
            
            PreparedStatement statement = connection.prepareStatement( sql );
            
            ResultSet resultset = statement.executeQuery();
            
            Anuncio anuncio = new Anuncio();
            
            if ( resultset.first() ) {
                do {
                    anuncio = getAnuncioByResultSet( resultset );
                } while ( resultset.next() );
            }
            
            
            return anuncio;
            
        } catch ( Exception e ) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    public List< Anuncio > getAnunciosByCategoriaId( Integer id ) {
        
        String sql = "SELECT * FROM anuncio WHERE categoria = " + id;
        
        try {
            
            PreparedStatement statement = connection.prepareStatement( sql );
            
            ResultSet resultset = statement.executeQuery();
            
            List< Anuncio > anuncios = new ArrayList<>();
            
            if ( resultset.first() ) {
                do {
                    
                    Anuncio anuncio = getAnuncioByResultSet( resultset );
                    anuncios.add( anuncio );
                    
                } while ( resultset.next() );
                
            }
            
            return anuncios;
            
        } catch ( Exception e ) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    public List< Anuncio > getMostRecentAnuncios() {
        String sql = "SELECT * FROM anuncio ORDER BY id DESC LIMIT 4";
        
        try {
            
            PreparedStatement statement = connection.prepareStatement( sql );
            ResultSet result = statement.executeQuery();
            List< Anuncio > anuncios = new ArrayList<>();
            
            if ( result.first() ) {
                do {
                    Anuncio anuncio = getAnuncioByResultSet( result );
                    anuncios.add( anuncio );
                } while ( result.next() );
            }    
        
            return anuncios;
            
        } catch ( Exception e ) {
            
            e.printStackTrace();
            return null;
            
        }
        
    }

}
