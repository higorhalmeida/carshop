<%@page import="br.com.grupointegrado.model.Anuncio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<%@include file="/WEB-INF/includes/head.jsp" %>
<%@include file="/WEB-INF/includes/topMenu.jsp" %>

<div class="container" style="min-height: 600px;">
    
    <% Anuncio anuncio = (Anuncio) request.getAttribute( "resultado" ); %>
    <% String error = (String) request.getAttribute("error"); %>
    
    <div class="row">
        <div class="col s12">
            
            <% if ( error != null ) { %>
                <div class="card-panel red lighten-2"><%= error %></div>
            <% } %>
            
            <% if ( anuncio != null ) { %>
            <h3><%= anuncio.getTitulo() %></h3>
                <div class="row">
                    <div class="col s5">    
                        <img class="responsive-img" src="img?caminho=<%= anuncio.getImagem() %>">
                    </div>
                    
                    <div class="col s5">
                        
                        <h5 style="margin-top: 0">Detalhes do Veículo</h5>
                        
                        <p>
                            <strong>Ano de Fabricação:</strong> <%= anuncio.getAnoFabricacao() %>
                            <br />
                            <strong>Ano do Modelo:</strong> <%= anuncio.getAnoModelo() %>
                            <br />
                            <strong>Quilometragem:</strong>  <%= anuncio.getKm() %> km
                            <br />
                            <strong>Tipo do Combustível:</strong> <%= anuncio.getCombustivel()%>
                            <br />
                            <strong>Cadastrado em:</strong>  <%= anuncio.getDataCadastro() %>
                        </p>
                        
                        <h5 style="margin-top: 0">Descrição</h5>
                        
                        <p><%= anuncio.getDescricao()%></p>
                        
                        
                    </div>
                        
                    <div class="col s2">
                        <div class="card-panel blue lighten-2 center-align" style="color: #FFF; font-weight: bolder;">R$ <%= anuncio.getValor() %></div>
                    </div>
                        
                </div>
                        
            <% } else { %>
                <div class="card-panel red lighten-2">Não há resultados para sua busca.</div>
            <% } %>
            
            
        </div>
    </div>

        
</div>

<%@include file="/WEB-INF/includes/footer.jsp" %>
    
</html>