<%@page import="br.com.grupointegrado.model.Anuncio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<%@include file="/WEB-INF/includes/head.jsp" %>
<%@include file="/WEB-INF/includes/topMenu.jsp" %>

<div class="container" style="min-height: 600px;">
    
    <% List< Anuncio > anuncios = (List) request.getAttribute( "resultado" ); %>
    <% String error = (String) request.getAttribute("error"); %>
    
    <div class="row">
        <div class="col s12">
            <h2>Resultados para "<%= request.getParameter("termo") %>"</h2>
        </div>    
            
        <% if ( error != null ) { %>
        <div class="col s12">
            <div class="card-panel red lighten-2"><%= error %></div>
        </div>
        <% } %>
            
        <% if ( anuncios != null ) { %>
            
            <% if ( anuncios.size() >= 1 ) { %>
                
                <% for( Anuncio anuncio : anuncios ) { %>
                    
                <div class="col s12 m12 l12 xl6">
                    
                    <div class="card horizontal">    
                        <div class="card-image">
                            <img src="img?caminho=<%= anuncio.getImagem() %>" style="min-height: 100%">
                        </div>

                        <div class="card-stacked">
                            
                            <div class="card-content">
                                
                                <h5 style="margin-top: 0"><%= anuncio.getTitulo() %></h5>
                                <p>
                                    <strong>Ano:</strong> <%= anuncio.getAnoFabricacao() %> - <%= anuncio.getAnoModelo() %>, <%= anuncio.getKm() %> km</p>
                                <p>
                                    <script>
                                        document.write( ( <%= anuncio.getValor() %> ).toLocaleString( 'pt-BR' , { minimumFractionDigits: 2 , style: 'currency', currency: 'BRL' } ) );
                                    </script>
                                </p>
                            
                                <div class="row right-align">
                                    <div class="col s12">
                                        <a href="/carshop/anuncio-detalhes?id=<%= anuncio.getId() %>" class="waves-effect waves-light btn-large">Ver Mais</a>
                                    </div>
                                </div>
                                    
                            </div>
                                    
                        </div>
                                    
                    </div>
                                    
                </div>
                <% } %>
                    
            <% } else { %>
            
            <div class="col s12">
                <div class="card-panel red lighten-2">Não há resultados para sua busca.</div>
            </div>
            
            <% } %>
            
        <% } else { %>
        
        <div class="col s12">
                <div class="card-panel red lighten-2">Não há resultados para sua busca.</div>
        </div>
        
        <% } %>
    </div>
</div>
ß
<%@include file="/WEB-INF/includes/footer.jsp" %>
    
</html>