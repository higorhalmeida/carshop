package br.com.grupointegrado.filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class ConexaoFilter implements Filter {
    
    @Override
    public void init(FilterConfig fc) throws ServletException {
        
        try {
            
            Class.forName( "com.mysql.cj.jdbc.Driver" );
            
        } catch ( ClassNotFoundException ex ) {
            
            ex.printStackTrace();
            
        }
    }
    
    public static Connection getConnection() throws SQLException {
        
        Properties config = new Properties();
        
        config.setProperty( "user", "root" );
        config.setProperty( "password", "root" );
        config.setProperty( "serverTimezone", "America/Sao_Paulo" );
        
        String url = "jdbc:mysql://localhost:3306/carshop";
        
        return DriverManager.getConnection( url, config );
    }
    
    private void closeConnection( Connection connection ) {
        
        try {
            
            connection.close();
            
        } catch ( Exception e ) {
            
            e.printStackTrace();
        }
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse rep, FilterChain filterChain) throws IOException, ServletException {
        Connection connection = null;
        
        try {
            
            connection = getConnection();
            
            req.setAttribute( "connection", connection );
            filterChain.doFilter( req, rep );
            
        } catch ( Exception e ) {
            
            throw new RuntimeException( e );
            
        } finally {
            
            closeConnection( connection );
            
        }
    }

    @Override
    public void destroy() {

    }
    
}
