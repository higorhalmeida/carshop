<%@page import="br.com.grupointegrado.model.Anuncio"%>
<%@page import="java.util.List"%>
<%@page import="br.com.grupointegrado.model.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    List< Categoria > categoria = (List) request.getAttribute( "categoria" ); 
    List< Anuncio > anuncio = (List) request.getAttribute( "anuncio" );
%>

<!DOCTYPE html>
<html>

<%@include file="/WEB-INF/includes/head.jsp" %>
<%@include file="/WEB-INF/includes/topMenu.jsp" %>

<div class="container" style="min-height: 600px;">
    
    <div class="row">
        <div class="col s4" >
    
            <div class="row">
                <nav>
                    <div class="nav-wrapper">
                        <form method="GET" action="/carshop/search">
                            <div class="input-field">
                                <input id="search" type="search" required name="termo">
                                <label class="label-icon" for="search">
                                    <i class="material-icons">search</i>
                                </label>
                                <i class="material-icons">close</i>
                            </div>
                        </form>
                    </div>
                </nav>
            </div>
            
            <% if ( categoria != null ) { %>
            
            <div class="row">
                <div class="collection">
                <% for ( Categoria c : categoria ) { %>
                    <a href="<% %>" class="collection-item" >
                        <%= c.getNome() %>
                    </a>
                <% } %>
                </div>
                
            </div>
            <% } else { %>
            <div class="row">
                <div class="card-panel red lighten-2">
                    Ainda não há categorias cadastradas...
                </div>
            </div>
            <% } %>
        </div>
        
        <div class="col s8">
            
            <% if ( anuncio != null ) { %>
            
                <% if ( anuncio.size() >= 1 ) { %>

                    <% for ( Anuncio an : anuncio ) { %>
                        
                        <div class="row">

                            <div class="col s4">

                                <div class="card hoverable" style="margin-top: 0 !important">

                                    <div class="card-image waves-effect waves-block waves-light">
                                        <img class="activator" src="img?caminho=<%= an.getImagem() %>">
                                    </div>

                                    <div class="card-content">
                                        <span class="card-title activator grey-text text-darken-4"><%= an.getTitulo() %><i class="material-icons right">more_vert</i></span>
                                        <p>
                                            <a href="anuncio-detalhes?id=<%= an.getId() %>">Ver Mais</a>
                                        </p>
                                    </div>

                                    <div class="card-reveal">
                                        <span class="card-title grey-text text-darken-4"><%= an.getTitulo() %><i class="material-icons right">close</i></span>
                                        <p><%= an.getDescricao() %></p>
                                    </div>

                                </div>

                            </div>

                            <div class="col s5">
                                <h4><%= an.getTitulo() %></h2>
                                <p>
                                    <strong>Ano - Modelo: </strong><%= an.getAnoFabricacao() %> - <%= an.getAnoModelo() %> <br />
                                    <strong>Combustivel: </strong> <%= an.getCombustivel() %> <br />
                                    <strong>Quilometragem: </strong> <%= an.getKm() %> Km
                                </p>
                            </div>

                            <div class="col s3 center-align" style="height: 100%">
                                <div class="card-panel blue darken-1" style="color: rgba(255, 255, 255, 0.9);">
                                    R$ <%= an.getValor() %>
                                </div>
                            </div>

                        </div>
                   
                    <% } %>

                <% } else { %>
                <div class="row">
                    <div class="card-panel red lighten-2">
                        Ainda não há produtos cadastrados...
                    </div>
                </div>
                <% } %>
                
                <% } else { %>
                <div class="row">
                    <div class="card-panel red lighten-2">
                        Ainda não há produtos cadastrados...
                    </div>
                </div>

            <% } %>
            </div>
            
        </div>
        
    </div>

<%@include file="/WEB-INF/includes/footer.jsp" %>

</html>