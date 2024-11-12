<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Editar Jogo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Barra de Navegação -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Sistema de Jogos</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="/">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/jogo/list">Jogos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/categoria/list">Categorias</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/plataforma/list">Plataformas</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Conteúdo Principal -->
        <div class="container mt-5">
            <h1>Editar Jogo</h1>
            <form action="/jogo/update" method="post">
                <!-- Campo oculto para o ID do jogo -->
                <input type="hidden" name="id" value="${jogo.id}" />
                
                <!-- Campo para editar o título do jogo -->
                <div class="form-group mb-3">
                    <label for="titulo">Título:</label>
                    <input type="text" name="titulo" class="form-control" value="${jogo.titulo}" required />
                </div>

                <!-- Campo para selecionar a categoria do jogo -->
                <div class="form-group mb-3">
                    <label for="categoria">Categoria:</label>
                    <select name="categoria" class="form-select" required>
                        <c:forEach var="c" items="${categorias}">
                            <option value="${c.id}" ${c.id == jogo.categoria.id ? "selected" : ""}>
                                ${c.nome}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Campo para selecionar as plataformas associadas ao jogo -->
                <div class="form-group mb-3">
                    <label for="plataforma">Plataforma(s):</label>
                    <c:forEach var="p" items="${plataformas}">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" 
                                   class="custom-control-input" 
                                   name="plataformas" 
                                   value="${p.id}" 
                                   id="plataforma_${p.id}"
                                   ${plataformasIds.contains(p.id) ? "checked" : ""} />
                            <label class="custom-control-label" for="plataforma_${p.id}">${p.nome}</label>
                        </div>
                    </c:forEach>
                </div>

                <!-- Botões de ação -->
                <div class="d-flex justify-content-between">
                    <a href="/jogo/list" class="btn btn-secondary">Voltar</a>
                    <button type="submit" class="btn btn-success">Salvar</button>
                </div>
            </form>
        </div>

        <!-- Scripts do Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
    </body>
</html>
