<%@page import="br.com.grupointegrado.model.Categoria"%>
<%@page import="java.util.List"%>
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
        
        <div>
            <h3>Preencha os dados do anuncio</h3>
        </div>
        
        <div class="row">
            <form class="col s12" method="POST" enctype="multipart/form-data" >
                
                <div class="row">
                    <div class="input-field col s6">
                        <input id="titulo" name="titulo" type="text" class="validate">
                        <label for="titulo">Titulo</label>
                    </div>
                </div>
                
                <div class="row">
                    <div class="input-field col s3">
                        <input id="anoFabricacao" type="text" name="anoFabricacao" class="validate">
                        <label for="anoFabricacao">Ano de Fabricação</label>
                    </div>
                    
                    <div class="input-field col s3">
                        <input id="anoModelo" type="text" name="anoModelo" class="validate">
                        <label for="anoModelo">Ano do Modelo</label>
                    </div>
                </div>
                
                <div class="row">
                    
                    <div class="input-field col s3">
                        <input id="km" type="text" name="km" class="validate">
                        <label for="km">Quilometragem</label>
                    </div>
                    
                    <div class="input-field col s3">
                        <input id="valor" type="text" name="valor" class="validate">
                        <label for="valor">Valor</label>
                    </div>
                    
                </div>
                
                <div class="row">
                    <div class="input-field col s8">
                        
                        <select name="combustivel">
                            <option value="Gasolina">Gasolina</option>
                            <option value="Alcool">Alcool</option>
                            <option value="Flex">Flex</option>
                            <option value="Biogás">Biogás</option>
                        </select>
                        
                        <label>Tipo de Combustível</label>
                        
                    </div>

                </div>
                
                <div class="row">
                    
                    <div class="input-field col s8">
                        
                        <%
                            List< Categoria > categoria = (List) request.getAttribute( "categoria" );
                        %>
                        
                        <select name="categoria">
                        <% for ( Categoria c : categoria ) { %>
                            <option value="<%= c.getId() %>"><%= c.getNome() %></option>
                        <% } %>
                        </select>
                        
                        <label>Categoria</label>
                        
                    </div>

                </div>
                
                <div class="row">
                    <div class="file-field input-field col s8">
                        
                        <div class="btn">
                            <span>Imagem</span>
                            <input type="file" name="imagem" accept="image/png,image/jpg,image/jpeg" />
                        </div>
                        <div class="file-path-wrapper">
                            <input id="imagem" type="text" class="validate file-path" placeholder="Insira a imagem do seu anuncio">
                        </div>
                        
                    </div>
                </div>
                
                <div class="row">
                    
                    <div class="input-field col s12">
                        <textarea id="descricao" name="descricao" class="materialize-textarea"></textarea>
                        <label for="descricao">Descrição</label>
                    </div>
                    
                </div>
                
                <div class="row">
                    <input type="submit" value="Cadastrar" class="waves-effect waves-light btn" />
                </div>
                    
            </form>
        </div>

    </div>
        
    <!-- Javascript -->
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('select');
            var instances = M.FormSelect.init( elems );
        });

        $(document).ready(function(){
            $('select').formSelect();
        });
    </script>
    
    <%@include file="/WEB-INF/includes/footer.jsp" %>
</html>