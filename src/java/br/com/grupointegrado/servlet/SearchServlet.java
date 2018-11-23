package br.com.grupointegrado.servlet;

import br.com.grupointegrado.dao.AnuncioDao;
import br.com.grupointegrado.model.Anuncio;
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

public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        Connection connection = ( Connection ) req.getAttribute( "connection" );
        
        if ( req.getParameter( "termo" ) == null ) {
            req.setAttribute( "error", "Você precisa informar uma busca válida.");
            
            RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/search.jsp" );
            dispatcher.forward( req, resp );
        }
        
        try {
            String termo = req.getParameter( "termo" );
            
            List< Anuncio > anuncios = new ArrayList<>();
            AnuncioDao anuncioDao = new AnuncioDao( connection );
            anuncios = anuncioDao.getAnuncioByKeyword( termo );
            
            if ( anuncios.size() >= 1 ) {
                
                req.setAttribute( "resultado", anuncios );
                
            }
            
        } catch ( Exception e ) {
            req.setAttribute( "error", "Houve um erro ao realizar a sua busca. Por favor, tente novamente em instantes.");
        }
        
        RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/search.jsp" );
        dispatcher.forward( req, resp );
        
    }
    
    

}
