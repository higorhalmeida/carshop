<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%
    Calendar cal = GregorianCalendar.getInstance();
%>

    <footer class="page-footer">
        <div class="container">
            <div class="row">
            
                <div class="col l6 s12">
                    <h5 class="white-text">Carshop Anuncios LTDA</h5>
                    <p class="grey-text text-lighten-4">A Carshop Anuncios LTDA 
                        é uma iniciativa de um dos acadêmicos de Análise e Desenvolvimento 
                        de Sistemas do Centro Universitário Integrado de Campo Mourão 
                        que sonha em ser grande dentro do mundo da TI.
                    </p>
                </div>
                
                <div class="col l4 offset-l2 s12">
                    <h5 class="white-text">Links</h5>
                    <ul>
                        <li>
                            <a class="grey-text text-lighten-3" href="/carshop/">Início</a>
                        </li>
                        <li>
                            <a class="grey-text text-lighten-3" href="/carshop/anuncio">Anunciar</a>
                        </li> 
                        <li>
                            <a class="grey-text text-lighten-3" href="/carshop/contato">Contato</a>
                        </li>
                    </ul>
                </div>
                
            </div>
            
        </div>
        
        <div class="footer-copyright">
            <div class="container">
                © <%= cal.get( Calendar.YEAR ) %> Carshop Anuncios LTDA
                <a class="grey-text text-lighten-4 right" href="https://www.facebook.com/higor.almeidasilva">
                    Sobre o Desenvolvedor
                </a>
            </div>
        </div>
                
    </footer>
                
</body>