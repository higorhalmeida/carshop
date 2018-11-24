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
        
        <div class="col s3 m3 l4 xl4 hide-on-med-and-down" >
    
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
            
            
            <% if ( categoria != null ) { %>
        
            <div class="collection">
                <% for ( Categoria c : categoria ) { %>
                <a href="categoria?id=<%= c.getId() %>" class="collection-item" >
                    <%= c.getNome() %>
                </a>
                <% } %>
            </div>

            <% } else { %>
            
            <div class="card-panel red lighten-2">
                Ainda não há categorias cadastradas...
            </div>
            
            <% } %>
        </div>
        
        <div class="col s12 m12 hide-on-large-only" >
    
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
            
            
            <% if ( categoria != null ) { %>
        
            <div class="collection">
                <% for ( Categoria c : categoria ) { %>
                <a href="categoria?id=<%= c.getId() %>" class="collection-item" >
                    <%= c.getNome() %>
                </a>
                <% } %>
            </div>

            <% } else { %>
            
            <div class="card-panel red lighten-2">
                Ainda não há categorias cadastradas...
            </div>
            
            <% } %>
        </div>
        
        <div class="col s12 m12 l8 xl8">
            <h3 style="margin: 0 0 37px 0">Veículos Anunciados</h3>
            
            <% if ( anuncio != null ) { %>
            
                <% if ( anuncio.size() >= 1 ) { %>

                    <% for ( Anuncio an : anuncio ) { %>
                        
                        <div class="row">

                            <div class="col s12 m12 l4 xl4">

                                <div class="card hoverable" style="margin-top: 0 !important">

                                    <div class="card-image waves-effect waves-block waves-light">
                                        <img class="activator" src="img?caminho=<%= an.getImagem() %>">
                                    </div>

                                    <div class="card-content">
                                        <span class="card-title activator grey-text text-darken-4"><%= an.getTitulo() %><i class="material-icons right">more_vert</i></span>
                                        <p>
                                            <a class="waves-effect waves-light btn" href="anuncio-detalhes?id=<%= an.getId() %>">Ver mais</a>
                                        </p>
                                    </div>

                                    <div class="card-reveal">
                                        <span class="card-title grey-text text-darken-4"><%= an.getTitulo() %><i class="material-icons right">close</i></span>
                                        <p><%= an.getDescricao() %></p>
                                    </div>

                                </div>

                            </div>

                            <div class="col s12 m12 l5 xl5">
                                <a class="black-text" href="anuncio-detalhes?id=<%= an.getId() %>">
                                    <h4><%= an.getTitulo() %></h4>
                                </a>
                                <p>
                                    <strong>Ano - Modelo: </strong><%= an.getAnoFabricacao() %> - <%= an.getAnoModelo() %> <br />
                                    <strong>Combustivel: </strong> <%= an.getCombustivel() %> <br />
                                    <strong>Quilometragem: </strong> <%= an.getKm() %> Km <br />
                                    <strong>Anunciado em: </strong> <%= an.getDataCadastro()%>
                                </p>
                            </div>

                            <div class="col s12 m12 l3 xl3 center-align">
                                <a class="black-text" href="anuncio-detalhes?id=<%= an.getId() %>">
                                    <div class="card-panel blue darken-1" style="color: rgba(255, 255, 255, 0.9);">
                                        <script>
                                            document.write( ( <%= an.getValor() %> ).toLocaleString( 'pt-BR' , { minimumFractionDigits: 2 , style: 'currency', currency: 'BRL' } ) );
                                        </script>
                                    </div>
                                </a>
                            </div>

                        </div>
                   
                    <% } %>

                <% } else { %>
                <div class="row">
                    <div class="col s12" >
                        <div class="card-panel red lighten-2">
                            Ainda não há produtos cadastrados...
                        </div>
                    </div>
                </div>
                <% } %>
                
                <% } else { %>
                <div class="row">
                    <div class="col s12" >
                        <div class="card-panel red lighten-2">
                            Ainda não há produtos cadastrados...
                        </div>
                    </div>
                </div>

            <% } %>
            </div>
            
        </div>
        
    </div>

<%@include file="/WEB-INF/includes/footer.jsp" %>

</html>