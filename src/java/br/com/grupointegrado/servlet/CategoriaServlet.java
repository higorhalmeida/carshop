package br.com.grupointegrado.servlet;

import br.com.grupointegrado.dao.AnuncioDao;
import br.com.grupointegrado.dao.CategoriaDao;
import br.com.grupointegrado.model.Anuncio;
import br.com.grupointegrado.model.Categoria;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CategoriaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection connection = (Connection) req.getAttribute( "connection" );
        
        Integer id = Integer.parseInt( req.getParameter( "id" ) ); 
        
        if ( id == null ) {
            
            req.setAttribute( "error", "Informe uma identificação da categoria para visualizar seus anúncios." );
            
            RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/categoria.jsp" );
            dispatcher.forward( req, resp );
        }
        
        try {
            
            List< Anuncio > anuncios = new ArrayList<>();
            AnuncioDao anuncioDao = new AnuncioDao( connection );
            
            Categoria categoria = new Categoria();
            CategoriaDao categoriaDao = new CategoriaDao( connection );
            
            anuncios = anuncioDao.getAnunciosByCategoriaId( id );
            req.setAttribute( "anuncios", anuncios );
            
            categoria = categoriaDao.getCategoriaById( id );
            req.setAttribute( "categoria", categoria );
            
        } catch( Exception e ) { 
            
            req.setAttribute( "error", "Houve um erro ao realizar a buscas dos anuncios desta categoria. Por favor, tente novamente em instantes." );
        }
        
        RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/categoria.jsp" );
        dispatcher.forward( req, resp );
        
    }
    
}
