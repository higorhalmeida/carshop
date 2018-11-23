package br.com.grupointegrado.servlet;

import br.com.grupointegrado.model.Documento;
import br.com.grupointegrado.util.ServletUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Recebe o parâmetro com o caminho da imagem
        String caminho = req.getParameter( "caminho" );
        
        // Faz a leitura dos bytes da imagem
        Documento documento = ServletUtil.getDocument( caminho );
        
        // Devolve a imagem no response
        resp.setContentType("img/*");
        resp.setHeader( "Content-disposition", "filename=" + documento.getNome() );
        
        ServletOutputStream out = resp.getOutputStream();
        
        out.write( documento.getBytes() );
    }

    

}
