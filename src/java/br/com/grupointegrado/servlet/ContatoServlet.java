package br.com.grupointegrado.servlet;

import br.com.grupointegrado.dao.ContatoDao;
import br.com.grupointegrado.email.JavaMailApp;
import br.com.grupointegrado.model.Contato;
import br.com.grupointegrado.util.ContatoValidation;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContatoServlet extends HttpServlet {
    
    @Override
    protected void doGet( HttpServletRequest req, HttpServletResponse resp ) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/contato.jsp" );
        
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        Contato contato = new Contato();
        
        if ( !ContatoValidation.nomeValidate( req.getParameter( "nome" ) ) ) {
            req.setAttribute( "error", "Informe um nome válido." );
            
            RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/contato.jsp" );
            
            dispatcher.forward( req, resp );
        }
        
        if ( !ContatoValidation.nomeValidate( req.getParameter( "nome" ) ) ) {
            req.setAttribute( "error", "Informe um e-mail válido." );
            
            RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/contato.jsp" );
            
            dispatcher.forward( req, resp );
        }
        
        if ( !ContatoValidation.nomeValidate( req.getParameter( "nome" ) ) ) {
            req.setAttribute( "error", "Sua mensagem deve conter, pelo menos, 50 caracteres" );
            
            RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/contato.jsp" );
            
            dispatcher.forward( req, resp );
        }
        
        
        try {
            
            contato.setNome( req.getParameter( "nome" ) );
            contato.setEmail( req.getParameter( "email" ) );
            contato.setMensagem( req.getParameter( "mensagem" ) );
            
        } catch ( Exception e ) {
            
            req.setAttribute( "error", "Não foi possivel registrar suas informações: " + e.getMessage() );
            
            RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/contato.jsp" );
            
            dispatcher.forward( req, resp );
        }

        try {
        
            JavaMailApp.sendContatoEmail( contato );
            
        } catch ( Exception e ) {
            req.setAttribute( "error", "Não foi possivel notificar o administrador do site: " + e.getMessage() );
            
            RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/contato.jsp" );
            
            dispatcher.forward( req, resp );
        }
        
        try {
            Connection connection = ( Connection ) req.getAttribute( "connection" );
            ContatoDao dao = new ContatoDao( connection );
            dao.create( contato );
            
        } catch ( Exception e ) {
            
            req.setAttribute( "error", "Não foi possivel cadastrar no banco de dados: " + e.getMessage() );
            
            RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/contato.jsp" );
            
            dispatcher.forward( req, resp );
        }
        
        req.setAttribute( "success", "Sua mensagem foi enviada com sucesso!" );
            
        RequestDispatcher dispatcher = req.getRequestDispatcher( "WEB-INF/pages/contato.jsp" );
            
        dispatcher.forward( req, resp );
        
    }
    
}
