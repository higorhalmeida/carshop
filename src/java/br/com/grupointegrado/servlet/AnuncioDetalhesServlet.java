package br.com.grupointegrado.servlet;

import br.com.grupointegrado.dao.AnuncioDao;
import br.com.grupointegrado.dao.CategoriaDao;
import br.com.grupointegrado.model.Anuncio;
import br.com.grupointegrado.model.Categoria;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AnuncioDetalhesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection connection = (Connection) req.getAttribute( "connection" );
        
        if ( req.getParameter( "id" ) == null ) {
            req.setAttribute( "error", "Informe uma identificação de produto para visualizar seu anúncio." );
            
            RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/detalhes.jsp" );
            dispatcher.forward( req, resp );
        }
        
        try {
            Integer id = Integer.parseInt( req.getParameter( "id" ) ); 
            
            Anuncio anuncio = new Anuncio();
            AnuncioDao anuncioDao = new AnuncioDao( connection );
            
            anuncio = anuncioDao.getById( id );
            
            Categoria categoria = new Categoria();
            CategoriaDao categoriaDao = new CategoriaDao( connection );
            
            categoria = categoriaDao.getCategoriaById( anuncio.getCategoria() );
            
            req.setAttribute( "resultado", anuncio );
            req.setAttribute( "categoria", categoria );
            
        } catch ( Exception e ) {
            req.setAttribute( "error", "Houve um erro ao realizar a sua busca. Por favor, tente novamente em instantes." );
        }
        
        RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/detalhes.jsp" );
        dispatcher.forward( req, resp );
        
    }

}
