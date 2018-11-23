<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <%@include file="/WEB-INF/includes/head.jsp" %>
    <%@include file="/WEB-INF/includes/topMenu.jsp" %>

    <%
        String error = (String) request.getAttribute( "error" );
        String success = (String) request.getAttribute( "success" );
    %>

    <div class="container">
        
        <div>
            <h3>Preencha o formulário para entrar em contato com o maior site de anuncios do Brasil</h3>
        </div>
        
        <% if ( error != null ) { %>
        <div class="card-panel red lighten-2">
            <%= error %>
        </div>
        <% } %>
        
        <% if ( success != null ) { %>
        <div class="card-panel green lighten-2">
            <%= success %>
        </div>
        <% } %>
        
        <div class="row">
            <form class="col s12" method="POST">
                
                <div class="row">
                    <div class="input-field col s6">
                        <input id="nome" name="nome" type="text" class="validate">
                        <label for="nome">Nome</label>
                    </div>
                </div>
                
                <div class="row">
                    <div class="input-field col s6">
                        <input id="email" type="email" name="email" class="validate">
                        <label for="email">E-mail</label>
                    </div>
                </div>
                
                <div class="row">
                    
                    <div class="input-field col s12">
                        <textarea id="mensagem" name="mensagem" class="materialize-textarea"></textarea>
                        <label for="mensagem">Mensagem</label>
                    </div>
                    
                </div>
                
                <div class="row">
                    <input type="submit" value="Enviar Mensagem" class="waves-effect waves-light btn" />
                </div>
                
            </form>
        </div>

    </div>
    
    <%@include file="/WEB-INF/includes/footer.jsp" %>
</html>