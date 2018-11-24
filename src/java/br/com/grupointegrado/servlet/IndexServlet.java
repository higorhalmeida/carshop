package br.com.grupointegrado.servlet;

import br.com.grupointegrado.dao.AnuncioDao;
import br.com.grupointegrado.dao.CategoriaDao;
import br.com.grupointegrado.model.Anuncio;
import br.com.grupointegrado.model.Categoria;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileUploadException;

public class IndexServlet extends HttpServlet {

   @Override
    protected void doGet( HttpServletRequest req, HttpServletResponse resp ) throws ServletException, IOException {
        Connection connection = ( Connection ) req.getAttribute( "connection" );
        
        try {
            
            List< Categoria > categoria = new ArrayList<>();
            CategoriaDao categoriaDao = new CategoriaDao( connection );
           
            categoria = categoriaDao.getAll();
           
            req.setAttribute( "categoria", categoria );
           
        } catch (SQLException ex) {
            Logger.getLogger(IndexServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            
            List< Anuncio > anuncio = new ArrayList<>();
            AnuncioDao anuncioDao = new AnuncioDao( connection );
            
            anuncio = anuncioDao.getMostRecentAnuncios();
            
            req.setAttribute( "anuncio" , anuncio );
            
        } catch ( Exception e ) {
            
        }
        
        RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/index.jsp" );
        
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost( HttpServletRequest req, HttpServletResponse resp ) throws ServletException, IOException {

    }

}
