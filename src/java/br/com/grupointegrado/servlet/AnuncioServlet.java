package br.com.grupointegrado.servlet;

import br.com.grupointegrado.dao.AnuncioDao;
import br.com.grupointegrado.dao.CategoriaDao;
import br.com.grupointegrado.model.Anuncio;
import br.com.grupointegrado.model.Categoria;
import br.com.grupointegrado.model.Documento;
import br.com.grupointegrado.util.ServletUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.FileUploadException;

public class AnuncioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection connection = ( Connection ) req.getAttribute( "connection" );
        
        RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/anuncio.jsp" );
        
        try {
           
            List< Categoria > categoria = new ArrayList<>();
            CategoriaDao categoriaDao = new CategoriaDao( connection );
           
            categoria = categoriaDao.getAll();
           
            req.setAttribute( "categoria", categoria );
           
        } catch (SQLException ex) {
            Logger.getLogger(IndexServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        dispatcher.forward( req, resp );
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        Anuncio anuncio = new Anuncio();
        
        /* get the current time on object contruct */
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss"); 
        Date date = new Date(); 
        String dataHora = dateFormat.format(date);

       /** Construção do Objeto anuncio **/
        try {
            /** Pega os parâmetros pelo método estático de servletUtil **/
            HashMap parametros = (HashMap) ServletUtil.getMultipartParameters( req );
            
            String docName =  ServletUtil.saveDocument( (Documento) parametros.get( "imagem" ) );
            
            Documento file = ServletUtil.getDocument( docName );
            
            anuncio.setTitulo( String.valueOf( parametros.get( "titulo" ) ) );
            anuncio.setAnoFabricacao( Integer.parseInt( (String) parametros.get( "anoFabricacao" ) ) );
            anuncio.setAnoModelo( Integer.parseInt( (String) parametros.get( "anoFabricacao" ) ) );
            anuncio.setKm( Integer.parseInt( (String) parametros.get( "km" ) ) );
            anuncio.setValor( Double.parseDouble( (String) parametros.get( "valor" ) ) );
            anuncio.setCombustivel( (String) parametros.get( "combustivel" ) );
            anuncio.setCategoria(Integer.parseInt( (String) parametros.get( "categoria" ) ) );
            anuncio.setImagem( file.getNome() );
            anuncio.setDescricao( (String) parametros.get( "descricao" ) );
            anuncio.setDataCadastro( dataHora );
            
        } catch (FileUploadException ex) {
            
            req.setAttribute( "error", "Não foi possivel instanciar o objeto: " + ex.getMessage() );
            
            RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/anuncio.jsp" );
            
            dispatcher.forward( req, resp );
            
        }
        
        try {
            
            Connection connection = ( Connection ) req.getAttribute( "connection" );
            AnuncioDao dao = new AnuncioDao( connection );
            dao.create( anuncio );
            
        } catch ( Exception e ) {
            
            req.setAttribute( "error", "Não foi possível salvar seu anuncio no banco de dados: " + e.getMessage() );
            
            RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/anuncio.jsp" );
            
            dispatcher.forward( req, resp );
            
        }
        
        req.setAttribute( "success", "Seu anuncio foi salvo com sucesso!" );
        
        resp.sendRedirect( "anuncio" );
//        RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/anuncio.jsp" );
//        
//        dispatcher.forward( req, resp );
        
    }
  
}
