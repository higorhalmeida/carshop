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
        
        <div class="row">
            <% if ( error != null ) { %>
            <div class="col s12">
                <div class="card-panel red lighten-2 certer-align">
                    <%= error %>
                </div>
            </div>
            <% } %>
        
            <% if ( success != null ) { %>
            <div class="col s12">
                <div class="card-panel green lighten-2">
                    <%= success %>
                </div>
            </div>
            <% } %>
        
            <div class="col s12">
                <h3>Preencha os dados do anuncio</h3>
            </div>
        
        
            <form class="col s12" method="POST" enctype="multipart/form-data" name="anuncio" onsubmit="return formValidate()">
                
                <div class="row">
                    <div class="input-field col s12 m12 l8 xl8">
                        <input id="titulo" name="titulo" type="text" class="validate" onblur="onBlurValidateTitulo( this )" required="required">
                        <label for="titulo">Titulo</label>
                        <small id="tituloValidate" class="hide red-text">O título deve conter, pelo menos, 10 caracteres.</small>
                    </div>
                </div>
                
                <div class="row">
                    <div class="input-field col s6 m6 l4 xl4">
                        <input id="anoFabricacao" type="number" name="anoFabricacao" class="validate" onblur="onBlurValidateFabricacao( this )" required="required">
                        <label for="anoFabricacao">Ano de Fabricação</label>
                        <small id="anoFabricacaoValidate" class="hide red-text">Não é permitido o cadastro de carros fabricados antes dos anos 50.</small>
                    </div>
                    
                    <div class="input-field col s6 m6 l4 xl4">
                        <input id="anoModelo" type="number" name="anoModelo" class="validate" onblur="onBlurValidateModelo( this )" required="required">
                        <label for="anoModelo">Ano do Modelo</label>
                        <small id="anoModeloValidate" class="hide red-text">O ano do modelo deve ser igual ou um ano maior que o ano de Fabricação</small>
                    </div>
                </div>
                
                <div class="row">
                    
                    <div class="input-field col s6 m6 l4 xl4">
                        <input id="km" type="number" name="km" class="validate" onblur="onBlurKmValidate( this )" required="required">
                        <label for="km">Quilometragem</label>
                        <small id="kmValidate" class="hide red-text">A quilometragem não pode ser negativa.</small>
                    </div>
                    
                    <div class="input-field col s6 m6 l4 xl4">
                        <input id="valor" type="text" name="valor" class="validate" required="required" onblur="onBlurValorValidate( this )" onKeyPress="return( moeda( this,'.',',',event ) )">
                        <label for="valor">Valor</label>
                        <small id="valorValidate" class="hide red-text">Informe um valor válido.</small>
                    </div>
                    
                </div>
                
                <div class="row">
                    <div class="input-field col s12 m12 l8 xl8">
                        
                        <select name="combustivel" class="validate" onchange="onChangeCombustivelValidate( this )" required="required">
                            <option value=""></option>
                            <option value="Gasolina">Gasolina</option>
                            <option value="Alcool">Alcool</option>
                            <option value="Flex">Flex</option>
                            <option value="Biogás">Biogás</option>
                        </select>
                        
                        <label>Tipo de Combustível</label>
                        <small id="combustivelValidate" class="hide red-text">Selecione um tipo de combustivel.</small>
                        
                    </div>

                </div>
                
                <div class="row">
                    
                    <div class="input-field col s12 m12 l8 xl8">
                        <%
                            List< Categoria > categoria = (List) request.getAttribute( "categoria" );
                        %>
                        
                        <select name="categoria" onchange="onChangeCategoriaValidate( this )" required="required">
                            <option value=""></option>
                        <% for ( Categoria c : categoria ) { %>
                            <option value="<%= c.getId() %>"><%= c.getNome() %></option>
                        <% } %>
                        </select>
                        
                        <label>Categoria</label>
                        <small id="categoriaValidate" class="hide red-text">Selecione uma categoria.</small>
                        
                    </div>

                </div>
                
                <div class="row">
                    <div class="file-field input-field col s12 m12 l8 xl8">
                        
                        <div class="btn">
                            <span>Imagem</span>
                            <input type="file" name="imagem" required="required" accept="image/png,image/jpg,image/jpeg" />
                        </div>
                        <div class="file-path-wrapper">
                            <input type="text" class="validate file-path" placeholder="Insira a imagem do seu anuncio" required="required">
                        </div>
                        <small id="imagemValidate" class="hide red-text">Selecione uma imagem.</small>
                    </div>
                </div>
                
                <div class="row">
                    
                    <div class="input-field col s12">
                        <textarea id="descricao" name="descricao" class="materialize-textarea" onblur="onBlurValidateDescricao( this )" required="required"></textarea>
                        <label for="descricao">Descrição</label>
                        <small id="descricaoValidate" class="hide red-text">A descrição do seu anuncio deve conter, pelo menos, 50 caracteres.</small>
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
    
    <script type="text/javascript">
        
        /** onBlur Functions **/
        
        function onBlurValidateTitulo( titulo ) {
            if ( titulo.value.length < 10 ) {
                titulo.classList.remove( "validate" );
                titulo.classList.add( "invalid" );
                document.getElementById("tituloValidate").classList.remove("hide");
            } else {
                titulo.classList.remove( "invalid" );
                titulo.classList.add( "valid" );
                document.getElementById("tituloValidate").classList.add("hide");
            }
        }

        function onBlurValidateFabricacao( anoFabricacao ) {            
            
            if ( anoFabricacao.value < 1950 ) {
                anoFabricacao.classList.remove( "validate" );
                anoFabricacao.classList.add( "invalid" );
                document.getElementById("anoFabricacaoValidate").classList.remove("hide");
            } else {
                anoFabricacao.classList.remove( "invalid" );
                anoFabricacao.classList.add( "valid" );
                document.getElementById("anoFabricacaoValidate").classList.add("hide");
            }
        }
        
        function onBlurValidateModelo( anoModelo ) {            
            
            var anoFabricacao = parseFloat( document.anuncio.anoFabricacao.value );
            
            if ( anoModelo.value < anoFabricacao || anoModelo.value > anoFabricacao + 1 ) {
                anoModelo.classList.remove( "validate" );
                anoModelo.classList.add( "invalid" );
                document.getElementById("anoModeloValidate").classList.remove("hide");
            } else {
                anoModelo.classList.remove( "invalid" );
                anoModelo.classList.add( "valid" );
                document.getElementById("anoModeloValidate").classList.add("hide");
            }
        }

        function onBlurKmValidate( km ) {            
            
            if ( km.value < 0 ) {
                km.classList.remove( "validate" );
                km.classList.add( "invalid" );
                document.getElementById("kmValidate").classList.remove("hide");
            } else {
                km.classList.remove( "invalid" );
                km.classList.add( "valid" );
                document.getElementById("kmValidate").classList.add("hide");
            }
        }
        
        function onBlurValorValidate( valor ) {
            
            if ( valor.value <= 0 || valor.value.length <= 3 ) {
                valor.classList.remove( "validate" );
                valor.classList.add( "invalid" );
                document.getElementById("valorValidate").classList.remove("hide");
            } else {
                valor.classList.remove( "invalid" );
                valor.classList.add( "valid" );
                document.getElementById("valorValidate").classList.add("hide");
            }
            
        }
        
        function onChangeCombustivelValidate( select ) {
            
            if ( select.value === null || select.value === "" || select.value === undefined ) {
                select.classList.remove( "validate" );
                select.classList.add( "invalid" );
                document.getElementById("combustivelValidate").classList.remove("hide");
            } else {
                select.classList.remove( "invalid" );
                select.classList.add( "valid" );
                document.getElementById("combustivelValidate").classList.add("hide");
            }
        }
        
        function onChangeCategoriaValidate( select ) {
            
            if ( select.value === null || select.value === "" || select.value === undefined ) {
                select.classList.remove( "validate" );
                select.classList.add( "invalid" );
                document.getElementById("categoriaValidate").classList.remove("hide");
            } else {
                select.classList.remove( "invalid" );
                select.classList.add( "valid" );
                document.getElementById("categoriaValidate").classList.add("hide");
            }
        }
        
        function onBlurValidateDescricao( descricao ) {
            if ( descricao.value.length < 10 ) {
                descricao.classList.remove( "validate" );
                descricao.classList.add( "invalid" );
                document.getElementById("descricaoValidate").classList.remove("hide");
            } else {
                descricao.classList.remove( "invalid" );
                descricao.classList.add( "valid" );
                document.getElementById("descricaoValidate").classList.add("hide");
            }
        }
        
        /** Vars **/
        
        var titulo = document['anuncio']['titulo'];
        var fabricacao = document['anuncio']['anoFabricacao'];
        var modelo = document['anuncio']['anoModelo'];
        var km = document['anuncio']['km'];
        var valor = document['anuncio']['valor'];
        var combustivel = document['anuncio']['combustivel'];
        var categoria = document['anuncio']['categoria'];
        var imagem = document['anuncio']['imagem'];
        var descricao = document['anuncio']['descricao'];

        /** Form Validation **/
        
        function formValidate( ) {
            
            if ( !validateTitulo( titulo ) ) {
                titulo.classList.remove( "validate" );
                titulo.classList.add( "invalid" );
                document.getElementById("tituloValidate").classList.remove("hide");

                return false;
            }
            
            if ( !validateAnoFabricacao( fabricacao ) ) {
                fabricacao.classList.remove( "validate" );
                fabricacao.classList.add( "invalid" );
                document.getElementById("anoFabricacaoValidate").classList.remove("hide");
                
                return false;
            }
            
            if ( !validateAnoModelo( modelo ) ) {
                modelo.classList.remove( "validate" );
                modelo.classList.add( "invalid" );
                document.getElementById("anoModeloValidate").classList.remove("hide");
                return false;
            }
            
            if ( !validateKm( km ) ) {
                km.classList.remove( "validate" );
                km.classList.add( "invalid" );
                document.getElementById("kmValidate").classList.remove("hide");
                
                return false;
            }
            
            if ( !validateValor( valor ) ) {
                valor.classList.remove( "validate" );
                valor.classList.add( "invalid" );
                document.getElementById("valorValidate").classList.remove("hide");
                
                return false;
            }
            
            if ( !validateSelectField( combustivel ) ) {
                combustivel.classList.remove( "validate" );
                combustivel.classList.add( "invalid" );
                document.getElementById("combustivelValidate").classList.remove("hide");
                
                return false;
            }
            
            if ( !validateFileField( categoria ) ) {
                categoria.classList.remove( "validate" );
                categoria.classList.add( "invalid" );
                document.getElementById("categoriaValidate").classList.remove("hide");
                
                return false;
            }
            
            if ( !validateFileField( imagem ) ) {
                imagem.classList.remove( "validate" );
                imagem.classList.add( "invalid" );
                document.getElementById("imagemValidate").classList.remove("hide");
                
                return false;
            }
            
            if ( !validateDescricao( descricao ) ) {
                descricao.classList.remove( "validate" );
                descricao.classList.add( "invalid" );
                document.getElementById("descricaoValidate").classList.remove("hide");
                
                return false;
            }
                
            return false;
        }
        
        /** Used by Form Validation **/
    
        function validateTitulo( titulo ) {
            return titulo.value.length > 10;
        }    
        
        function validateAnoFabricacao( anoFabricacao ) {
            return anoFabricacao.value >= 1950;
        }
        
        function validateAnoModelo( anoModelo ) {
            return anoModelo.value === fabricacao.value || anoModelo >= parseFloat( fabricacao.value + 1 );
        }
        
        function validateKm( km ) {
            return km.value >= 0;
        }
        
        function validateValor( valor ) {
            return valor.value > 0;
        }

        function validateSelectField( select ) {
            return select.value != null || select.value != "" || select.value != undefined;
        }

        function validateFileField( fileInput ) {
            return fileInput.value != null || fileInput.value != "" || fileInput.value != undefined
        }

        function validateDescricao( descricao ) {
            return descricao.value.length > 50;
        }

        /** Masks **/
        
        function moeda(a, e, r, t) {
            let n = ""
              , h = j = 0
              , u = tamanho2 = 0
              , l = ajd2 = ""
              , o = window.Event ? t.which : t.keyCode;
            if (13 == o || 8 == o)
                return !0;
            if (n = String.fromCharCode(o),
            -1 == "0123456789".indexOf(n))
                return !1;
            for (u = a.value.length,
            h = 0; h < u && ("0" == a.value.charAt(h) || a.value.charAt(h) == r); h++)
                ;
            for (l = ""; h < u; h++)
                -1 != "0123456789".indexOf(a.value.charAt(h)) && (l += a.value.charAt(h));
            if (l += n,
            0 == (u = l.length) && (a.value = ""),
            1 == u && (a.value = "0" + r + "0" + l),
            2 == u && (a.value = "0" + r + l),
            u > 2) {
                for (ajd2 = "",
                j = 0,
                h = u - 3; h >= 0; h--)
                    3 == j && (ajd2 += e,
                    j = 0),
                    ajd2 += l.charAt(h),
                    j++;
                for (a.value = "",
                tamanho2 = ajd2.length,
                h = tamanho2 - 1; h >= 0; h--)
                    a.value += ajd2.charAt(h);
                a.value += r + l.substr(u - 2, u)
            }
            return !1
        }

    </script>
    
    <%@include file="/WEB-INF/includes/footer.jsp" %>
</html>