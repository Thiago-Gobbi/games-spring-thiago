<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Editar Plataforma</title>
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
                            <a class="nav-link" href="/jogo/list">Jogos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/categoria/list">Categorias</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/plataforma/list">Plataformas</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Conteúdo Principal -->
        <div class="container mt-5">
            <h1>Editar Plataforma</h1>
            <form action="/plataforma/update" method="post">
                <!-- Campo oculto para o ID da plataforma -->
                <input type="hidden" name="id" value="${plataforma.id}" />
                
                <!-- Campo para editar o nome da plataforma -->
                <div class="form-group mb-3">
                    <label for="nome">Nome:</label>
                    <input type="text" name="nome" class="form-control" value="${plataforma.nome}" required />
                </div>

                <!-- Botões de ação -->
                <div class="d-flex justify-content-between">
                    <a href="/plataforma/list" class="btn btn-secondary">Voltar</a>
                    <button type="submit" class="btn btn-success">Salvar</button>
                </div>
            </form>
        </div>

        <!-- Scripts do Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
    </body>
</html>
